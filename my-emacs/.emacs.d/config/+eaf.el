;; (leaf eaf
;;   :load-path "~/.emacs.d/site-lisp/emacs-application-framework" ; Set to "/usr/share/emacs/site-lisp/eaf" if installed from AUR
;;   :require t
;;   :init
;;   (leaf epc  )
;;   (leaf ctable )
;;   (leaf deferred )
;;   (leaf s )
;;   :custom
;;   (eaf-browser-continue-where-left-off . t)
;;   :config
;;   (eaf-setq eaf-browser-enable-adblocker "true")
;;   (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key take_photo "p" eaf-camera-keybinding)
;;   (eaf-bind-key nil "M-q" eaf-browser-keybinding)
;;   )
;; ;; unbind, see more in the Wiki
