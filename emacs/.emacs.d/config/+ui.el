(use-package doom-modeline
  :config
  (setq doom-modeline-height (window-font-height))
  (setq doom-modeline-project-detection 'project)
  (setq doom-modeline-buffer-encoding nil)
  (setq doom-modeline-major-mode-color-icon t)
  (setq doom-modeline-buffer-state-icon t)

  (setq doom-modeline-buffer-modification-icon t)


  
  (doom-modeline-mode)
  )


(use-package dashboard
  :demand t
  :config
  (setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")

  (setq dashboard-startup-banner "~/.emacs.d/banner/coco-cola.txt")
										;(setq dashboard-startup-banner "~/.emacs.d/banner/nasa.txt")

										;(setq dashboard-center-content t)


  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-navigator t)

  (setq dashboard-items '((recents  . 20)
						  (bookmarks . 5)
						  (projects . 5)
										;(agenda . 5)
						  (registers . 5)))
  (setq dashboard-set-init-info t)
  (dashboard-setup-startup-hook)
  (use-package beacon
	:config
	(setq
	 beacon-blink-when-focused t
	 beacon-blink-when-buffer-changes t
	 beacon-blink-when-window-scrolls t
	 beacon-blink-when-window-changes t
	 beacon-blink-when-point-moves-vertically t
	 beacon-color "red"
	 )
	(beacon-mode))
  )

