(in-package :jie)

(mount-module -static- (#:restas.directory-publisher)
  (:url "static")
  (restas.directory-publisher:*directory* *static-directory*))

(mount-module -blog- (#:restas.directory-publisher)
  (:url "blog")
  (restas.directory-publisher:*directory* *blog-directory*))

(define-route home ("")
  (render-template (gist:head)
                   (gist:content (list :gists (get-all-gists)))))

(define-route gist/update ("gist" :method :post)
  (let ((title (hunchentoot:post-parameter "title"))
        (content (hunchentoot:post-parameter "content")))
    (update-gist title content)
    (format nil "update ok")))

(define-route gist/delete ("gist/:id/del")
  (progn
    (delete-gist (hunchentoot:url-decode id))
    (redirect (genurl 'home))))

(define-route editor ("editor")
  (render-template (editor:head) (editor:content)))

(define-route gist/? ("gist/:(id)")
  (let ((gist (find-one-gist (hunchentoot:url-decode id))))
    (render-template (editor:head) (editor:content (list :gist gist)))))

(define-route gtd ("gtd")
  (render-template (gtd:head) (gtd:content)))

(defun render-template (head content)
  (views:base (list :head head
                    :content content)))

