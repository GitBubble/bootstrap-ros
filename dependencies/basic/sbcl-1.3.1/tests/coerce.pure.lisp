;;;; This software is part of the SBCL system. See the README file for
;;;; more information.
;;;;
;;;; While most of SBCL is derived from the CMU CL system, the test
;;;; files (like this one) were written from scratch after the fork
;;;; from CMU CL.
;;;;
;;;; This software is in the public domain and is provided with
;;;; absolutely no warranty. See the COPYING and CREDITS files for
;;;; more information.

(in-package "CL-USER")

(with-test (:name (coerce complex :numeric-types))
  (labels ((function/optimized (type rationalp)
             (compile nil `(lambda (input)
                             (ignore-errors
                               (the ,(if rationalp
                                         `(or ,type rational)
                                         type)
                                    (coerce input ',type))))))
           (function/unoptimized (type)
             (lambda (input)
               (ignore-errors (coerce input type))))
           (check-result (kind input result type rationalp expected)
             (unless (eql result expected)
               (error "~@<~S ~Sing ~S to type ~S produced ~S, not ~S.~@:>"
                      kind 'coerce input type result expected))
             (when expected
               (if rationalp
                   (assert (typep result `(or ,type rational)))
                   (assert (typep result type)))))
           (test-case (input type expected &optional rationalp)
             (let ((result/optimized
                    (funcall (function/optimized type rationalp) input))
                   (result/unoptimized
                    (funcall (function/unoptimized type) input)))
               (check-result :optimized input result/optimized type rationalp expected)
               (check-result :unoptmized input result/unoptimized type rationalp expected))))

    (test-case     1 'complex                                      1                t)
    (test-case     1 '(complex real)                               1                t)
    (test-case     1 '(complex (real 1))                           1                t)
    (test-case     1 '(complex rational)                           1                t)
    (test-case     1 '(complex (rational 1))                       1                t)
    (test-case     1 '(complex (or (rational -3 -2) (rational 1))) 1                t)
    (test-case     1 '(complex float)                              #C(1.0e0 0.0e0))
    (test-case     1 '(complex double-float)                       #C(1.0d0 0.0d0))
    (test-case     1 '(complex single-float)                       #C(1.0f0 0.0f0))
    (test-case     1 '(complex integer)                            1                t)
    (test-case     1 '(complex (or (real 1) (integer -1 0)))       1                t)

    (test-case    -2 'complex                                      -2               t)
    (test-case    -2 '(complex real)                               -2               t)
    (test-case    -2 '(complex (real 1))                           -2               t)
    (test-case    -2 '(complex rational)                           -2               t)
    (test-case    -2 '(complex (rational 1))                       -2               t)
    (test-case    -2 '(complex (or (rational -3 -2) (rational 1))) -2               t)
    (test-case    -2 '(complex float)                              #C(-2.0e0 0.0e0))
    (test-case    -2 '(complex double-float)                       #C(-2.0d0 0.0d0))
    (test-case    -2 '(complex single-float)                       #C(-2.0f0 0.0f0))
    (test-case    -2 '(complex integer)                            -2               t)
    (test-case    -2 '(complex (or (real 1) (integer -1 0)))       -2               t)

    (test-case 1.1s0 'complex                                      #C(1.1s0 .0s0)   t)
    (test-case 1.1s0 '(complex real)                               #C(1.1s0 .0s0)   t)
    (test-case 1.1s0 '(complex (real 1))                           nil              t)
    (test-case 1.1s0 '(complex rational)                           nil              t)
    (test-case 1.1s0 '(complex (rational 1))                       nil              t)
    (test-case 1.1s0 '(complex (or (rational -3 -2) (rational 1))) nil              t)
    (test-case 1.1s0 '(complex float)                              #C(1.1s0 .0s0))
    (test-case 1.1s0 '(complex double-float)                       (coerce #C(1.1s0 .0s0) '(complex double-float)))
    (test-case 1.1s0 '(complex single-float)                       #C(1.1s0 .0s0))
    (test-case 1.1s0 '(complex integer)                            nil              t)
    (test-case 1.1s0 '(complex (or (real 1) (integer -1 0)))       nil              t)

    (test-case   1/2 'complex                                      1/2              t)
    (test-case   1/2 '(complex real)                               1/2              t)
    (test-case   1/2 '(complex (real 1))                           1/2              t)
    (test-case   1/2 '(complex rational)                           1/2              t)
    (test-case   1/2 '(complex (rational 1))                       1/2              t)
    (test-case   1/2 '(complex (or (rational -3 -2) (rational 1))) 1/2              t)
    (test-case   1/2 '(complex float)                              #C(.5e0 0.0e0))
    (test-case   1/2 '(complex double-float)                       #C(.5d0 0.0d0))
    (test-case   1/2 '(complex single-float)                       #C(.5f0 0.0f0))
    (test-case   1/2 '(complex integer)                            1/2              t)
    (test-case   1/2 '(complex (or (real 1) (integer -1 0)))       1/2              t)

    ;; TODO fails with vanilla COERCE (i.e. without source transform)
    ;; (test-case #C(1/2 .5e0) 'complex                                      #C(1/2 .5e0)     t)
    ;; (test-case #C(1/2 .5e0) '(complex real)                               #C(1/2 .5e0)     t)
    ;; (test-case #C(1/2 .5e0) '(complex (real 1))                           nil              t)
    ;; (test-case #C(1/2 .5e0) '(complex rational)                           nil              t)
    ;; (test-case #C(1/2 .5e0) '(complex (rational 1))                       nil              t)
    ;; (test-case #C(1/2 .5e0) '(complex (or (rational -3 -2) (rational 1))) nil              t)
    ;; (test-case #C(1/2 .5e0) '(complex float)                              #C(.5e0 .5e0))
    ;; (test-case #C(1/2 .5e0) '(complex double-float)                       #C(.5d0 .5d0))
    ;; (test-case #C(1/2 .5e0) '(complex single-float)                       #C(.5f0 .5f0))
    ;; (test-case #C(1/2 .5e0) '(complex integer)                            nil              t)
    ;; (test-case #C(1/2 .5e0) '(complex (or (real 1) (integer -1 0)))       nil              t)

    ))

(with-test (:name :coerce-symbol-to-fun)
  (flet ((coerce-it (x)
           (handler-case (sb-kernel:coerce-symbol-to-fun x)
             (simple-error (c) (simple-condition-format-control c)))))
    (assert (string= (coerce-it 'defun) "~S names a macro."))
    (assert (string= (coerce-it 'progn) "~S names a special operator."))
    (let ((foo (gensym)))
      (eval `(defmacro ,foo () 5))
      (setf (sb-int:info :function :kind foo) :function)
      (assert (string= (coerce-it foo) "~S names a macro.")))
    (let ((foo (gensym)))
      (eval `(defun ,foo () 5))
      (setf (sb-int:info :function :kind foo) :macro)
      (assert (functionp (coerce-it foo))))))
