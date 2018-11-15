;;;; This file defines all of the internal errors. How they are
;;;; handled is defined in .../code/interr.lisp. How they are signaled
;;;; depends on the machine.

;;;; This software is part of the SBCL system. See the README file for
;;;; more information.
;;;;
;;;; This software is derived from the CMU CL system, which was
;;;; written at Carnegie Mellon University and released into the
;;;; public domain. The software is in the public domain and is
;;;; provided with absolutely no warranty. See the COPYING and CREDITS
;;;; files for more information.

(in-package "SB!KERNEL")

;;; This is for generating runtime/genesis/constants.h
;;; (The strings are only used in C code and are relatively unimportant)
(defun !c-stringify-internal-error (interr)
  (destructuring-bind (description . symbol) interr
    (if (stringp description)
        description
        ;; Isn't this rewording a bit pointless? OBJECT-NOT-FOO-ERROR is
        ;; descriptive enough for its use in describe_internal_error()
        (format nil "Object is not of type ~A."
                ;; Given a string "OBJECT-NOT-foo-ERROR", pull out the "foo"
                (subseq (string symbol) 11 (- (length (string symbol)) 6))))))

;; Define SB!C:+BACKEND-INTERNAL-ERRORS+ as a vector of pairs.
;; General errors have the form ("description-of-foo" . foo-ERROR)
;; and type errors are (type-spec . OBJECT-NOT-<type-spec>-ERRROR)
(macrolet
   ((compute-it (general-errors &rest type-errors)
      (let ((list
             (append
              general-errors
              ;; All simple vector specializations
              (map 'list
                   (lambda (saetp)
                     ;; Convert from specifier -> type -> specifier
                     ;; because some specializations have particular names:
                     ;;  (SIMPLE-ARRAY BASE-CHAR (*)) -> SIMPLE-BASE-STRING
                     ;;  (SIMPLE-ARRAY BIT (*)) -> SIMPLE-BIT-VECTOR
                     ;;  (SIMPLE-ARRAY T (*)) -> SIMPLE-VECTOR
                     (list
                      (type-specifier
                       (specifier-type
                        `(simple-array ,(sb!vm:saetp-specifier saetp) (*))))
                      (symbolicate "OBJECT-NOT-"
                                   (sb!vm:saetp-primitive-type-name saetp))))
                   sb!vm:*specialized-array-element-type-properties*)
              (let ((unboxed-vectors
                     (map 'list
                          (lambda (saetp)
                            (type-specifier
                             (specifier-type
                              `(simple-array ,(sb!vm:saetp-specifier saetp) (*)))))
                          (remove t sb!vm:*specialized-array-element-type-properties*
                                  :key 'sb!vm:saetp-specifier))))
                `(((integer 0 ,sb!xc:array-dimension-limit)
                   object-not-array-dimension)
                  ;; Union of all unboxed array specializations,
                  ;; for type-checking the argument to VECTOR-SAP
                  ((or ,@unboxed-vectors) object-not-simple-specialized-vector)
                  ;; For type-checking the argument to array blt functions
                  ;; that take either a SAP or an unboxed vector.
                  ;; KLUDGE: fragile, as the order of OR terms has to match
                  ;; exactly the type constraint in the blt functions.
                  ((or ,@unboxed-vectors system-area-pointer)
                   object-not-sap-or-simple-specialized-vector)))
              type-errors)))
        ;; Error number must be of type (unsigned-byte 8).
        (assert (<= (length list) 256))
        `(defconstant-eqx sb!c:+backend-internal-errors+
               ,(map 'vector
                     (lambda (x)
                       (if (symbolp x)
                           (cons x (symbolicate "OBJECT-NOT-" x "-ERROR"))
                           (cons (car x) (symbolicate (cadr x) "-ERROR"))))
                     list)
               #'equalp))))
 (compute-it
  ;; Keep the following two subsets of internal errors in this order:
  ;;
  ;; (I) all the errors which are not a TYPE-ERROR.
  ;; FIXME: These should either consistently be sentences beginning with
  ;; a capital letter and ending with a period, or consistently not that,
  ;; instead of a random mix of both.
  (("unknown system lossage" unknown)
   ("An attempt was made to use an undefined FDEFINITION." undefined-fun)
   #!+(or arm arm64 x86-64)
   ("An attempt was made to use an undefined alien function" undefined-alien-fun)
   ("invalid argument count" invalid-arg-count)
   ("bogus argument to VALUES-LIST" bogus-arg-to-values-list)
   ("An attempt was made to use an undefined SYMBOL-VALUE." unbound-symbol)
   ("attempt to RETURN-FROM a block that no longer exists" invalid-unwind)
   ("attempt to THROW to a non-existent tag" unseen-throw-tag)
   ("division by zero" division-by-zero)
   ("Object is of the wrong type." object-not-type)
   ("odd number of &KEY arguments" odd-key-args)
   ("unknown &KEY argument" unknown-key-arg)
   ("invalid array index" invalid-array-index)
   ("wrong number of indices" wrong-number-of-indices)
   ("A function with declared result type NIL returned." nil-fun-returned)
   ("An array with element-type NIL was accessed." nil-array-accessed)
   ("Object layout is invalid. (indicates obsolete instance)" layout-invalid)
   ("Thread local storage exhausted." tls-exhausted))

  ;; (II) All the type specifiers X for which there is a unique internal
  ;;      error code corresponding to a primitive object-not-X-error.
  function
  list
  bignum
  ratio
  single-float
  double-float
  #!+long-float long-float
  simple-string
  fixnum
  vector
  string
  base-string
  ((vector nil) object-not-vector-nil)
  #!+sb-unicode ((vector character) object-not-character-string)
  bit-vector
  array
  number
  rational
  float
  real
  integer
  cons
  symbol
  (system-area-pointer object-not-sap)
  simple-array
  ((signed-byte 32) object-not-signed-byte-32)
  ((signed-byte 64) object-not-signed-byte-64) ; regardless of word size
  unsigned-byte
  ((unsigned-byte 8) object-not-unsigned-byte-8)
  ;; ANSI-STREAM-IN-BUFFER-LENGTH bounds check type
  ((unsigned-byte 9) object-not-unsigned-byte-9)
  ((unsigned-byte 32) object-not-unsigned-byte-32)
  ((unsigned-byte 64) object-not-unsigned-byte-64) ; regardless of word size
  complex
  ((complex rational) object-not-complex-rational)
  ((complex float) object-not-complex-float)
  ((complex single-float) object-not-complex-single-float)
  ((complex double-float) object-not-complex-double-float)
  #!+long-float ((complex long-float) object-not-complex-long-float)
  #!+sb-simd-pack simd-pack
  weak-pointer
  instance
  character
  ((and vector (not simple-array)) object-not-complex-vector)

  ;; Now, in approximate order of descending popularity.
  ;; If we exceed 255 error numbers, trailing ones can be deleted arbitrarily.
  (sb!c:sc object-not-storage-class) ; the single most popular type
  sb!c:tn-ref
  index
  ctype
  sb!impl::buffer
  sb!c::vop
  sb!c::basic-combination
  sb!sys:fd-stream
  layout
  (sb!assem:segment object-not-assem-segment)
  sb!c::cblock
  sb!disassem:disassem-state
  sb!c::ctran
  sb!c::clambda
  sb!c:tn
  ((or function symbol) object-not-callable)
  sb!c:component
  ((or index null) object-not-index-or-null)
  stream
  sb!c::ir2-block
  sb!c::ir2-component
  type-class
  sb!c::lvar
  sb!c::vop-info
  (sb!disassem:instruction object-not-disassembler-instruction)
  ((mod 1114112) object-not-unicode-code-point)
  (sb!c::node object-not-compiler-node)
  sequence
  sb!c::functional
  ((member t nil) object-not-boolean)
  sb!c::lambda-var
  sb!alien::alien-type-class
  lexenv
  ;; simple vector-of-anything is called a "rank-1-array"
  ;; because "simple-vector" means (simple-array t (*))
  ((simple-array * (*)) object-not-simple-rank-1-array)
  hash-table
  sb!c::combination
  numeric-type
  defstruct-description
  sb!format::format-directive
  package
  form-tracking-stream
  ansi-stream))

(defun error-number-or-lose (name)
  (or (position name sb!c:+backend-internal-errors+
                :key #'cdr :test #'eq)
      (error "unknown internal error: ~S" name)))
