(leaf helm
  :bind
  ("M-x" . helm-M-x)
  ("C-x C-f" . helm-find-files)
  ("C-x b" . helm-buffers-list)
  ("C-c h m" . helm-mini)

  ("C-c h o" . helm-imenu)
  ("C-c h a" . helm-apropos)

  :config
  (setq helm-split-window-in-side-p t)
  (setq helm-window-prefer-horizontal-split t)
  (setq helm-display-buffer-reuse-frame t)

  (setq helm-buffers-fuzzy-matching t
		helm-recentf-fuzzy-match    t)

  (setq helm-completion-style 'helm-fuzzy)
  (helm-autoresize-mode 1)
  (helm-mode 1)

  (leaf helm-icons
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
	:config (helm-descbinds-mode))
  )




