(leaf rust-mode
  :config
  (add-hook 'rust-mode-hook
			(lambda () (setq indent-tabs-mode nil)))
  (setq rust-format-on-save t)

  )
