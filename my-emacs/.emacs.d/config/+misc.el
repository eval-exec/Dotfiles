(leaf rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(leaf calendar
  :config
  (setq
   calendar-latitude 39.903829718
   calendar-longitude 116.374498502
   )


  (setq view-diary-entries-initially t
		mark-diary-entries-in-calendar t
		number-of-diary-entries 7)
  (add-hook 'diary-display-hook 'fancy-diary-display)
  (add-hook 'today-visible-calendar-hook 'calendar-mark-today)

  (setq diary-file "~/org/diary/diary")
  )

(leaf undo-tree
  :config
  (global-undo-tree-mode)
  )

;; (leaf projectile
;;   :init (projectile-mode +1)

;;   :config
;;   (setq projectile-enable-caching t
;; 		projectile-completion-system 'helm   )
;;   (leaf helm-projectile
;; 	:config
;; 	(helm-projectile-on)
;; 	)
;;   )
(leaf hl-line
  :config
  (global-hl-line-mode))

(leaf fcitx
  :custom
  (fcitx-remote-command . "/usr/bin/fcitx5-remote")
  :config
  (fcitx-aggressive-setup)
  )

(leaf helpful
  :bind
  ;; Note that the built-in `describe-function' includes both functions
  ;; and macros. `helpful-function' is functions only, so we provide
  ;; `helpful-callable' as a drop-in replacement.
  (("C-h f" . helpful-callable)
   ("C-h v" . helpful-variable)


   ;; Lookup the current symbol at point. C-c C-d is a common keybinding
   ;; for this in lisp modes.

   ;; Look up *F*unctions (excludes macros).
   ;;
   ;; By default, C-h F is bound to `Info-goto-emacs-command-node'. Helpful
   ;; already links to the manual, if a function is referenced there.
   ("C-h k" . helpful-key)
   ("C-c C-d" . helpful-at-point)
   ("C-h F" . helpful-function)

   ;; Look up *C*ommands.
   ;;
   ;; By default, C-h C is bound to describe `describe-coding-system'. I
   ;; don't find this very useful, but it's frequently useful to only
   ;; look at interactive functions.
   ("C-h C" . helpful-command)))

(leaf super-save
  :custom
  (super-save-auto-save-when-idle . t)
  :config
  (super-save-mode +1)
  )








(leaf emojify
  :hook (after-init  global-emojify-mode))

(leaf hungry-delete
  :config
  (global-hungry-delete-mode)
  )





(setq confirm-kill-emacs 'yes-or-no-p)

(leaf nov
  :config
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

  )

