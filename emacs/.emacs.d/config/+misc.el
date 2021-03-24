(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package calendar
  :defer t
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

(use-package undo-tree
  :config
  (global-undo-tree-mode)
  )

(use-package company
  :diminish company-mode
  :hook
  (after-init . global-company-mode))
(use-package projectile
  :defer 2
  :diminish projectile-mode
  :config
  (projectile-global-mode))
(use-package hl-line
  :defer nil
  :config
  (defun zz/get-visual-line-range ()
	(let (b e)
	  (save-excursion
		(beginning-of-visual-line)
		(setq b (point))
		(end-of-visual-line)
		(setq e (+ 1 (point)))
		)
	  (cons b e)))
  (setq hl-line-range-function #'zz/get-visual-line-range)
  (global-hl-line-mode))
(use-package fcitx
  :config
  (setq fcitx-remote-command "/usr/bin/fcitx5-remote")
  (fcitx-aggressive-setup)
  )

(use-package helpful
  :after (helm-mode)
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

