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

(in-package :sb-concurrency-test)

(defmacro deftest* ((name &key fails-on) form &rest results)
  `(progn
     (when (sb-impl::featurep ',fails-on)
       (pushnew ',name sb-rt::*expected-failures*))
     (deftest ,name ,form ,@results)))

;; XXX something like clock_getres(CLOCK_REALTIME, ...) would be better
(defvar *minimum-sleep*
  #+openbsd 0.01
  #-openbsd 0.0001)

(defun test-frlocks (&key (reader-count 100) (read-count 1000000)
                          (outer-read-pause 0) (inner-read-pause 0)
                          (writer-count 10) (write-count (/ 1 *minimum-sleep*))
                          (outer-write-pause *minimum-sleep*) (inner-write-pause 0))
    (let ((rw (make-frlock))
          (a 0)
          (b 0)
          (c 0)
          (run! nil)
          (w-e! (cons :write-oops nil))
          (r-e! (cons :read-oops nil)))
      (flet ((maybe-pause (pause &optional value)
               (if (eq t pause)
                   (sb-thread:thread-yield)
                   (when (> pause 0)
                     (sleep (random pause))))
               value))
        (mapc #'join-thread
             (nconc
              (loop repeat reader-count
                    collect
                       (make-thread
                        (lambda ()
                          (loop until run! do (thread-yield))
                          (handler-case
                              (loop repeat read-count
                                    do (multiple-value-bind (a b c)
                                           (frlock-read (rw)
                                             a b (maybe-pause inner-read-pause c))
                                         (maybe-pause outer-read-pause)
                                         (unless (eql c (+ a b))
                                           (sb-ext:atomic-update (cdr r-e!) #'cons
                                                                 (list a b c)))))
                            (error (e)
                              (sb-ext:atomic-update (cdr r-e!) #'cons e))))))
              (loop repeat writer-count
                    collect (make-thread
                             (lambda ()
                               (loop until run! do (thread-yield))
                               (handler-case
                                   (loop repeat write-count
                                         do (frlock-write (rw)
                                              (let* ((a_ (random 10000))
                                                     (b_ (random 10000))
                                                     (c_ (+ a_ b_)))
                                                (setf a a_
                                                      b b_
                                                      c (+ a b))
                                                (maybe-pause inner-write-pause)
                                                (unless (and (eql c c_)
                                                             (eql b b_)
                                                             (eql a a_))
                                                  (sb-ext:atomic-update (cdr w-e!) #'cons
                                                                        (list a a_ b b_ c c_)))))
                                            (maybe-pause outer-write-pause))
                                 (error (e)
                                   (sb-ext:atomic-update (cdr w-e!) #'cons e))))))
              (progn
                (setf run! t)
                nil))))
      (values (cdr w-e!) (cdr r-e!))))

#+sb-thread
(deftest* (frlock.1 :fails-on :win32)
    (handler-case
        (sb-ext:with-timeout 60 (test-frlocks))
      (sb-ext:timeout (c)
        (error "~A" c)))
  nil
  nil)
