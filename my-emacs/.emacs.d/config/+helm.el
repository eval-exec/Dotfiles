(leaf helm
  :bind
  ("M-x" . helm-M-x)
  ("C-x C-f" . helm-find-files)
  ( "C-x b" . 	helm-mini )
  ("C-c h m" . helm-mini)
  ("C-c h o" . helm-imenu)
  ("C-c h a" . helm-apropos)
  ( "M-y" . helm-show-kill-ring 	 )
  ( "C-s" . helm-ff-run-grep 	 )
  ( "C-c h i" . helm-semantic-or-imenu 	 )
  ( "C-c h m" . helm-man-woman 	 )
  ( "C-c h /" . helm-find 	 )
  ( "C-c h l" . helm-locate 	 )
  ( "C-c h o" . helm-occur 	 )
  ( "C-c h a" . helm-apropos 	 )
  ( "C-c h h g" . helm-info-gnus 	  )
  ( "C-c h h i" . helm-info-at-point 	  )
  ( "C-c h h r" . helm-info-emacs 	  )
  ( "C-c h <tab>" . helm-lisp-completion-at-point 	 )
  ( "C-c h b" . helm-resume 	 )
  ( "C-h SPC" . helm-all-mark-rings 	 )
  ( "C-c h r" . helm-recentf)
  ( "C-c h x" . helm-register)
  ( "C-c h t" . helm-top)
  ( "C-c h s" . helm-surfraw)
  ( "C-c h g" . helm-google-suggest)
  ( "C-c h c" . helm-color)
  ( "C-c h M-:" . helm-eval-expression-with-eldoc)
  ( "C-c h C-," . helm-calcul-expression)

  :hook (after-init-hook . helm-mode)
  :config


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

  (setq helm-M-x-always-save-history t)
  (setq helm-etags-fuzzy-match t)
  (setq helm-etags-match-part-only 'all)
  (setq helm-window-prefer-horizontal-split t)



  :config
  (helm-autoresize-mode)
  ( helm-popup-tip-mode )
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
    :hook (after-init-hook . helm-discbinds-mode)
    )
  (leaf helm-projectile
    :bind (
	   ( "C-c p h"  	. helm-projectile 	)
	   ( "C-c p p"  	. helm-projectile-switch-project )
	   ( "C-c p f"  	. helm-projectile-find-file 	)
	   ( "C-c p F"  	. helm-projectile-find-file-in-known-projects 	)
	   ( "C-c p g"  	. helm-projectile-find-file-dwim )
	   ( "C-c p d"  	. helm-projectile-find-dir )
	   ( "C-c p e"  	. helm-projectile-recentf )
	   ( "C-c p a"  	. helm-projectile-find-other-file)
	   ( "C-c p i"  	. hrojectile-invalidate-cache 	)
	   ( "C-c p z"  	. hrojectile-cache-current-file 	)
	   ( "C-c p b"  	. helm-projectile-switch-to-buffer)
	   ( "C-c p s g" 	. helm-projectile-grep 	 )
	   ( "C-c p s a "	. helm-projectile-ack 	 )
	   ( "C-c p s s" 	. helm-projectile-ag 	 )

	   )
    :config
    (helm-projectile-on)
    )
  )
