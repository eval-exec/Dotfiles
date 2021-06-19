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
  (lsp-idle-delay . 0.5)
  (lsp-enable-snippet . t)
  :commands lsp
  :config
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 2024 2024)) ;; 1mb
  (leaf lsp-ui
    :commands lsp-ui-mode
    :hook (lsp-mode . lsp-ui-mode)
    )
  (leaf lsp-treemacs
    :commands lsp-treemacs-errors-list
    )
  (leaf dap-mode)
  )


(leaf company
  :custom
  (company-clang-insert-arguments . t)
  (company-semantic-insert-arguments . t)
  (company-gtags-insert-arguments . t)
  (company-rtags-insert-arguments . t)

  (company-etags-everywhere . t)
  (company-etags-ignore-case . t)
  (company-idle-delay . 0.0) ;; default is 0.2
  (company-minimum-prefix-length . 1)
  (company-selection-wrap-around . t)
  (company-show-numbers . t)
  (company-text-icons-add-background . t)
  (company-tooltip-align-annotations . t)
  (company-tooltip-flip-when-above . t)
  (company-transformers . '(company-sort-prefer-same-case-prefix))
  (company-tooltip-limit . 20)
  (company-backends . '(
			company-lsp
			(company-capf :with company-yasnippet)
			)
		    )
  :global-minor-mode  global-company-mode
  :bind (
	 (
	  :company-active-map
	  ("C-p" . company-select-previous)
	  ("C-n" . company-select-next)
	  ("<tab>" . company-complete-common-or-cycle)
	  )
	 (
	  :company-search-map
	  ("C-p" . company-select-previous)
	  ("C-n" . company-select-next)
	  )
	 )
  :config
  (leaf company-box
    :hook (company-mode . company-box-mode)
    )

  (leaf company-prescient
    :init (company-prescient-mode)
    )
  
  (leaf company-tabnine
    :config
    (add-to-list 'company-backends #'company-tabnine)
    )
  (leaf company-statistics
    :after company
    :global-minor-mode company-statistics-mode
    )
  )
