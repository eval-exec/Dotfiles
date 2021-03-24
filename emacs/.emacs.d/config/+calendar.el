(use-package calfw
  :defer t
  :config
  ;; better frame for calendar
  
  (setq cfw:org-overwrite-default-keybinding t)

  (use-package calfw-org
	:config
	(setq cfw:org-face-agenda-item-foreground-color "#ecccc3")
	)
  )
