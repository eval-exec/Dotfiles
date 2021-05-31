(leaf ibuffer
  :bind
  ("C-x C-b" . ibuffer)
  :config
  (leaf ibuffer-project
    ;; :hook (ibuffer .  (lambda ()
    ;; 			(setq ibuffer-filter-groups (ibuffer-project-generate-filter-groups))
    ;; 			)
    ;; 		   )

    (setq ibuffer-filter-groups (ibuffer-project-generate-filter-groups))
    )
  (leaf all-the-icons-ibuffer
    :init
    (setq  all-the-icons-ibuffer-human-readable-size t)

    (setq all-the-icons-ibuffer-formats '((mark modified read-only locked
						" " (icon 2 2   :left :elide)
						" " (name 80 -1 :left :elide)
						" " (size-h 10 -1 :left )
						" " (mode+ 16 16 :left )
						" " (filename-and-process+ -1 -1 :left))))
    (all-the-icons-ibuffer-mode 1)
    )
  )
