(leaf dashboard
  :config
  ;(setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")

  ;; (setq dashboard-startup-banner nil)


;;   (setq dashboard-startup-banner 
;; ;"~/.emacs.d/banners/logo.txt"
;; "~/.emacs.d/banners/alien.txt"
;; )
										;(setq dashboard-startup-banner "~/.emacs.d/banner/nasa.txt")

  (setq dashboard-center-content t)


  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-navigator t)

  (setq dashboard-items '((recents  . 100)
						  (bookmarks . 50)
						  (projects . 50)
										;(agenda . 5)
						  (registers . 50)))
  (setq dashboard-set-init-info t)
  (dashboard-setup-startup-hook)

(leaf doom-modeline
  :config
  (setq doom-modeline-height  (window-font-height) )
  (setq doom-modeline-project-detection  'project)
  (setq doom-modeline-buffer-encoding  nil)
  (setq doom-modeline-major-mode-color-icon  t)
  (setq doom-modeline-buffer-state-icon  t)
  (setq doom-modeline-buffer-modification-icon  t)
  (setq doom-modeline-minor-modes  nil)

  :global-minor-mode doom-modeline-mode
  )
 ;; (leaf beacon
 ;;    :custom
 ;;    (beacon-blink-when-focused .  t)
 ;;    (beacon-blink-when-buffer-changes . t)
 ;;    (beacon-blink-when-window-scrolls . nil)
 ;;    (beacon-blink-when-window-changes . t)
 ;;    (beacon-blink-when-point-moves-vertically . nil)
 ;; 	:config
 ;;    (setq beacon-color  "#888888")
 ;;    :global-minor-mode beacon-mode
 ;; 	)
  )

(leaf paren
  :global-minor-mode show-paren-mode 
  )




(leaf writeroom-mode
  :bind
  (:writeroom-mode-map
   ("C-M-<" .  writeroom-decrease-width)
   ("C-M->" .  writeroom-increase-width)
   ("C-M-=" .  writeroom-adjust-width)
   )
  :custom
  (writeroom-width . 148)
  )


;; (leaf centaur-tabs
;;   :after evil
;;   :hook
;;   (org-agenda-mode . centaur-tabs-local-mode)
;;   (helpful-mode . centaur-tabs-local-mode)
;;   :bind(
;; 		(:evil-normal-state-map
;; 		 (
;; 		  ("g T" . centaur-tabs-backward)
;; 		  ("g t" . centaur-tabs-forward)
;; 		  )
;; 		 )
;; 		)
;;   :custom
;;   (centaur-tabs-style . "bar")
;;   (centaur-tabs-height . 32)
;;   (centaur-tabs-set-icons . t)
;;   (centaur-tabs-set-bar . 'over)
;;   (centaur-tabs-set-modified-marker . t)
;;   (centaur-tabs-show-navigation-buttons . t)
;;   (centaur-tabs-set-bar . 'under)
;;   :config
;;   (centaur-tabs-headline-match)
;;   :global-minor-mode centaur-tabs-mode
  ;; )

(leaf atom-one-dark-theme)

;; (leaf nasy-theme
;;   :ensure nil
;;   :quelpa (nasy-theme :fetcher github :repo "nasyxx/emacs-nasy-theme")
;; )

(leaf doom-themes)
(leaf all-the-icons)
(leaf all-the-icons-dired
  )
(leaf all-the-icons-gnus
  )
(leaf treemacs-all-the-icons
  )

(leaf nyan-mode
  ;;   :config
  ;;   :custom (
  ;; 	   (nyan-animate-nyancat . t)
  ;; 	   (nyan-cat-face-number . 3)
  ;; 				)
  ;;   (setq mode-line-format
  ;; 	'(:eval (list (nyan-create)))
  ;; 	 ))
  )
