;;;; -*-  Lisp -*-
;;;;
;;;; This software is part of the SBCL system. See the README file for
;;;; more information.
;;;;
;;;; This software is derived from the CMU CL system, which was
;;;; written at Carnegie Mellon University and released into the
;;;; public domain. The software is in the public domain and is
;;;; provided with absolutely no warranty. See the COPYING and CREDITS
;;;; files for more information.

(in-package :cl-user)

(asdf:defsystem :sb-concurrency
  :components ((:file "package")
               (:file "frlock"   :depends-on ("package"))
               (:file "queue"    :depends-on ("package"))
               (:file "mailbox"  :depends-on ("package" "queue"))
               (:file "gate"     :depends-on ("package"))))

(asdf:defsystem :sb-concurrency-tests
  :depends-on (:sb-concurrency :sb-rt)
  :components
  ((:module tests
    :components
    ((:file "package")
     (:file "test-utils"   :depends-on ("package"))
     (:file "test-frlock"  :depends-on ("package" "test-utils"))
     (:file "test-queue"   :depends-on ("package" "test-utils"))
     (:file "test-mailbox" :depends-on ("package" "test-utils"))
     (:file "test-gate"    :depends-on ("package" "test-utils"))))))

(defmethod asdf:perform :after ((o asdf:load-op)
                                (c (eql (asdf:find-system :sb-concurrency))))
  (provide 'sb-concurrency))

(defmethod asdf:perform ((o asdf:test-op)
                         (c (eql (asdf:find-system :sb-concurrency))))
  (asdf:oos 'asdf:load-op :sb-concurrency-tests)
  (asdf:oos 'asdf:test-op :sb-concurrency-tests))

(defmethod asdf:perform ((o asdf:test-op)
                         (c (eql (asdf:find-system :sb-concurrency-tests))))
  (multiple-value-bind (soft strict pending)
      (funcall (intern "DO-TESTS" (find-package "SB-RT")))
    (declare (ignorable pending))
    (fresh-line)
    (unless strict
      #+sb-testing-contrib
      ;; We create TEST-PASSED from a shell script if tests passed.  But
      ;; since the shell script only `touch'es it, we can actually create
      ;; it ahead of time -- as long as we're certain that tests truly
      ;; passed, hence the check for SOFT.
      (when soft
        (with-open-file (s #p"SYS:CONTRIB;SB-CONCURRENCY;TEST-PASSED"
                           :direction :output)
          (dolist (pend pending)
            (format s "Expected failure: ~A~%" pend))))
      (warn "ignoring expected failures in test-op"))
    (unless soft
      (error "test-op failed with unexpected failures"))))
