(setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize) ;; You might already have this line

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("e396098fd5bef4f0dd6cedd01ea48df1ecb0554d8be0d8a924fb1d926f02f90f" "acfac6b14461a344f97fad30e2362c26a3fe56a9f095653832d8fc029cb9d05c" "332fcf3c7208aca9fab65d54203f78a242482e7fd65f5725a2482c20b1730732" "11e57648ab04915568e558b77541d0e94e69d09c9c54c06075938b6abc0189d8" default)))
 '(display-line-numbers-type (quote visual))
 '(global-display-line-numbers-mode t)
 '(helm-completion-style (quote emacs))
 '(package-selected-packages
   (quote
    (git-gutter lsp-ui srefactor flucui-themes smartparens rainbow-delimiters slime-theme slime-company color-theme winum helm-lines treemacs-magit treemacs-icons-dired treemacs-projectile treemacs-evil lsp-treemacs company-lsp helm-lsp dap-mode use-package flycheck lsp-mode markdown-mode+ evil dracula-theme molokai-theme)))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(slime-company-after-completion (quote slime-company-just-one-space))
 '(slime-company-complete-in-comments-and-strings t)
 '(slime-company-completion (quote fuzzy))
 '(slime-company-major-modes (quote (lisp-mode)))
 '(smartparens-global-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 102 :width normal)))))

(require 'evil)
(evil-mode 1)
;; Color the evil tag - colors taken from spaceline
(setq evil-normal-state-tag   (propertize " <Normal> " 'face '((:background "DarkGoldenrod2" :foreground "black")))
      evil-emacs-state-tag    (propertize " <Emacs> " 'face '((:background "SkyBlue2"       :foreground "black")))
      evil-insert-state-tag   (propertize " <Insert> " 'face '((:background "chartreuse3"    :foreground "black")))
      evil-replace-state-tag  (propertize " <Replace> " 'face '((:background "chocolate"      :foreground "black")))
      evil-motion-state-tag   (propertize " <Motion> " 'face '((:background "plum3"          :foreground "black")))
      evil-visual-state-tag   (propertize " <Visual> " 'face '((:background "gray"           :foreground "black")))
      evil-operator-state-tag (propertize " <Operator> " 'face '((:background "sandy brown"    :foreground "black"))))


(use-package treemacs
  :ensure t
  :defer t
  :init (with-eval-after-load 'winum
	  (define-key winum-keymap (kbd "M-0") #'treemacs-select-window)):config
  (progn
    (setq treemacs-collapse-dirs (if treemacs-python-executable 3 0)
	  treemacs-deferred-git-apply-delay
	  0.5
	  treemacs-display-in-side-window
	  t
	  treemacs-eldoc-display
	  t
	  treemacs-file-event-delay
	  5000
	  treemacs-file-follow-delay
	  0.2
	  treemacs-follow-after-init
	  t
	  treemacs-git-command-pipe
	  ""
	  treemacs-goto-tag-strategy
	  'refetch-index
	  treemacs-indentation
	  1
	  treemacs-indentation-string
	  " "
	  treemacs-is-never-other-window
	  nil
	  treemacs-max-git-entries
	  5000
	  treemacs-missing-project-action
	  'ask
	  treemacs-no-png-images
	  nil
	  treemacs-no-delete-other-windows
	  t
	  treemacs-project-follow-cleanup
	  t
	  treemacs-persist-file
	  (expand-file-name ".cache/treemacs-persist"
			    user-emacs-directory)
	  treemacs-position
	  'left
	  treemacs-recenter-distance
	  0.1
	  treemacs-recenter-after-file-follow
	  t
	  treemacs-recenter-after-tag-follow
	  t
	  treemacs-recenter-after-project-jump
	  'always
	  treemacs-recenter-after-project-expand
	  'on-distance
	  treemacs-show-cursor
	  t
	  treemacs-show-hidden-files
	  t
	  treemacs-silent-filewatch
	  t
	  treemacs-silent-refresh
	  t
	  treemacs-sorting
	  'alphabetic-desc
	  treemacs-space-between-root-nodes
	  t
	  treemacs-tag-follow-cleanup
	  t
	  treemacs-tag-follow-delay
	  1.5
	  treemacs-width
	  35)
    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)
    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git"))) (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind (:map global-map
	      ("M-0" . treemacs-select-window)
	      ("C-x t 1" . treemacs-delete-other-windows)
	      ("C-x t t" . treemacs)
	      ("C-x t B" . treemacs-bookmark)
	      ("C-x t C-t" . treemacs-find-file)
	      ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-evil :after treemacs
  evil :ensure t)

(use-package treemacs-projectile :after treemacs
  projectile :ensure t)

(use-package treemacs-icons-dired
  :after treemacs
  dired
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit :after treemacs
  magit :ensure t)

(require 'helm)
(global-set-key (kbd "M-x")
		#'helm-M-x)
(global-set-key (kbd "C-x r b")
		#'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f")
		#'helm-find-files)
(helm-mode 1)

					;(helm-linum-relative-mode 1)
					;(helm-autoresize-mode t)
(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
(global-set-key (kbd "M-y")
		'helm-show-kill-ring)
(setq helm-semantic-fuzzy-match t helm-imenu-fuzzy-match
      t)
(setq helm-locate-fuzzy-match t)
(setq helm-lisp-fuzzy-completion t)

(add-hook 'after-init-hook 'global-company-mode)

(slime-setup '(slime-fancy slime-company))
(define-key company-active-map (kbd "\C-n") 'company-select-next)
(define-key company-active-map (kbd "\C-p") 'company-select-previous)
(define-key company-active-map (kbd "\C-d") 'company-show-doc-buffer)
(define-key company-active-map (kbd "M-.") 'company-show-location)


(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)


(require 'smartparens-config)

(tool-bar-mode 0)
;(menu-bar-mode 0)
(scroll-bar-mode 0)

(global-hl-line-mode 1) 




(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files
(setq create-lockfiles nil)

(require 'srefactor)
(require 'srefactor-lisp)
(global-set-key (kbd "M-RET o") 'srefactor-lisp-one-line)
(global-set-key (kbd "M-RET m") 'srefactor-lisp-format-sexp)
(global-set-key (kbd "M-RET d") 'srefactor-lisp-format-defun)
(global-set-key (kbd "M-RET b") 'srefactor-lisp-format-buffer)



					; lsp




(require 'git-gutter)
(global-git-gutter-mode +1)
