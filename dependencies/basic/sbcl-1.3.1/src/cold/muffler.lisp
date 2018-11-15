;;;; This software is part of the SBCL system. See the README file for
;;;; more information.
;;;;
;;;; This software is derived from the CMU CL system, which was
;;;; written at Carnegie Mellon University and released into the
;;;; public domain. The software is in the public domain and is
;;;; provided with absolutely no warranty. See the COPYING and CREDITS
;;;; files for more information.

;;; This file deliberately lacks an IN-PACKAGE.
;;; so that the functions go in a package determined by the scaffolding.

;; These have to be stated three times:
;;  - once for the host if self-hosted,
;;  - once for the cross-compiler (but substituting SB!INT for SB-INT)
;;  - once again for warm load.

;; This avoids muffling "could not optimize away %SAP-ALIEN"
;; and "SAP to pointer conversion" in case we care.
(defun unable-to-optimize-note-p (condition)
  (and (typep condition
              #-sb-xc 'sb-int:simple-compiler-note  ; make-host-1 and warm
              #+sb-xc 'sb!int:simple-compiler-note) ; make-host-2
       (or (search "unable to" (simple-condition-format-control condition))
           (let ((args (simple-condition-format-arguments condition)))
             (and (typep (car args) '(cons string))
                  (search "forced to do" (caar args)))))))

(defun optional+key-style-warning-p (condition)
    (and (typep condition '(and simple-condition style-warning))
         (search "&OPTIONAL and &KEY found"
                 (simple-condition-format-control condition))))
