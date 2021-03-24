(use-package evil
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config

  (setq evil-normal-state-tag   (propertize "[Normal]" 'face '((:background "green" :foreground "black")))
		evil-emacs-state-tag    (propertize "[Emacs]" 'face '((:background "orange" :foreground "black")))
		evil-insert-state-tag   (propertize "[Insert]" 'face '((:background "red") :foreground "white"))
		evil-motion-state-tag   (propertize "[Motion]" 'face '((:background "blue") :foreground "white"))
		evil-visual-state-tag   (propertize "[Visual]" 'face '((:background "grey80" :foreground "black")))
		evil-operator-state-tag (propertize "[Operator]" 'face '((:background "purple"))))
  (evil-mode 1)

  (use-package evil-leader
	:config
	(global-evil-leader-mode)
	(evil-leader/set-key
	  "e" 'find-file
	  "B" 'helm-multi-files
	  "b" 'ibuffer
	  "k" 'kill-buffer)
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
  (use-package evil-collection
	:custom (evil-collection-setup-minibuffer t)
	:init (evil-collection-init))
  (use-package evil-smartparens
	:hook (smartparens-enable-hook . evil-smartparents-mode)
	)
  (use-package fcitx
	:config
	(setq fcitx-remote-command "/usr/bin/fcits5-remote")
	(fcitx-evil-turn-on))

  )



(use-package smartparens
  :config
  (smartparens-global-mode )
  )
