(leaf evil
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :bind(
	(:evil-insert-state-map
	 (
	  ("M-h" . left-char)
	  ("M-l" . right-char)
	  ("M-j" . next-line)
	  ("M-k" . previous-line)
	  )
	 )
	)
  :hook(after-init-hook . evil-mode)
  :custom
  (evil-want-C-u-scroll . t)
  (evil-undo-system . 'undo-tree)
  
  :config







  (leaf evil-leader
    :after evil
    :global-minor-mode global-evil-leader-mode
    :config
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
  (leaf fcitx
    :after evil
    :config
    (setq fcitx-remote-command "/usr/bin/fcits5-remote")
    (fcitx-evil-turn-on)
    )
  (leaf evil-exchange
    :after evil
    :config
    (evil-exchange-install)
    )
  (leaf evil-mc
    :after evil
    :config
    :global-minor-mode global-evil-mc-mode
    )
  (leaf evil-commentary
    :after evil
    :config
    :global-minor-mode evil-commentary-mode
    )

  (leaf evil-surround
    :after evil
    :custom
    (evil-surround-pairs-alist .
			       '((40 "( " . " )")
				 (91 "[ " . " ]")
				 (123 "{ " . " }")
				 (41 "(" . ")")
				 (93 "[" . "]")
				 (125 "{" . "}")
				 (35 "#{" . "}")
				 (98 "(" . ")")
				 (66 "{" . "}")
				 (62 "<" . ">")
				 (116 . evil-surround-read-tag)
				 (60 . evil-surround-read-tag)
				 (102 . evil-surround-function)
				 (61 " =" . "= ")
				 (60 "<" . ">")))


    :global-minor-mode global-evil-surround-mode
    )
  )

(leaf electric
  :tag "builtin"
  :hook (
	 (after-init-hook . electric-pair-mode)
	 (prog-mode . electric-indent-mode)
	 )
  )
