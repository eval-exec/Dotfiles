(leaf lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
		 (c++-mode . lsp)
		 (lsp-mode . lsp-len-mode)
		 (c-mode . lsp)
		 (go-mode . lsp)
		 (lsp-mode . lsp-enable-which-key-integration)
		 )

  :custom
  (lsp-headerline-breadcrumb-enable . nil)
  (lsp-headerline-breadcrumb-icons-enable . nil)
  :commands lsp
  :config
  (setq gc-cons-threshold 100000000)

  (setq read-process-output-max (* 2024 2024)) ;; 1mb

  (setq lsp-idle-delay 0.500)


  ;; (define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol)
  ;; (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  ;; (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)




  ;; ;; optionally
  ;; (leaf lsp-ui :commands lsp-ui-mode )
  ;; (leaf lsp-treemacs :commands lsp-treemacs-errors-list)
  ;; ;; optionally if you want to use debugger
  ;; (leaf dap-mode)
  ;; ;; (leaf dap-LANGUAGE) to load the dap adapter for your language
  )


(leaf company
  :config
  (setq company-minimum-prefix-length 1
		company-idle-delay 0.0) ;; default is 0.2
  (setq company-tooltip-align-annotations t)


  (setq company-semantic-insert-arguments t)
  (global-company-mode)

  )
