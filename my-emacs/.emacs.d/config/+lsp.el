(leaf lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c p")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (c++-mode . lsp)
         (c-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  :config


;; optionally
(leaf lsp-ui :commands lsp-ui-mode)
;; if you are ivy user
(leaf lsp-ivy :commands lsp-ivy-workspace-symbol)
(leaf lsp-treemacs :commands lsp-treemacs-errors-list)
;; optionally if you want to use debugger
(leaf dap-mode)
;; (leaf dap-LANGUAGE) to load the dap adapter for your language

  )
