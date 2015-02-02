(in-package :jie)

(mount-module -static- (#:restas.directory-publisher)
  (:url "static")
  (restas.directory-publisher:*directory* *static-directory*))

(define-route main ("")
  "hello")
