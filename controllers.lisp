(in-package :jie)

(mount-module -static- (#:restas.directory-publisher)
  (:url "static")
  (restas.directory-publisher:*directory* *static-directory*))

(define-route main ("")
  "hello")


(define-route add/post ("add-post" :method :post)
  (let ((title (post-parameter "title"))
        (category (post-parameter "category"))
        (tags (post-parameter "tags")))
    (save-blog)))

(define-route post ("posts/:id")
  (format nil id))
