
;; (use-package nano
;;   :load-path "~/.emacs.d/nano-emacs/"
;;   :init
;; 
;;   ;; Window layout (optional)
;;   (require 'nano-layout)
;; 
;;   ;; Theming Command line options (this will cancel warning messages)
;;   (add-to-list 'command-switch-alist '("-dark"   . (lambda (args))))
;;   (add-to-list 'command-switch-alist '("-light"  . (lambda (args))))
;;   (add-to-list 'command-switch-alist '("-default"  . (lambda (args))))
;; 
;;   (cond
;;    ((member "-default" command-line-args) t)
;;    ((member "-dark" command-line-args) (require 'nano-theme-dark))
;;    (t (require 'nano-theme-light)))
;; 
;;   ;; Customize support for 'emacs -q' (Optional)
;;   ;; You can enable customizations by creating the nano-custom.el file
;;   ;; with e.g. `touch nano-custom.el` in the folder containing this file.
;;   (let* ((this-file  (or load-file-name (buffer-file-name)))
;;          (this-dir  (file-name-directory this-file))
;;          (custom-path  (concat this-dir "nano-custom.el")))
;;     (when (and (eq nil user-init-file)
;;                (eq nil custom-file)
;;                (file-exists-p custom-path))
;;       (setq user-init-file this-file)
;;       (setq custom-file custom-path)
;;       (load custom-file)))
;; 
;;   ;; Theme
;;   (require 'nano-faces)
;;   (nano-faces)
;; 
;;   (require 'nano-theme)
;;   (nano-theme)
;; 
;;   (require 'nano-theme-dark)
;; 
;;   ;; Nano default settings (optional)
;;   (require 'nano-defaults)
;; 
;;   ;; Nano session saving (optional)
;;   (require 'nano-session)
;; 
;;   ;; Nano header & mode lines (optional)
;;   (require 'nano-modeline)
;; 
;;   ;; Nano key bindings modification (optional)
;;   (require 'nano-bindings)
;; 
;;   ;; Nano counsel configuration (optional)
;;   ;; Needs "counsel" package to be installed (M-x: package-install)
;;   ;; (require 'nano-counsel)
;; 
;;   ;; Welcome message (optional)
;;   (let ((inhibit-message t))
;;     (message "Welcome to GNU Emacs / N Λ N O edition")
;;     (message (format "Initialization time: %s" (emacs-init-time))))
;; 
;;   ;; Splash and help (optional)
;;   (add-to-list 'command-switch-alist '("-no-splash" . (lambda (args))))
;;   (unless (member "-no-splash" command-line-args)
;;     (require 'nano-help)
;;     (require 'nano-splash))
;;   )
