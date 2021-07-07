(leaf ibuffer
  :bind
  ("C-x C-b" . ibuffer)
  :config
  (setq ibuffer-filter-group-name-face '(:inherit (font-lock-string-face bold)))
  (leaf all-the-icons-ibuffer
    :init
    (setq  all-the-icons-ibuffer-human-readable-size t)
    (setq all-the-icons-ibuffer-formats '((mark modified read-only locked
						" " (icon 2 2   :left :elide)
						" " (name 80 -1 :left :elide)
						" " (size-h 10 -1 :left )
						" " (mode+ 24 -1 :left )
						" " (filename-and-process+ -1 -1 :left))))

    :config

    (all-the-icons-ibuffer-mode 1)

    )
  )


(leaf ibuffer-projectile
  ;;:functions all-the-icons-octicon ibuffer-do-sort-by-alphabetic
  :hook (
	 (ibuffer-mode-hook . (lambda ()
				(message "ibuffer projectile groups")
				(ibuffer-projectile-set-filter-groups)
				(unless (eq ibuffer-sorting-mode 'alphabetic)
				  (ibuffer-do-sort-by-alphabetic))))
	 )
  :config
  (setq ibuffer-projectile-prefix
	(concat
	 (all-the-icons-octicon "file-directory"
				:face ibuffer-filter-group-name-face
				:v-adjust 0.0
				:height 1.0)
	 " ")
	)

  )


;; (leaf persp-mode
;;   :config

;;   (setq wg-morph-on nil) ;; switch off animation
;;   (setq persp-autokill-buffer-on-remove 'kill-weak)

;;   (add-hook 'window-setup-hook #'(lambda () (persp-mode 1)))
;;   )




;; (with-eval-after-load 'counsel
;;   (with-no-warnings
;;     (defun my-ibuffer-find-file ()
;;       (interactive)
;;       (let ((default-directory (let ((buf (ibuffer-current-buffer)))
;;                                  (if (buffer-live-p buf)
;;                                      (with-current-buffer buf
;;                                        default-directory)
;;                                    default-directory))))
;;         (counsel-find-file default-directory)))
;;     (advice-add #'ibuffer-find-file :override #'my-ibuffer-find-file))))

;; Group ibuffer's list by project root
