;;;
;;; Converted by William Lott.
;;;

(in-package "SB!VM")


;;;; The Branch VOP.

;;; The unconditional branch, emitted when we can't drop through to the desired
;;; destination.  Dest is the continuation we transfer control to.
;;;
(define-vop (branch)
  (:info dest)
  (:generator 5
    (inst b dest)))


;;;; Generic conditional VOPs

;;; The generic conditional branch, emitted immediately after test
;;; VOPs that only set flags.

(define-vop (branch-if)
  (:info dest flags not-p)
  (:ignore dest flags not-p)
  (:generator 0
     (error "BRANCH-IF not yet implemented")))

(defun convert-conditional-move-p (node dst-tn x-tn y-tn)
  (declare (ignore node dst-tn x-tn y-tn))
  nil)


;;;; Conditional VOPs:

(define-vop (if-eq)
  (:args (x :scs (any-reg descriptor-reg zero null))
         (y :scs (any-reg descriptor-reg zero null)))
  (:conditional)
  (:info target not-p)
  (:policy :fast-safe)
  (:translate eq)
  (:generator 3
    (inst cmpw x y)
    (inst b? (if not-p :ne :eq) target)))
