(leaf evil
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (setq evil-want-C-u-scroll t)

  (evil-mode 1)

  (with-eval-after-load 'evil-maps
	(define-key evil-motion-state-map (kbd "SPC") nil)
	(define-key evil-motion-state-map (kbd "RET") nil)
	(define-key evil-motion-state-map (kbd "TAB") nil)

	


	)


  (setq evil-undo-system 'undo-tree)

  (setq evil-normal-state-tag   (propertize "[Normal]" 'face '((:background "green" :foreground "black")))
		evil-emacs-state-tag    (propertize "[Emacs]" 'face '((:background "orange" :foreground "black")))
		evil-insert-state-tag   (propertize "[Insert]" 'face '((:background "red") :foreground "white"))
		evil-motion-state-tag   (propertize "[Motion]" 'face '((:background "blue") :foreground "white"))
		evil-visual-state-tag   (propertize "[Visual]" 'face '((:background "grey80" :foreground "black")))
		evil-operator-state-tag (propertize "[Operator]" 'face '((:background "purple"))))

  (leaf evil-leader
	:config
	(global-evil-leader-mode)
	(evil-leader/set-key
	  "e" 'find-file
	  "b" 'ibuffer
	  "k" 'kill-this-buffer)
	(evil-leader/set-key
	  "ci" 'evilnc-comment-or-uncomment-lines
	  "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
	  "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
	  "cc" 'evilnc-copy-and-comment-lines
	  "cp" 'evilnc-comment-or-uncomment-paragraphs
	  "cr" 'comment-or-uncomment-region
	  "cv" 'evilnc-toggle-invert-comment-line-by-line
	  "."  'evilnc-copy-and-comment-operator
	  "\\" 'evilnc-comment-operator ; if you prefer backslash key
	  )



	)
  (leaf evil-collection
	:after evil
	:config
	(setq evil-collection-setup-minibuffer t)
	(evil-collection-init)
	)

  (setq evil-want-keybinding t)
  (leaf evil-smartparens
	:hook (smartparens-enable-hook . evil-smartparents-mode)
	)
  (leaf fcitx
	:config
	(setq fcitx-remote-command "/usr/bin/fcits5-remote")
	(fcitx-evil-turn-on)
	)
  (leaf smartparens
	:config
	(smartparens-global-mode )
	)
  (leaf evil-exchange
	:config
	(evil-exchange-install)
	)
  (leaf evil-mc
	:config
	(global-evil-mc-mode)
	)
  (leaf evil-commentary
	:config
	(evil-commentary-mode))
  )


