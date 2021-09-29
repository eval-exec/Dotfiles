;; (leaf dashboard
  
;;   :config
;; 					;(setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
;;   ;; (setq dashboard-startup-banner "~/Pictures/avator/heckert_gnu.png")
;;   ;; (setq dashboard-startup-banner "~/Pictures/dark-skull.png")
;;   ;; (setq dashboard-startup-banner "~/Pictures/ghost1.png")
;;   ;; (setq dashboard-startup-banner "~/Pictures/skull-logo-transparent-4.png")
;;   ;; (setq dashboard-startup-banner "~/Pictures/Pik.png")
;;   ;; (setq dashboard-startup-banner "~/Pictures/acdb3835b1cc16d68834d73a8c500ea0.png")
;;   ;;   (setq dashboard-startup-banner "~/Pictures/avator/camo-phone.png")
;;   (setq dashboard-startup-banner "~/Pictures/avator/horror-skull.png")
;;   ;;(setq dashboard-footer   "While any text editor can save your files, only Emacs can save your soul")

;;   ;;   (setq dashboard-startup-banner 
;;   ;; ;"~/.emacs.d/banners/logo.txt"
;;   ;; "~/.emacs.d/banners/alien.txt"
;;   ;; )
;;   (setq dashboard-center-content t)
;;   (setq dashboard-set-heading-icons t)
;;   (setq dashboard-set-file-icons t)
;;   (setq dashboard-set-navigator t)

;;   (setq dashboard-items '(
;; 					; (recents  . 0)
;; 			  ;;			  (bookmarks . 50)
;; 			  ;;(projects . 50)
;; 					;(agenda . 5)
;; 					; (registers . 50)
;; 			  ))
;;   (setq dashboard-set-init-info t)
;;   (dashboard-setup-startup-hook))

(leaf doom-modeline
  :config
  (setq doom-modeline-height  (window-font-height)) 
  (setq doom-modeline-project-detection  'project)
  (setq doom-modeline-buffer-encoding  nil)
  (setq doom-modeline-major-mode-color-icon  t)
  (setq doom-modeline-buffer-state-icon  t)
  (setq doom-modeline-buffer-modification-icon  t)
  (setq doom-modeline-minor-modes  nil)

  :global-minor-mode doom-modeline-mode
  )
(leaf beacon
  :custom
  (beacon-blink-when-focused .  t)
  (beacon-blink-when-buffer-changes . t)
  (beacon-blink-when-window-scrolls . nil)
  (beacon-blink-when-window-changes . t)
  (beacon-blink-when-point-moves-vertically . nil)
  :config
  (setq beacon-color  "#333333")
  ;; :global-minor-mode beacon-mode
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
(leaf github-theme)
(leaf almost-mono-themes
  :config
  (load-theme 'almost-mono-black t)
  )


;; (leaf nebula-theme
;;   :quelpa ( nebula-theme :fetcher github :repo "pkazmier/doom-nebula-theme")
;;   )

(leaf doom-themes)
(leaf all-the-icons)
(leaf all-the-icons-dired
  )
(leaf treemacs-all-the-icons
  )

(leaf moe-theme)
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

(leaf material-theme)

(leaf sublime-themes)

(leaf  hybrid-reverse-theme)

(leaf idea-darkula-theme)
;;; load custom theme
(setq custom-theme-allow-multiple-selections nil)

(setq menu-bar nil)

(leaf ayu-theme)

(leaf plan9-theme)
(leaf professional-theme)

(leaf dracula-theme)

(leaf acme-theme)
(leaf inverse-acme-theme)
(leaf nofrils-acme-theme)

(leaf sexy-monochrome-theme)

;; (leaf nasy-theme
;;   :quelpa (nasy-theme :fetcher github :repo "nasyxx/emacs-nasy-theme"))
