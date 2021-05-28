(leaf helm
  :bind
  ("M-x" . helm-M-x)
  ("C-x C-f" . helm-find-files)
  ("C-x b" . helm-buffers-list)
  ("C-c h m" . helm-mini)

  ("C-c h o" . helm-imenu)
  ("C-c h a" . helm-apropos)

  :config
  (require 'helm-config)


  (setq helm-split-window-in-side-p t)
  (setq helm-window-prefer-horizontal-split t)
										;(setq helm-display-buffer-reuse-frame t)

  (setq helm-completion-style 'helm-fuzzy)
  (setq helm-M-x-fuzzy-match t)
  ;; helm-apropos-fuzzy-match t
  ;; helm-buffers-fuzzy-matching t
  ;; helm-locate-fuzzy-match t
  ;; helm-etags-fuzzy-match t
  ;; helm-imenu-fuzzy-match    t
  ;; helm-lisp-fuzzy-completion t
  ;; helm-session-fuzzy-match t
  ;; helm-recentf-fuzzy-match    t
  ;; helm-semantic-fuzzy-match t

  (setq helm-mode-fuzzy-match t)
  (setq helm-completion-in-region-fuzzy-match t)

  (helm-autoresize-mode 1)
  (helm-mode 1)


  (leaf helm-icons
	:custom (helm-icons-provider . 'all-the-icons)
	:config
	(helm-icons-enable)
	)

  (leaf helm-swoop
	:bind
	("M-i" . helm-swoop)
	("M-I" . helm-swoop-back-to-last-point)
	("C-c M-i" . helm-multi-swoop)
	("C-x M-i" . helm-multi-swoop-all)
	)


  (leaf helm-descbinds
	:config (helm-descbinds-mode)
	)
  )
