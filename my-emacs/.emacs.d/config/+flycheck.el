(leaf flycheck
  :config
  (global-flycheck-mode)
  (leaf flycheck-color-mode-line
	:init
	(flycheck-color-mode-line-mode)
	)
  (leaf flycheck-pos-tip
	:init (flycheck-pos-tip-mode))
  (leaf flycheck-status-emoji
	:init (flycheck-status-emoji-mode))
  )

