(set-face-attribute 'default nil
		    :family "DejaVu Sans Mono"
		    ;:height 150 
		    :weight 'normal
		    :width 'normal)

(use-package doom-modeline
  :ensure t
  :config
  (setq doom-modeline-height (window-font-height))
  (doom-modeline-mode 1)
  )

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-items '((recents  . 5)
			  (bookmarks . 5)
			  (projects . 5)
			  (agenda . 5)
			  (registers . 5)))
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-banner-logo-title "Evil-EXEC")
  (setq dashboard-startup-banner "EXEC")

  (setq dashboard-set-init-info t)
  (dashboard-setup-startup-hook))
