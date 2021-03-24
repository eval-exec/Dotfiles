
(use-package dired+
  :load-path "../dired+.el"
  :defer 1
  :init
  (setq diredp-hide-details-initially-flag nil)
  (setq diredp-hide-details-propagate-flag nil)

  :config
  (diredp-toggle-find-file-reuse-dir 1))
(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode)
  :config
  )

