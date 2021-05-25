(leaf dashboard
  :config
  (setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")

  (setq dashboard-startup-banner nil)

  ;;(setq dashboard-startup-banner "~/.emacs.d/banners/logo.txt")
										;(setq dashboard-startup-banner "~/.emacs.d/banner/nasa.txt")

										;(setq dashboard-center-content nil)


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
  )

(leaf doom-modeline
  :config
  (setq doom-modeline-height  (window-font-height))
  (setq doom-modeline-project-detection  'project)
  (setq doom-modeline-buffer-encoding  nil)
  (setq doom-modeline-major-mode-color-icon  t)
  (setq doom-modeline-buffer-state-icon  t)
  (setq doom-modeline-buffer-modification-icon  t)
  (setq doom-modeline-minor-modes  nil)

  (doom-modeline-mode)
  )
;; (leaf beacon
;;    :custom
;;    (beacon-blink-when-focused t)
;;    (beacon-blink-when-buffer-changes t)
;;    (beacon-blink-when-window-scrolls t)
;;    (beacon-blink-when-window-changes t)
;;    (beacon-blink-when-point-moves-vertically t)
;;    (beacon-color "#888888")
;;    :config
;;    (beacon-mode))

(leaf paren
  :config
  (show-paren-mode 1))



(leaf centaur-tabs
  :bind
  :config
  (centaur-tabs-mode t)
  (setq centaur-tabs-set-icons t)
  (setq centaur-tabs-height 32)
  (setq centaur-tabs-set-bar 'over)
  (setq centaur-tabs-set-modified-marker t)
  (setq centaur-tabs-modified-marker "*")
  )
