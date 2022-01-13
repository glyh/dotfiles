(in-package #:nyxt-user)

;; Import Files
(dolist (file (list (nyxt-init-file "statusline.lisp")
                    (nyxt-init-file "stylesheet.lisp")))
  (load file))

(define-configuration web-buffer
  ((gtk-extensions-path
    (make-instance 'gtk-extensions-data-path
                   :dirname "~/.config/nyxt_repo/libraries/web-extensions"))))

(nyxt/web-extensions:load-web-extension beastify "/home/lyh/.config/webextensions-examples/beastify/")

(define-configuration web-buffer
  ((default-modes `(beastify ,@%slot-default%))))
