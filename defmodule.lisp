(restas:define-module :jie
    (:use :cl
          :restas
          :coleslaw
          :cl-mongo
          :cl-json
          :closure-template))

(in-package :jie)

(db.use "jie")

(defparameter *templates-directory*
  (merge-pathnames #P"templates/" jie-config:*base-directory*))
(defparameter *static-directory*
  (merge-pathnames #P"static/" jie-config:*base-directory*))
(defparameter *blog-directory* jie-config:*blog-directory*)

(setf hunchentoot:*show-lisp-errors-p* t)

(defun start-jie ()
  (start ':jie :port 8000))
