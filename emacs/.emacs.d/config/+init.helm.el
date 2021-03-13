;; (use-package helm
;;   :init
;;   (custom-set-variables '(helm-command-prefix-key "C-c h"))
;; 
;;   :ensure t
;;   :bind
;;   ("M-x" . helm-M-x)
;;   ("M-y" . helm-show-kill-ring)
;;   ("C-x r b" . helm-filtered-bookmarks)
;;   ("C-x C-f" . helm-find-files)
;;   ("C-x b" . helm-mini)
;;   ("M-p" . helm-minibuffer-history-key)
;; 
;; 					;("C-c h x" . helm-register)
;;   :config
;;   (global-unset-key (kbd "C-x c"))
;; 
;;   (setq helm-semantic-fuzzy-match t
;; 	helm-imenu-fuzzy-match    t
;; 	helm-lisp-fuzzy-completion t
;; 	helm-recentf-fuzzy-match    t
;; 	helm-buffers-fuzzy-matching t
;; 	helm-M-x-fuzzy-match t
;; 	helm-completion-style 'helm-fuzzy
;; 	helm-autoresize-mode 1
;; 	helm-autoresize-mode t
;; 	helm-default-prompt-display-function 'evil-collection-helm--set-prompt-display
;; 	)
;; 
;; 
;;   (require 'helm-config)
;;   (helm-mode 1)
;;   )

(use-package helm
  :defer 1
  :diminish helm-mode
  :bind
  (("C-x C-f"       . helm-find-files)
   ;("C-x C-b"       . helm-buffers-list)
   ("C-x b"         . helm-multi-files)
   ("M-x"           . helm-M-x)
   :map helm-find-files-map
   ("C-<backspace>" . helm-find-files-up-one-level)
   ("C-f"           . helm-execute-persistent-action)
   ([tab]           . helm-ff-RET))
  :init
  (defun daedreth/helm-hide-minibuffer ()
    (when (with-helm-buffer helm-echo-input-in-header-line)
      (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
	(overlay-put ov 'window (selected-window))
	(overlay-put ov 'face
		     (let ((bg-color (face-background 'default nil)))
		       `(:background ,bg-color :foreground ,bg-color)))
	(setq-local cursor-type nil))))
  :custom
  (helm-autoresize-max-height 0)
  (helm-autoresize-min-height 40)
  (helm-buffers-fuzzy-matching t)
  (helm-recentf-fuzzy-match t)
  (helm-semantic-fuzzy-match t)
  (helm-imenu-fuzzy-match t)
  (helm-split-window-in-side-p nil)
  (helm-move-to-line-cycle-in-source nil)
  (helm-ff-search-library-in-sexp t)
  (helm-scroll-amount 8)
  (helm-echo-input-in-header-line nil)
  :config
  (require 'helm-config)
  (helm-mode 1)
  (helm-autoresize-mode 1)
  :hook
  (helm-mode .
	     (lambda ()
	       (setq completion-styles
		     (cond ((assq 'helm-flex completion-styles-alist)
			    '(helm-flex)) ;; emacs-26
			   ((assq 'flex completion-styles-alist)
			    '(flex))))))  ;; emacs-27+
  (helm-minibuffer-set-up . daedreth/helm-hide-minibuffer))

(use-package helm-flx
  :custom
  (helm-flx-for-helm-find-files t)
  (helm-flx-for-helm-locate t)
  :config
  (helm-flx-mode +1))

(use-package swiper-helm
  :bind
  ("C-s" . swiper))
