


(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  :custom (evil-collection-setup-minibuffer t)
  :init (evil-collection-init))

(use-package fcitx
  :ensure t
  :config
  (setq fcitx-remote-command "/usr/bin/fcits5-remote")
  (fcitx-evil-turn-on))

(use-package smartparens
  :ensure t
  :config
  (smartparens-global-mode )
  )
(use-package evil-smartparens
  :ensure t
  :config
  (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)
  )
