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
 '(company-backends '(company-lsp (company-capf :with company-yasnippet)))
 '(company-clang-insert-arguments t t)
 '(company-etags-everywhere t t)
 '(company-etags-ignore-case t t)
 '(company-gtags-insert-arguments t t)
 '(company-idle-delay 0.0)
 '(company-minimum-prefix-length 1)
 '(company-quickhelp-delay 0.01)
 '(company-rtags-insert-arguments t t)
 '(company-selection-wrap-around t)
 '(company-semantic-insert-arguments t t)
 '(company-show-numbers t)
 '(company-text-icons-add-background t)
 '(company-tooltip-align-annotations t)
 '(company-tooltip-flip-when-above t)
 '(company-tooltip-limit 20)
 '(company-transformers '(company-sort-prefer-same-case-prefix))
 '(confirm-kill-emacs 'yes-or-no-p)
 '(custom-enabled-themes '(atom-one-dark))
 '(custom-safe-themes t)
 '(dashboard-week-agenda nil)
 '(debug-on-error t)
 '(deft-directory "~/org/" t)
 '(deft-extensions '("txt" "org" "md") t)
 '(deft-recursive t t)
 '(deft-use-filename-as-title t t)
 '(display-buffer-base-action '(display-buffer-reuse-window))
 '(display-line-numbers-type 'visual)
 '(display-time-24hr-format t)
 '(display-time-day-and-date t)
 '(erc-server "irc.libera.chat:6697")
 '(erc-system-name "evil_exec")
 '(evil-undo-system 'undo-tree)
 '(evil-want-C-u-scroll t)
 '(fcitx-remote-command "/usr/bin/fcitx5-remote" t)
 '(frame-resize-pixelwise t)
 '(gcmh-high-cons-threshold 10737418240)
 '(gcmh-idle-delay 60)
 '(gcmh-verbose nil)
 '(google-translate--tkk-url "https://translate.google.cn/" t)
 '(google-translate-backend-method 'curl t)
 '(google-translate-base-url "https://translate.google.cn/translate_a/single" t)
 '(google-translate-default-source-language "en" t)
 '(google-translate-default-target-language "zh-CN" t)
 '(google-translate-listen-url "https://translate.google.cn/translate_tts" t)
 '(google-translate-output-destination 'echo-area t)
 '(google-translate-translation-directions-alist '(("en" . "zh-CN") ("zh-CN" . "en")) t)
 '(helm-completion-styles-alist '((gud-mode . helm-fuzzy)))
 '(helm-icons-provider 'treemacs nil nil "Customized with leaf in `helm-icons' block at `/home/vory/.emacs.d/config/+helm.el'")
 '(helm-minibuffer-history-key "M-p")
 '(helm-posframe-font "Fira Code")
 '(history-delete-duplicates t)
 '(leaf-defaults '(:ensure t))
 '(leetcode-prefer-language "cpp" t)
 '(leetcode-prefer-sql "mysql" t)
 '(lsp-enable-snippet t t)
 '(lsp-headerline-breadcrumb-enable nil t)
 '(lsp-headerline-breadcrumb-icons-enable nil t)
 '(lsp-idle-delay 0.5 t)
 '(mail-user-agent 'gnus-user-agent)
 '(make-backup-files nil)
 '(mpc-mpd-music-directory "~/Music/")
 '(org-agenda-files
   '("/home/vory/org/Routine.org" "/home/vory/org/habits.org" "/home/vory/org/spanish.org" "/home/vory/org/test.org" "/home/vory/org/test_enc.org" "/home/vory/org/work/work.org" "/home/vory/org/personal/exec.org" "/home/vory/org/personal/leetocde.org" "/home/vory/org/personal/personal.org" "/home/vory/org/personal/todo.org" "/home/vory/org/notes/TheGraph.org" "/home/vory/org/notes/interview.org" "/home/vory/org/journal/2021.org"))
 '(org-agenda-include-diary t)
 '(org-agenda-time-grid
   '((daily today require-timed)
     (0 100 200 300 400 500 600 700 800 900 1000 1100 1200 1300 1400 1500 1600 1700 1800 1900 2000 2100 2200 2300 2400)
     "......" "----------------"))
 '(org-agenda-use-tag-inheritance t)
 '(org-capture-templates
   '(("w" "work" entry
      (file+headline "~/org/work/work.org" "WORK")
      "** TODO [#B] %i %T %?")
     ("p" "personal stuff" entry
      (file+headline "~/org/personal/personal.org" "Personl")
      "* TODO %i %T %?")
     ("e" "EXEC" plain
      (file+headline "~/org/personal/exec.org" "EXEC")
      "** %i %T %?")
     ("c" "Code Stuff")
     ("cl" "LeetCode" plain
      (file+headline "~/org/personal/leetocde.org" "Daily Challenge")
      "** %T %i %? 
#+BEGIN_SRC c

#+END_SRC
")))
 '(org-confirm-babel-evaluate nil)
 '(org-crypt-key "0F0272C0D3AC91F7")
 '(org-default-notes-file "~/org/notes/")
 '(org-ellipsis "⤵")
 '(org-enforce-todo-checkbox-dependencies t)
 '(org-enforce-todo-dependencies t)
 '(org-journal-date-format "%F, %A")
 '(org-journal-dir "~/org/journal/")
 '(org-journal-enable-agenda-integration t)
 '(org-journal-enable-cache t)
 '(org-journal-file-format "%Y.org")
 '(org-journal-file-type 'Yearly)
 '(org-journal-time-format "%T")
 '(org-log-done 'time)
 '(org-return-follows-link t)
 '(org-roam-buffer-width 0.33)
 '(org-roam-capture-templates
   '(("d" "default" plain #'org-roam--capture-get-point "%?" :file-name "%(format-time-string \"${slug}__%Y-%m-%d-%H:%M:%S\")" :head "#+TITLE: ${title}
#+CREATED: %U
#+LAST_MODIFIED: %U
#+ROAM_TAGS: 
" :unnarrowed t)
     ("ll" "link note" plain #'org-roam-capture--get-point "* %^{Link}" :file-name "Inbox" :olp
      ("Links")
      :unnarrowed t :immediate-finish)
     ("lt" "link task" entry #'org-roam-capture--get-point "* TODO %^{Link}" :file-name "Inbox" :olp
      ("Tasks")
      :unnarrowed t :immediate-finish)))
 '(org-roam-completion-everywhere t)
 '(org-roam-completion-ignore-case t)
 '(org-roam-completion-system 'helm)
 '(org-roam-dailies-capture-templates
   '(("d" "default" entry #'org-roam-capture--get-point "* %?" :file-name "Journal/%<%Y-%m-%d>" :head "#+TITLE: %<%Y-%m-%d %a>

[[roam:%<%Y-%B>]]

")
     ("t" "Task" entry #'org-roam-capture--get-point "* TODO %?
  %U
  %a
  %i" :file-name "Journal/%<%Y-%m-%d>" :olp
  ("Tasks")
  :empty-lines 1 :head "#+title: %<%Y-%m-%d %a>

[[roam:%<%Y-%B>]]

")
     ("j" "journal" entry #'org-roam-capture--get-point "* %<%I:%M %p> - Journal  :journal:

%?

" :file-name "Journal/%<%Y-%m-%d>" :olp
("Log")
:head "#+title: %<%Y-%m-%d %a>

[[roam:%<%Y-%B>]]

")
     ("l" "log entry" entry #'org-roam-capture--get-point "* %<%I:%M %p> - %?" :file-name "Journal/%<%Y-%m-%d>" :olp
      ("Log")
      :head "#+title: %<%Y-%m-%d %a>

[[roam:%<%Y-%B>]]

")
     ("m" "meeting" entry #'org-roam-capture--get-point "* %<%I:%M %p> - %^{Meeting Title}  :meetings:

%?

" :file-name "Journal/%<%Y-%m-%d>" :olp
("Log")
:head "#+title: %<%Y-%m-%d %a>

[[roam:%<%Y-%B>]]

")))
 '(org-roam-db-location "~/.cache/org-roam-db/roam.db")
 '(org-roam-db-update-method 'immediate)
 '(org-roam-directory "~/org/roam/")
 '(org-roam-file-completion-tag-position 'append)
 '(org-roam-graph-shorten-titles 'wrap)
 '(org-roam-include-type-in-ref-path-completions t)
 '(org-roam-protocol-store-links t t)
 '(org-roam-title-to-slug-function 'EXEC/org-roam--title-to-slug)
 '(org-startup-truncated nil)
 '(org-startup-with-inline-images t)
 '(org-tag-beautify-mode t t)
 '(org-tags-exclude-from-inheritance '("crypt"))
 '(package-archives
   '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
     ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
     ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))
 '(package-native-compile t)
 '(package-selected-packages
   '(elfeed-dashboard elfeed vimrc-mode telega elisp-pack elisp forcast disable-mouse which-key-posframe hybrid-reverse-theme moe-theme jetbrains-darcula-theme forest-blue-theme faff-theme sublime-themes emacs-color-themes persp-mode use-proxy esup evil-terminal-cursor-changer eimp dired nano-theme plan9-theme valign nebula-theme material vscode-icon nimbus-theme seoul256-theme github-theme vscode-dark-plus-theme perspective ibuffer-project tramp-auto-auth nyan-mode nyan all-the-icons-gnu atomic-chrome common-lisp-snippets slime quelpa-leaf quelpa nasy-theme kaolin-themes org-superstar atom-one-dark notmuch mu4e-views mu4e-marker-icons mu4e-alert save-place flycheck-aspell company-prescient google-translate pangu-spacing beacon org-download emacs-application-framework eaf deferred ctable org-noter-pdftools org-noter pdf-tools magit lsp-mode go-mode avy company-statistics rust-mode ros dired-filetype-face ripgrep rg helm-c-yasnippet company-lsp mode-icons all-the-icons-ivy-rich go-autocomplete go-complete go-dlv go-tag go-playground go-errcheck go-gen-test go-impl go-imports go-projectile go-snippets go-guru yasnippet-snippts yasnippets yasnippet nov writeroom-mode helm-wikipedia tree-sitter-lang tree-sitter-langs tree-sitter olivetti emacs-everywhere org-roam-server winner-mode docker lsp-docker aggressive-indent atom-dark-theme w3m ## centaur-tabs helm-icon exec-path-from-shell good-scroll modus-themes evil-mc hungry-delete ir-black-theme leetcode evil-exchange emojify flycheck-inline flycheck-status-emoji flycheck-title flycheck-pos-tip flycheck-color-mode-line restart-emacs evil-commentary helm-swoop git-gutter helm-descbinds rtags helm-lsp helm-posframe imenu-anywhere helm-xref helm-projectile helm-org helm-frame helm-ag helm-config idea-darkula-theme org-appear gcmh immaterial-theme helm-flx helm-icons helm-slime helm orderless projectile all-the-icons elisp--witness--lisp org-journal transient-dwim leaf-convert leaf-tree wgrep-ag wgrep leaf treemacs-perspective dap-mode lsp-treemacs eglot lsp-ui company-fuzzy company-quickhelp flycheck company modern-cpp-font-lock yasnippet-snippets nord-theme org-drill quelpa-use-package hl-todo zenburn-theme a l ace-jump-mode zetteldeft white-sand-theme white-theme one-themes calendar-norway org-agenda-property deft company-box zzz-to-char fuzzy-finder monokai-theme color-theme-sanityinc-tomorrow spacemacs-theme spacemacs_module_for_doom emacs-sounds sound-wav evil-surround super-save general fzf calfw-cal calfw-org calfw acme-theme doom-themes spaceline-all-the-icons treemacs-all-the-icons helm-themes doom-modeline-now-playing rainbow-delimiters evil-leader evil-nerd-commenter avk-emacs-themes cyberpunk-2019-theme cyberpunk-theme tao-theme sexy-monochrome-theme almost-mono-themes firecode-theme leuven-theme dark-krystal-theme cherry-blossom-theme blackboard-theme solarized-theme forge rainbow-identifiers visual-fill-column epc org-roam-protocol all-the-icons-dired professional-theme ibuffer zerodark-theme which-key vdiff-magit undo-tree treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired treemacs-evil spacegray-theme poet-theme ox-hugo orgit org-super-agenda org-roam org-plus-contrib org-cliplink org-bullets ob-rust ob-go material-theme ibuffer-vc ibuffer-projectile helpful fcitx evil-collection eterm-256color dracula-theme doom-modeline dashboard company-c-headers auto-complete atom-one-dark-theme all-the-icons-ibuffer))
 '(pangu-spacing-real-insert-separtor t)
 '(pdf-cache-prefetch-delay 0.1)
 '(pdf-view-display-size 'fit-height)
 '(pdf-view-midnight-colors '("#000000" . "#ffffff"))
 '(prog-mode-hook '(flyspell-prog-mode prettify-symbols-mode))
 '(projectile-completion-system 'helm)
 '(projectile-current-project-on-switch 'keep)
 '(projectile-enable-caching t)
 '(projectile-indexing-method 'hybrid)
 '(read-mail-command 'gnus)
 '(recentf-exclude nil)
 '(require-final-newline nil)
 '(scroll-bar-mode nil)
 '(scroll-conservatively 10000)
 '(scroll-margin 7)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tramp-default-method "ssh")
 '(tramp-default-user nil)
 '(tramp-encoding-shell "/bin/bash")
 '(url-proxy-services nil)
 '(use-proxy-display-in-global-mode-string nil)
 '(use-proxy-http-proxy "127.0.0.1:1081")
 '(use-proxy-https-proxy "127.0.0.1:1081")
 '(user-mail-address "execvy@gmail.com")
 '(visible-bell nil)
 '(warning-suppress-log-types '((emacs) (comp) (comp) (comp) (comp)))
 '(warning-suppress-types '((comp) (comp) (comp) (comp)))
 '(window-divider-mode nil)
 '(word-wrap nil)
 '(writeroom-width 148 t))




(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(cursor ((t nil))))
