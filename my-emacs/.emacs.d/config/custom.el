(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-revert-interval 0.1)
 '(blink-cursor-blinks 0)
 '(blink-cursor-delay 0.1)
 '(blink-cursor-interval 0.2)
 '(blink-cursor-mode nil)
 '(byte-compile-warnings nil)
 '(comp-always-compile t)
 '(company-quickhelp-delay 0.01)
 '(confirm-kill-emacs 'yes-or-no-p)
 '(custom-enabled-themes '(dracula))
 '(custom-safe-themes t)
 '(display-line-numbers-type 'visual)
 '(display-time-24hr-format t)
 '(display-time-day-and-date t)
 '(fcitx-remote-command "/usr/bin/fcitx5-remote" t)
 '(frame-resize-pixelwise t)
 '(helm-completion-styles-alist '((gud-mode . helm-fuzzy)))
 '(helm-minibuffer-history-key "M-p")
 '(history-delete-duplicates t)
 '(leaf-defaults '(:ensure t))
 '(lsp-headerline-breadcrumb-enable nil t)
 '(lsp-headerline-breadcrumb-icons-enable nil t)
 '(mail-user-agent 'gnus-user-agent)
 '(make-backup-files nil)
 '(mpc-mpd-music-directory "~/Music/")
 '(org-agenda-files
   '("/home/vory/org/Routine.org" "/home/vory/org/habits.org" "/home/vory/org/spanish.org" "/home/vory/org/test.org" "/home/vory/org/work/work.org" "/home/vory/org/personal/exec.org" "/home/vory/org/personal/leetocde.org" "/home/vory/org/personal/personal.org" "/home/vory/org/personal/todo.org" "/home/vory/org/notes/TheGraph.org" "/home/vory/org/notes/interview.org" "/home/vory/org/journal/2021.org"))
 '(org-crypt-key "0F0272C0D3AC91F7")
 '(org-startup-truncated nil)
 '(org-tags-exclude-from-inheritance '("crypt"))
 '(package-archives
   '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
     ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
     ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))
 '(package-native-compile t)
 '(package-selected-packages
   '(evil-terminal-cursor-changer eimp dired nano-theme plan9-theme valign nebula-theme material vscode-icon nimbus-theme seoul256-theme github-theme vscode-dark-plus-theme perspective ibuffer-project tramp-auto-auth nyan-mode nyan all-the-icons-gnu atomic-chrome common-lisp-snippets slime quelpa-leaf quelpa nasy-theme kaolin-themes org-superstar atom-one-dark notmuch mu4e-views mu4e-marker-icons mu4e-alert save-place flycheck-aspell company-prescient google-translate pangu-spacing beacon org-download emacs-application-framework eaf deferred ctable org-noter-pdftools org-noter pdf-tools magit lsp-mode go-mode avy company-statistics rust-mode ros dired-filetype-face ripgrep rg helm-c-yasnippet company-lsp mode-icons all-the-icons-ivy-rich go-autocomplete go-complete go-dlv go-tag go-playground go-errcheck go-gen-test go-impl go-imports go-projectile go-snippets go-guru yasnippet-snippts yasnippets yasnippet nov writeroom-mode helm-wikipedia tree-sitter-lang tree-sitter-langs tree-sitter olivetti emacs-everywhere org-roam-server winner-mode docker lsp-docker aggressive-indent atom-dark-theme w3m ## centaur-tabs helm-icon exec-path-from-shell good-scroll modus-themes evil-mc hungry-delete ir-black-theme leetcode evil-exchange emojify flycheck-inline flycheck-status-emoji flycheck-title flycheck-pos-tip flycheck-color-mode-line restart-emacs telega evil-commentary helm-swoop git-gutter helm-descbinds rtags helm-lsp helm-posframe imenu-anywhere helm-xref helm-projectile helm-org helm-frame helm-ag helm-config idea-darkula-theme org-appear gcmh immaterial-theme helm-flx helm-icons helm-slime helm orderless projectile all-the-icons elisp--witness--lisp org-journal transient-dwim leaf-convert leaf-tree wgrep-ag wgrep leaf treemacs-perspective dap-mode lsp-treemacs eglot lsp-ui company-fuzzy company-quickhelp flycheck company modern-cpp-font-lock yasnippet-snippets nord-theme org-drill quelpa-use-package hl-todo zenburn-theme a l ace-jump-mode zetteldeft white-sand-theme white-theme one-themes evil calendar-norway org-agenda-property deft company-box zzz-to-char fuzzy-finder monokai-theme color-theme-sanityinc-tomorrow spacemacs-theme spacemacs_module_for_doom emacs-sounds sound-wav evil-surround super-save general fzf calfw-cal calfw-org calfw acme-theme doom-themes spaceline-all-the-icons treemacs-all-the-icons helm-themes doom-modeline-now-playing rainbow-delimiters evil-leader evil-nerd-commenter avk-emacs-themes cyberpunk-2019-theme cyberpunk-theme tao-theme sexy-monochrome-theme almost-mono-themes firecode-theme leuven-theme dark-krystal-theme cherry-blossom-theme blackboard-theme solarized-theme benchmark-init forge rainbow-identifiers visual-fill-column epc org-roam-protocol all-the-icons-dired professional-theme ibuffer zerodark-theme which-key vdiff-magit undo-tree treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired treemacs-evil spacegray-theme poet-theme ox-hugo orgit org-super-agenda org-roam org-plus-contrib org-cliplink org-bullets ob-rust ob-go material-theme ibuffer-vc ibuffer-projectile helpful fcitx evil-collection eterm-256color dracula-theme doom-modeline dashboard company-c-headers auto-complete atom-one-dark-theme all-the-icons-ibuffer))
 '(pdf-cache-prefetch-delay 0.1)
 '(pdf-view-display-size 'fit-height)
 '(pdf-view-midnight-colors '("#000000" . "#ffffff"))
 '(projectile-completion-system 'helm)
 '(projectile-current-project-on-switch 'keep)
 '(projectile-enable-caching t)
 '(projectile-indexing-method 'hybrid)
 '(read-mail-command 'gnus)
 '(recentf-exclude
   '("/home/vory/.emacs.d/.cache/treemacs-persist-at-last-error" "/home/vory/.emacs.d/.cache/treemacs-persist" "~/.emacs.d/elpa/*" "~/.emacs.d/session.*" "~/.emacs.d/.cache*" "/usr/share/emacs/*" "/tmp/*" "/home/vory/Dotfiles"))
 '(scroll-bar-mode nil)
 '(scroll-conservatively 10000)
 '(scroll-margin 7)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tramp-default-method "ssh")
 '(tramp-default-user nil)
 '(tramp-encoding-shell "/bin/bash")
 '(user-mail-address "execvy@gmail.com")
 '(visible-bell nil)
 '(warning-suppress-log-types '((emacs) (comp) (comp) (comp) (comp)))
 '(warning-suppress-types '((comp) (comp) (comp) (comp)))
 '(window-divider-mode nil)
 '(word-wrap t))




(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 102 :width normal))))
 '(cursor ((t nil))))
