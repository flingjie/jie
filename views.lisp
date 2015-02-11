(in-package :jie)
(compile-template :common-lisp-backend
                  (merge-pathnames "base.soy" *templates-directory*))
(compile-template :common-lisp-backend
                  (merge-pathnames "gist.soy" *templates-directory*))
(compile-template :common-lisp-backend
                  (merge-pathnames "gtd.soy" *templates-directory*))
(compile-template :common-lisp-backend
                  (merge-pathnames "editor.soy" *templates-directory*))

