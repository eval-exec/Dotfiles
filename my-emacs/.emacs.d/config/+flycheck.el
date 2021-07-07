(leaf flycheck
  ;:global-minor-mode global-flycheck-mode
  :config
  (leaf flycheck-color-mode-line
	:init
	(flycheck-color-mode-line-mode)
	)
  (leaf flycheck-pos-tip
	:init (flycheck-pos-tip-mode))
  (leaf flycheck-status-emoji
    :init (flycheck-status-emoji-mode))
  (leaf flycheck-aspell
    :after (flycheck ispell)
    :custom
    (ispell-dictionary . "en_US")
    (ispell-program-name . "aspell")
    (ispell-silently-savep . t)
    (ispell-extra-args . '("--sug-mode=ultra" "--lang=en_US"))

    )
  )

