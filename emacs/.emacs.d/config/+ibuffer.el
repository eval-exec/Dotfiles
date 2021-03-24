
(use-package ibuffer
  :bind
  ("C-x C-b" . ibuffer)
  )
(use-package ibuffer-vc
  :init
  ;; Include version control status info in the ibuffer list.
  ;;   (setq ibuffer-formats
  ;;         '((mark modified read-only vc-status-mini " "
  ;;                 (name 64 -1 :left :elide)
  ;;                 " "
  ;;                 (size 9 -1 :right)
  ;;                 " "
  ;;                 (mode 16 16 :left :elide)
  ;;                 " "
  ;;                 (vc-status 16 16 :left)
  ;;                 " "
  ;;                 filename-and-process)))
  :config
  (add-hook 'ibuffer-hook
	    (lambda ()
	      (ibuffer-projectile-set-filter-groups)
	      (unless (eq ibuffer-sorting-mode 'alphabetic)
		(ibuffer-do-sort-by-alphabetic))))
  (add-hook 'ibuffer-hook (lambda()
			    (ibuffer-vc-set-filter-groups-by-vc-root)
			    (unless (eq ibuffer-sorting-mode 'alphabetic)
			      (ibuffer-do-sort-by-alphabetic)))))

(use-package ibuffer-projectile
  :init
  (add-hook 'ibuffer-hook
	    (lambda ()
	      (ibuffer-projectile-set-filter-groups)
	      (unless (eq ibuffer-sorting-mode 'alphabetic)
		(ibuffer-do-sort-by-alphabetic))))
  )

(use-package all-the-icons-ibuffer
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
