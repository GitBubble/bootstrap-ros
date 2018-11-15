;;;; This software is part of the SBCL system. See the README file for
;;;; more information.
;;;;
;;;; This software is derived from the CMU CL system, which was
;;;; written at Carnegie Mellon University and released into the
;;;; public domain. The software is in the public domain and is
;;;; provided with absolutely no warranty. See the COPYING and CREDITS
;;;; files for more information.

(in-package "SB!IMPL")

#+sb-xc-host
(defmacro def!method (&rest args)
  `(defmethod ,@args))

(defmacro sb!xc:defmethod (&rest args) `(def!method ,@args))

#+sb-xc(defvar *delayed-def!method-args* nil)
