(in-package :jie)

(mount-module -static- (#:restas.directory-publisher)
  (:url "static")
  (restas.directory-publisher:*directory* *static-directory*))

(mount-module -blog- (#:restas.directory-publisher)
  (:url "blog")
  (restas.directory-publisher:*directory* *blog-directory*))

(define-route home ("")
  (merge-pathnames "index.html" *blog-directory*))
