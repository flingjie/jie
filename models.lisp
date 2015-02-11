(in-package :jie)

(db.use "jie")

(defparameter col-gists "gists")
(defparameter col-tasks "tasks")

(defclass gist ()
  ((id :initarg :id)
   (title :initarg :title)
   (content :initarg :content)
   (time :initarg :time)))

(defun update-gist (title content)
  (db.update col-gists ($ "title" title)
             ($ ($ "content" content)
                ($ "title" title)
                ($ "time" (get-universal-time)))
             :upsert t))

(defun delete-gist (title)
  (db.delete col-gists($ "title" title)))

(defun find-one-gist (title)
  (let ((gist (car (docs (db.find col-gists ($ "title" title))))))
    (make-instance 'gist
                   :title (get-element "title" gist)
                   :content (get-element "content" gist))))

(defun get-all-gists ()
  (let ((results (docs (db.sort col-gists :all :field "time" :asc nil))))
    (loop for doc in results
       collect
         (make-instance
          'gist
          :id (hunchentoot:url-encode (get-element "title" doc))
          :title (get-element "title" doc)
          :content (markdown->html (get-element "content" doc))
          :time (timestamp->datetime (get-element "time" doc))))))

(defun markdown->html (markdown)
  (with-output-to-string (s)
    (3bmd:parse-string-and-print-to-stream markdown s)))

(defun timestamp->datetime (timestamp)
  (multiple-value-bind
        (sec min hour day month year day-of-week dst-p tz)
      (decode-universal-time timestamp)
    (format nil "~d-~2,'0d-~2,'0d ~2,'0d:~2,'0d:~2,'0d"
          year month day hour min sec)))
