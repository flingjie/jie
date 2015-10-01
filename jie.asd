(defpackage :jie-config (:export *base-directory* *blog-directory*))
(defparameter jie-config:*base-directory*
  #P"~/quicklisp/local-projects/jie/")
(defparameter jie-config:*blog-directory*
  #P"~/workspace/blog/")


(asdf:defsystem :jie
    :name "jie"
    :author "flingjie <fanlingjie.cn@gmail.com>"
    :version "1.0"
    :description "Jie's knowledge management system"
    :components ((:file "defmodule")
                 (:file "views" :depends-on ("defmodule"))
                 (:file "models" :depends-on ("defmodule"))
                 (:file "controllers"
                        :depends-on ("defmodule"
                                     "views"
                                     "models")))
    :depends-on (:restas
                 :restas-directory-publisher
                 :cl-mongo
                 :cl-json
                 :closure-template
                 :coleslaw
                 :closure-template))
