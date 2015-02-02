(restas:define-module :jie
    (:use :cl
          :restas
          :cl-mongo
          :cl-json))

(in-package :jie)

(db.use "jie")

(defparameter *templates-directory*
  (merge-pathnames #P"templates/" jie-config:*base-directory*))
(defparameter *static-directory*
    (merge-pathnames #P"static/" jie-config:*base-directory*))

(defun start-jie ()
  (start :jie :port 8000))
