(use-package auto-complete
  :defer t
  :commands auto-complete-mode
  :init
  (setq ac-auto-start 0
	ac-quick-help-delay 0.5
	ac-fuzzy-enable t
	ac-use-fuzzy t
	ac-auto-show-menu 0.2)
  :config
  (add-to-list 'ac-dictionary-directories (concat user-emacs-directory "ac-dict"))
  (ac-config-default))

(use-package company
  :defer t
  :commands company-mode
  :init
  ;; Set company-mode to try and complete instantly
  (setq company-idle-delay 0)
  :config
  (use-package company-irony
    :init (add-to-list 'company-backends 'company-irony))
  (use-package company-c-headers
    :init (add-to-list 'company-backends 'company-c-headers)))
