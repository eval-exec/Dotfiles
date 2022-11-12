;;; package --- Summary
;; <leaf-install-code>
;;; Code:
(setq debug-on-error nil)
										; (setq debug-on-signal t)

(eval-and-compile

  (customize-set-variable
   'package-archives '(("gnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
					   ("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
					   ("org" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))
  (package-initialize)
  (unless (package-installed-p 'leaf)
	(package-refresh-contents)
	(package-install 'leaf))
  (leaf leaf-keywords
	:ensure t
	:init
	;; optional packages if you want to use :hydra, :el-get, :blackout,,,
	;; (leaf hydra :ensure t)
	;; (leaf el-get :ensure t)
	;; (leaf blackout :ensure t)

	:config
	(leaf-keywords-init)
	)
  )

(leaf leaf
  :ensure t
  :custom ((leaf-defaults .	'(
							  :ensure t
							  ;; :leaf-autoload t
							  ;; 				 :leaf-defer t
							  ))))
;; </leaf-install-code>

(leaf quelpa-leaf
  :init
  (setq quelpa-update-melpa-p nil)
  (quelpa-leaf-init)
  )

;; ;; uses the given recipe
;; (leaf info-colors
;;   :quelpa (info-colors :fetcher github :repo "ubolonton/info-colors")
;;   :commands (info-colors-fontify-node)
;;   :hook
;;   (Info-selection-hook #'info-colors-fontify-node)
;;   )


(leaf general
  :custom
  :config
  )

(defun sh/current-time-microseconds ()
  "Return the current time formatted to include microseconds."
  (let* ((nowtime (current-time))
		 (now-ms (nth 2 nowtime)))
	(concat (format-time-string "[%Y-%m-%dT%T" nowtime) (format ".%d]" now-ms))))

(defun sh/ad-timestamp-message (FORMAT-STRING &rest args)
  "Advice to run before `message' that prepends a timestamp to each message.

  Activate this advice with:
  (advice-add 'message :before 'sh/ad-timestamp-message)"
  (unless (string-equal FORMAT-STRING "%s%s")
	(let ((deactivate-mark nil)
		  (inhibit-read-only t))
	  (with-current-buffer "*Messages*"
		(goto-char (point-max))
		(if (not (bolp))
			(newline))
		(insert (sh/current-time-microseconds) " ")))))

(advice-add 'message :before 'sh/ad-timestamp-message)

(setq custom-file "/home/exec/.emacs.d/emacs-custom.el")
(setq completion-styles '(flex basic partial-completion emacs22 ))
(setq buffer-auto-save-file-name custom-file)
(setq warning-suppress-log-types '((comp)))
(setq warning-suppress-types '((comp)))
(toggle-scroll-bar -1)
(setq scroll-conservatively 1000)
(setq scroll-margin 7)
(setq-default tab-width 4)
(setq blink-cursor-blinks 0)
(setq blink-cursor-delay 0.1)
(setq blink-cursor-interval 0.05)
(setq word-wrap-by-category t)
(setq echo-keystrokes nil)
(setq-default mode-line-format
			  '("%e" mode-line-front-space
				(:propertize
				 ("" mode-line-mule-info mode-line-client mode-line-modified mode-line-remote)
				 display
				 (min-width
				  (5.0)))
				mode-line-frame-identification mode-line-buffer-identification "   " mode-line-position
				(vc-mode vc-mode)
				"  " mode-line-modes mode-line-misc-info mode-line-end-spaces))

(setq history-delete-duplicates t)

(setq split-height-threshold 80
	  split-width-threshold 160)

(setq display-buffer-base-action nil)
(setq create-lock-file nil)

(setq display-line-numbers-type 'visual)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(line-number ((t (:family "Liberation Mono"))))
 '(line-number-current-line ((t
							  (
							   :background "#880000"
							   :foreground "#ffffff"
							   :weight extra-bold
							   :family "Liberation Mono"))))
 )




(setq window-resize-pixelwise nil)
(setq frame-resize-pixelwise nil)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq word-wrap nil)
(setq global-visual-line-mode nil)
(setq display-line-numbers-width-start t)
(setq native-comp-async-report-warnings-errors nil)
(setq imenu-auto-rescan t)


(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq make-backup-files nil)
(setq auto-save-default nil)



(setq org-roam-v2-ack t)

(setq inhibit-compacting-font-caches t)

(setq require-final-newline t)
(setq load-prefer-newer t)

(setq url-proxy-services  '(
							("no_proxy" . "^\\(localhost\\|10\\..*\\|192\\.168\\..*\\)")
							("http" . "127.0.0.1:7890")
							("https" . "127.0.0.1:7890")))


(set-default-coding-systems 'utf-8)

(setenv "PATH" "/home/exec/.local/bin:/home/exec/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/exec/scripts:/home/exec/sdk/golang/goroot/bin:/home/exec/sdk/golang/gopath/bin:/usr/lib/jvm/default/bin:/home/exec/scripts:/home/exec/sdk/golang/goroot/bin:/home/exec/sdk/golang/gopath/bin:/home/exec/.cargo/bin")
(setenv "GOROOT" "/home/exec/sdk/golang/goroot")
(setenv "GOPATH" "/home/exec/sdk/golang/gopath")
(setenv "GOPROXY" "https://goproxy.cn,direct")
(setenv "GOBIN" "/home/exec/sdk/golang/gopath/bin")
(setenv "GO111MODULE" "on")
(setenv "LANG" "en_US.UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LC_CTYPE" "zh_CN.UTF-8")
(setenv "GOARCH" "amd64")
(setenv "TERM" "xterm-256color")
(add-to-list 'exec-path "/home/exec/sdk/golang/gopath/bin")
(add-to-list 'exec-path "/home/exec/sdk/golang/goroot/bin/bin")
(add-to-list 'exec-path "/home/exec/.cargo/bin")
										; (add-to-list 'exec-path "/home/exec/.cargo/bin")
										; (add-to-list 'exec-path "/home/exec/.local/bin")
;; (setenv "HTTP_PROXY" "socks5://127.0.0.1:7891")
;; (setenv "HTTPS_PROXY" "socks5://127.0.0.1:7891")
;; (setenv "ALL_PROXY" "socks5://127.0.0.1:7891")

(setq exec/golden-ratio 0.618)



;;; package --- Summary
;;; Commentary:



(leaf gcmh
  :custom
  (gcmh-high-cons-threshold . 50000000)
  (gcmh-idle-delay . 10)
  (gcmh-verbose .  nil)
  :global-minor-mode gcmh-mode
  )


(setq native-comp-always-compile t)
(setq native-comp-async-jobs-number  12)
(setq native-comp-speed 3)

(leaf autorevert
  :doc "revert buffers when files on disk change"
  :tag "builtin"
  :custom ((auto-revert-interval . 0.9))
  :global-minor-mode global-auto-revert-mode)


(general-create-definer C-def
  :states '(normal visual )
  :prefix "C-c"
  )

(leaf evil
  :pre-setq
  (evil-want-keybinding                . nil)
  (evil-disable-insert-state-bindings  . t)
  :init
  (setq evil-want-minibuffer t)
  (setq evil-want-C-i-jump t)
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-C-u-scroll t)
  :bind((:evil-insert-state-map (("M-h" . left-char)
								 ("M-l" . right-char)
								 ("M-j" . next-line)
								 ("M-k" . previous-line))
								))
  :hook
  (after-init-hook . evil-mode)
  :custom (evil-undo-system . 'undo-redo)
  :config

  (setq evil-want-keybinding t)
  (evil-define-key 'normal org-mode-map (kbd "<tab>") #'org-cycle)
  (evil-define-key 'normal org-mode-map (kbd "RET") #'org-return)

  (leaf evil-collection
	:after evil
	:config
	(setq evil-collection-setup-minibuffer t)
	(setq evil-collection-want-find-usages-bindings nil)
	(evil-collection-init))

  (setq evil-want-keybinding t)


  (leaf evil-exchange
	:after evil
	:config (evil-exchange-install))

  (leaf evil-mc
	:after evil
	:config
	:global-minor-mode global-evil-mc-mode)
  (leaf evil-commentary
	:after evil
	:config
	:global-minor-mode evil-commentary-mode)
  (leaf evil-visualstar
	:custom
	(evil-visualstar/persistent . t)
	:global-minor-mode global-evil-visualstar-mode)
  (leaf evil-surround
	:after evil
	:custom (evil-surround-pairs-alist . '((40 "( " . " )")
										   (91 "[ " . " ]")
										   (123 "{ " . " }")
										   (41 "(" . ")")
										   (93 "[" . "]")
										   (125 "{" . "}")
										   (35 "#{" . "}")
										   (98 "(" . ")")
										   (66 "{" . "}")
										   (62 "<" . ">")
										   (116 . evil-surround-read-tag)
										   (60 . evil-surround-read-tag)
										   (102 . evil-surround-function)
										   (61 " =" . "= ")
										   (60 "<" . ">")))
	:global-minor-mode global-evil-surround-mode)
  (leaf evil-terminal-cursor-changer
	:config (evil-terminal-cursor-changer-activate) ; or (etcc-on)
	)
  )
(leaf better-jumper
  :after evil
  :config
  (define-key evil-motion-state-map (kbd "C-o") 'better-jumper-jump-backward)
  (define-key evil-motion-state-map (kbd "C-i") 'better-jumper-jump-forward)
  (setq better-jumper-context 'window)
  (setq better-jumper-add-jump-behavior 'append)
  (setq better-jumper-use-evil-jump-advice t)
  (setq better-jumper-max-length 100)
  (setq better-jumper-use-savehist nil)
  :global-minor-mode better-jumper-mode
  )

(leaf transient-dwim
  :ensure t
  :bind ("M-=" . transient-dwim-dispatch))

(leaf man
  :tag "builtin"
  :hook (Man-mode-hook . (lambda()
						   (set-face-attribute 'Man-overstrike nil :inherit font-lock-type-face :bold t)
						   (set-face-attribute 'Man-underline nil :inherit font-lock-keyword-face :underline t)))
  :config
  (setq Man-width nil)
  (setq Man-width-max nil)
  (setq Man-notify-method 'pushy)
  )

;; (leaf info
;;   :tag "builtin"
;;   :config
;;   (defun niceify-info nil
;; 	"Highlight function, variable, macro, etc. description headers
;; in Info with arbitrary faces."
;; 	(let ((type-face 'italic)
;; 		  (name-face 'bold)
;; 		  (args-face 'italic)
;; 		  (what-it-was inhibit-read-only))
;; 	  (unwind-protect
;; 		  (let (from to line-start)
;; 			(setq inhibit-read-only t)
;; 			(save-match-data
;; 			  (save-excursion
;; 				(beginning-of-buffer)
;; 				(while (re-search-forward "^ -- " nil t)
;; 				  (save-excursion
;; 					(beginning-of-line)
;; 					(setq line-start (point)))

;; 				  (setq from (point))
;; 				  (re-search-forward ":" nil t)
;; 				  (setq to (point))
;; 				  (add-face-text-property from to type-face)

;; 				  (re-search-forward " " nil t)
;; 				  (setq from (point))
;; 				  (re-search-forward " " nil t)
;; 				  (setq to (point))
;; 				  (add-face-text-property from to name-face)

;; 				  (setq from (point))
;; 				  (end-of-line)
;; 				  (add-face-text-property from (point) args-face)))))
;; 		(set-buffer-modified-p nil)
;; 		(setq inhibit-read-only what-it-was))))

;;   ;; apply this function whenever an info page is selected
;;   (add-hook 'Info-selection-hook
;; 			#'niceify-info)
;;   )


(setq posframe-mouse-banish nil)
(leaf avy
  :bind (("C-S-j"  . avy-goto-char-2-below)
		 ("C-S-k"  . avy-goto-char-2-above)))
(leaf elfeed

  :config
  ;; Somewhere in your .emacs file
  (setq elfeed-feeds
		'("http://nullprogram.com/feed/"
		  "https://planet.emacslife.com/atom.xml"))
  (leaf elfeed-dashboard)
  )

(leaf electric
  :tag "builtin"
  :hook ((after-init-hook . electric-pair-mode)
		 (prog-mode-hook . electric-indent-mode)))
(defun read-file (filename)
  (save-excursion (let ((new (get-buffer-create filename))
						(current (current-buffer)))
					(switch-to-buffer new)
					(insert-file-contents filename)
					(mark-whole-buffer)
					(let ((contents
						   (buffer-substring
							(mark)
							(point)
							)))
					  (kill-buffer new)
					  (switch-to-buffer current) contents)))
  )


(leaf devdocs-browser)
(leaf webpaste
  :bind (("C-c C-p C-b" . webpaste-paste-buffer)
		 ("C-c C-p C-r" . webpaste-paste-region)
		 ("C-c C-p C-p" . webpaste-paste-buffer-or-region))
  :config
  (progn
	(setq webpaste-provider-priority '("ix.io" )))
  )

(leaf flycheck
  :hook (
		 (sh-mode-hook .
					   (lambda()
						 (flycheck-add-next-checker 'sh-shellcheck)
						 ))
		 )
  :config
  (leaf flycheck-color-mode-line
	:global-minor-mode  flycheck-color-mode-line-mode)
  ;; (leaf flycheck-pos-tip
  ;; 	:global-minor-mode flycheck-pos-tip-mode)
  (leaf flycheck-status-emoji
	:global-minor-mode flycheck-status-emoji-mode)
  (leaf flycheck-aspell
	:after (flycheck ispell)
	:custom (ispell-dictionary . "en_US")
	(ispell-program-name . "aspell")
	(ispell-silently-savep . t)
	(ispell-extra-args . '("--sug-mode=ultra" "--lang=en_US")))
  (leaf flycheck-rust)
  (leaf flycheck-languagetool
	:hook (text-mode-hook . (lambda ()
							  (require 'flycheck-languagetool)))
	:init (setq flycheck-languagetool-server-jar "~/cache/languagetool.jar")
	(setq flycheck-languagetool-language "zh-CN")
	:config)
  (setq flycheck-display-errors-delay 0)
  (leaf attrap
	:bind ("C-x /" . attrap-attrap))
  ;; :global-minor-mode global-flycheck-mode
  )

(leaf ispell
  :global-minor-mode ispell-minor-mode
  )
(leaf emojify
  :hook (
		 org-mode-hook . emojify-mode
		 )
  ;; :global-minor-mode global-emojify-mode
  )


(defun exec/toggle-transparency ()
  (interactive)
  (let ((alpha (frame-parameter nil 'alpha)))
	(set-frame-parameter
	 nil 'alpha
	 (if (eql (cond ((numberp alpha) alpha)
					((numberp (cdr alpha)) (cdr alpha))
					;; Also handle undocumented (<active> <inactive>) form.
					((numberp (cadr alpha)) (cadr alpha)))
			  100)
		 '(85 . 50) '(100 . 100)))))


(leaf git-gutter
  :config
  :global-minor-mode global-git-gutter-mode
  )

(leaf valign
  :disabled t
  :hook
  ;; (org-mode-hook . valign-mode)
  )




(defun exec/put-file-name-on-clipboard ()
  "Put the current file name on the clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode) default-directory (buffer-file-name))))
	(when filename (with-temp-buffer (insert filename)
									 (clipboard-kill-region (point-min)
															(point-max)))
		  (message filename))) )

(general-define-key :state
					'normal "C-S-c" 'exec/put-file-name-on-clipboard)

(leaf elisp-refs)

(defun print-elements-of-list (list)
  "Print each element of LIST on a line of its own."
  (while list
	(print (car list))
	(setq list (cdr list))))

(leaf yaml-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
  )
(leaf toml-mode)
(leaf ssh-config-mode)


(leaf quickrun
  :bind (
		 ("C-c q" . quickrun)
		 )
  :config
  (setq quickrun-focus-p nil)
  )



(leaf prescient
  :global-minor-mode prescient-persist-mode)

(leaf esup
  :config
  )
(leaf vertico
  :bind (
		 (:vertico-map
		  ("?" . minibuffer-completion-help)
		  ("M-RET" . minibuffer-force-complete-and-exit)
		  ("M-TAB" . minibuffer-complete)
		  )
		 )
  ;; (define-key vertico-map "?" #'minibuffer-completion-help)
  ;; (define-key vertico-map (kbd "M-RET") #'minibuffer-force-complete-and-exit)
  ;; (define-key vertico-map (kbd "M-TAB") #'minibuffer-complete)
  :config
  (setq
   vertico-count 20
   vertico-resize t
   )



  (leaf vertico-posframe
	:global-minor-mode vertico-posframe-mode
	)

  :global-minor-mode vertico-mode
  )
;; Enable richer annotations using the Marginalia package
(leaf marginalia
  ;; Either bind `marginalia-cycle` globally or only in the minibuffer
  :bind (
		 ("M-A" . marginalia-cycle)
		 (:minibuffer-local-map
		  ("M-A" . marginalia-cycle))
		 )

  ;; The :init configuration is always executed (Not lazy!)
  ;; Must be in the :init section of use-package such that the mode gets
  ;; enabled right away. Note that this forces loading the package.
  :global-minor-mode marginalia-mode)

;; Example configuration for Consult
(leaf consult
  ;; Replace bindings. Lazily loaded due by `use-package'.
  :bind (;; C-c bindings (mode-specific-map)
		 ("C-x C-r" . consult-recent-file)
		 ("C-c c h" . consult-history)
		 ("C-c c m" . consult-mode-command)
		 ("C-c c k" . consult-kmacro)
		 ;; C-x bindings (ctl-x-map)
		 ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
		 ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
		 ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
		 ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
		 ("C-x r b" . consult-bookmark)            ;; orig. bookmark-jump
		 ("C-x p b" . consult-project-buffer)      ;; orig. project-switch-to-buffer
		 ;; Custom M-# bindings for fast register access
		 ("M-#" . consult-register-load)
		 ("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
		 ("C-M-#" . consult-register)
		 ;; Other custom bindings
		 ("M-y" . consult-yank-pop)                ;; orig. yank-pop
		 ("<help> a" . consult-apropos)            ;; orig. apropos-command
		 ;; M-g bindings (goto-map)
		 ("M-g e" . consult-compile-error)
		 ("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
		 ("M-g g" . consult-goto-line)             ;; orig. goto-line
		 ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
		 ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
		 ("M-g m" . consult-mark)
		 ("M-g k" . consult-global-mark)
		 ("M-g i" . consult-imenu)
		 ("M-g i" . consult-imenu-multi)
		 ;; M-s bindings (search-map)
		 ("M-s d" . consult-find)
		 ("M-s D" . consult-locate)
		 ("M-s g" . consult-grep)
		 ("M-s G" . consult-git-grep)
		 ("M-s r" . consult-ripgrep)
		 ("M-s l" . consult-line)
		 ("M-s L" . consult-line-multi)
		 ("M-s m" . consult-multi-occur)
		 ("M-s k" . consult-keep-lines)
		 ("M-s u" . consult-focus-lines)
		 ;; Isearch integration
		 ("M-s e" . consult-isearch-history)
		 ;; Consult
		 ;; ("M-c r" . consult-recent-file)
		 (:isearch-mode-map
		  ("M-e" . consult-isearch-history)         ;; orig. isearch-edit-string
		  ("M-s e" . consult-isearch-history)       ;; orig. isearch-edit-string
		  ("M-s l" . consult-line)                  ;; needed by consult-line to detect isearch
		  ("M-s L" . consult-line-multi))            ;; needed by consult-line to detect isearch
		 ;; Minibuffer history
		 (:minibuffer-local-map
		  ("M-s" . consult-history)                 ;; orig. next-matching-history-element
		  ("M-r" . consult-history)))                ;; orig. previous-matching-history-element

  ;; Enable automatic preview at point in the *Completions* buffer. This is
  ;; relevant when you use the default completion UI.
  :hook (completion-list-mode . consult-preview-at-point-mode)

  ;; The :init configuration is always executed (Not lazy)
  :init

  ;; Optionally configure the register formatting. This improves the register
  ;; preview for `consult-register', `consult-register-load',
  ;; `consult-register-store' and the Emacs built-ins.
  (setq register-preview-delay 0.5
		register-preview-function #'consult-register-format)

  ;; Optionally tweak the register preview window.
  ;; This adds thin lines, sorting and hides the mode line of the window.
  (advice-add #'register-preview :override #'consult-register-window)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
		xref-show-definitions-function #'consult-xref)

  ;; Configure other variables and modes in the :config section,
  ;; after lazily loading the package.
  :config

  ;; Optionally configure preview. The default value
  ;; is 'any, such that any key triggers the preview.
  ;; (setq consult-preview-key 'any)
  ;; (setq consult-preview-key (kbd "M-."))
  ;; (setq consult-preview-key (list (kbd "<S-down>") (kbd "<S-up>")))
  ;; For some commands and buffer sources it is useful to configure the
  ;; :preview-key on a per-command basis using the `consult-customize' macro.
  (consult-customize
   consult-theme
   :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-bookmark consult--source-recent-file
   consult--source-project-recent-file
   :preview-key (kbd "M-."))

  ;; Optionally configure the narrowing key.
  ;; Both < and C-+ work reasonably well.
  (setq consult-narrow-key "<") ;; (kbd "C-+")

  ;; Optionally make narrowing help available in the minibuffer.
  ;; You may want to use `embark-prefix-help-command' or which-key instead.
  ;; (define-key consult-narrow-map (vconcat consult-narrow-key "?") #'consult-narrow-help)

  ;; By default `consult-project-function' uses `project-root' from project.el.
  ;; Optionally configure a different project root function.
  ;; There are multiple reasonable alternatives to chose from.
  ;;;; 1. project.el (the default)
  ;; (setq consult-project-function #'consult--default-project--function)
  ;;;; 2. projectile.el (projectile-project-root)
  ;; (autoload 'projectile-project-root "projectile")
  ;; (setq consult-project-function (lambda (_) (projectile-project-root)))
  ;;;; 3. vc.el (vc-root-dir)
  ;; (setq consult-project-function (lambda (_) (vc-root-dir)))
  ;;;; 4. locate-dominating-file
  ;; (setq consult-project-function (lambda (_) (locate-dominating-file "." ".git")))

  (leaf consult-org-roam)
  (leaf consult-ag)
  (leaf consult-flycheck)
  (leaf consult-projectile)
  (leaf consult-project-extra)
  )





;; A few more useful configurations...
(leaf emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (setq completion-cycle-threshold 3)
  (setq tab-always-indent 'complete)


  (defun crm-indicator (args)
	(cons (format "[CRM%s] %s"
				  (replace-regexp-in-string
				   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
				   crm-separator)
				  (car args))
		  (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
		'(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  (setq read-extended-command-predicate
		#'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

;; Optionally use the `orderless' completion style.
(leaf orderless
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq read-file-name-completion-ignore-case t
		read-buffer-completion-ignore-case t
		completion-ignore-case t)
  (setq completion-styles '(orderless  substring partial-completion basic flex)
		completion-category-defaults nil
		completion-category-overrides '((file (styles partial-completion)))))



(leaf kind-icon
  :after corfu
  :config
  (setq kind-icon-default-face 'corfu-default) ; to compute blended backgrounds correctly
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(leaf beacon
  :config
  (setq beacon-blink-when-focused t)
  (setq beacon-blink-when-buffer-changes t)
  (setq beacon-blink-when-window-scrolls t)
  (setq beacon-blink-when-window-changes t)
  (setq beacon-blink-when-point-moves-vertically t)
  (setq beacon-blink-when-point-moves-horizontally t)
  (setq beacon-color "#880000")
  ;; :global-minor-mode beacon-mode
  )
(leaf imenu-anywhere
  :config
  )

(leaf ibuffer
  :bind ("C-x C-b" . ibuffer)
  :config (setq ibuffer-filter-group-name-face
				'(:inherit (font-lock-string-face bold)
						   ))
  (leaf all-the-icons-ibuffer
	:init (setq  all-the-icons-ibuffer-human-readable-size t)
	(setq all-the-icons-ibuffer-formats '((mark modified read-only locked
												" " (icon 2 2 :left :elide)
												" " (name 80 -1 :left :elide)
												" " (size-h 10 -1 :left)
												" " (mode+ 24 -1 :left)
												" " (filename-and-process+ -1 -1 :left))))
	:config (all-the-icons-ibuffer-mode 1)))

(leaf pdf-tools
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :custom
  (pdf-view-display-size . 'fit-height)
  )

(leaf pdf-continuous-scroll-mode
  :ensure nil
  :load-path "/home/exec/.emacs.d/elisp/pdf-continuous-scroll-mode.el"
  :hook (pdf-view-mode-hook . pdf-continuous-scroll-mode)
  )

(leaf prompts
  )

(defun exec/open-config()
  "open config file"
  (interactive)
  (if (equal (buffer-name) "init.el")
	  (kill-this-buffer)
	(find-file user-init-file))
  )

( global-set-key (kbd "<f12>") 'exec/open-config)
( global-set-key (kbd "H-k") 'kill-current-buffer)


(leaf ibuffer-projectile
  ;;:functions all-the-icons-octicon ibuffer-do-sort-by-alphabetic
  :hook
  ((ibuffer-mode-hook . (lambda ()
						  (message "ibuffer projectile groups")
						  (ibuffer-projectile-set-filter-groups)
						  (unless (eq ibuffer-sorting-mode 'alphabetic)
							(ibuffer-do-sort-by-alphabetic)))))
  :config
  (setq ibuffer-projectile-prefix
		(concat
		 (all-the-icons-octicon "file-directory"
								:face
								ibuffer-filter-group-name-face
								:v-adjust 0.0
								:height 1.0) " ")))


;; (leaf persp-mode
;;   :config

;;   (setq wg-morph-on nil) ;; switch off animation
;;   (setq persp-autokill-buffer-on-remove 'kill-weak)

;;   (add-hook 'window-setup-hook #'(lambda () (persp-mode 1)))
;;   )




;; (with-eval-after-load 'counsel
;;   (with-no-warnings
;;     (defun my-ibuffer-find-file ()
;;       (interactive)
;;       (let ((default-directory (let ((buf (ibuffer-current-buffer)))
;;                                  (if (buffer-live-p buf)
;;                                      (with-current-buffer buf
;;                                        default-directory)
;;                                    default-directory))))
;;         (counsel-find-file default-directory)))
;;     (advice-add #'ibuffer-find-file :override #'my-ibuffer-find-file))))

;; Group ibuffer's list by project root
(leaf leetcode
  :custom (leetcode-prefer-language . "cpp")
  (leetcode-prefer-sql  . "mysql")
										;(leetcode-save-solutions . t)
										;(leetcode-directory . "/home/exec/github.com/eval-exec/Algorithm/LeetCode/eleet")
  )
;; (set inferior-lisp-program "sbcl")
;; (leaf common-lisp-snippets)

(leaf slime
  :config (setq inferior-lisp-program "sbcl"))



(leaf lsp-mode
  :hook (
		 (rust-mode-hook . lsp)
		 )
  :config
  (setq lsp-enable-snippet t)
  (leaf lsp-ui
	:bind
	(:evil-normal-state-map (
							 ("gd" . lsp-ui-peek-find-definitions)
							 ("gr" . lsp-ui-peek-find-references)
							 ))

	)
  )
(leaf rust-mode
  :config (add-hook 'rust-mode-hook (lambda ()
									  (setq indent-tabs-mode nil)))
  (setq rust-format-on-save t)
  )
(leaf rust-playground)
(leaf go-mode
  :hook (
		 (go-mode-hook . tree-sitter-hl-mode)
		 )
  :config
  (leaf go-impl)
  (leaf go-guru)
  (leaf go-expr-completion
	:bind("C-c C-c" . go-expr-completion)
	)
  )

(leaf elpy)





(leaf citre
  :init
  (require 'citre-config)
  :bind
  (
   ("C-x c j" . 'citre-jump)
   ("C-x c J" . 'citre-jump-back)
   ("C-x c p" . 'citre-ace-peek)
   ("C-x c u" . 'citre-update-this-tags-file)
   )

  :config
  (setq
   citre-default-create-tags-file-location 'global-cache
   citre-project-root-function #'projectile-project-root
   citre-prompt-language-for-ctags-command t
   citre-use-project-root-when-creating-tags t
   citre-auto-enable-citre-mode-modes '(prog-mode emacs-lisp-mode)
   )
  )

(leaf company
  :global-minor-mode  (global-company-mode company-tng-mode)
  :bind
  (:company-mode-map
   ([remap indent-for-tab-command]
	. company-indent-or-complete-common)
   ("M-/" . company-files))
  (:company-active-map
   ("C-o"        . company-search-kill-others)
   ("C-n"        . company-select-next)
   ("C-p"        . company-select-previous)
   ("C-h"        . company-quickhelp-manual-begin)
   ("C-S-h"      . company-show-doc-buffer)
   ("C-s"        . company-search-candidates)
   ("M-s"        . company-filter-candidates)
   ([C-tab]      . company-complete)
   ([tab]        . company-complete-common-or-cycle)
   ([backtab]    . company-select-previous))
  (:company-search-map
   ("C-n"        . company-search-repeat-forward)
   ("C-p"        . company-search-repeat-backward)
   )

  :config
  (setq company-idle-delay  0.1) ;; default is 0.2
  (setq company-minimum-prefix-length  0)
  (setq company-selection-wrap-around  t)
  (setq company-show-quick-access t)
  (setq company-text-icons-add-background  t)
  (setq company-tooltip-align-annotations  t)
  (setq company-tooltip-flip-when-above  t)
  (setq company-transformers  '(company-sort-prefer-same-case-prefix))
  (setq company-tooltip-limit  10)
  (setq company-backends  '(
							;; company-capf
							;; company-ispell
							company-semantic
							;; company-elisp
							;; (company-dabbrev-code company-gtags company-etags company-keywords)
							;; company-bbdb
							;; company-ispell
							;; company-cmake
							;; company-clang
							;; company-files
							;; company-oddmuse
							;; company-yasnippet
							;; company-tabnine
							))
  ;; (setq company-insertion-triggers t)
  (setq company-semantic-insert-arguments t)
  ;; (leaf company-tabnine
  ;; 	:config
  ;; 	(setq company-tabnine-install-static-binary t)
  ;; 	;; (setq company-tabnine-wait 0.25) company ideafjeiw what can you what can what can you sacrifice ?
  ;; 	)
  (leaf company-flx
	:hook (company-mode-hook . company-flx-mode)
	)
  (leaf company-box
	:hook
	;; (company-mode-hook . company-box-mode)
	:config
	(setq company-box-max-candidates 25)
	(setq company-box-doc-delay 0)
	(setq company-box-icons-alist 'company-box-icons-all-the-icons)
	)
  (leaf company-prescient
	:init (company-prescient-mode))
  )

(leaf tree-sitter-langs)
(leaf tree-sitter-indent)

(leaf tree-sitter
  :hook (tree-sitter-after-on-hook . tree-sitter-hl-mode)
  :global-minor-mode global-tree-sitter-mode
  )

(leaf modern-cpp-font-lock
  ;; :global-minor-mode modern-c++-font-lock-global-mode
  )
(leaf color-identifiers-mode
  :global-minor-mode global-color-identifiers-mode)

(leaf magit
  :config (leaf forge))

(leaf rainbow-delimiters
										; :hook ((prog-mode-hook emacs-lisp-mode-hook) .  rainbow-delimiters-mode)
  )
(leaf solidity-mode)

(leaf calendar
  :config (setq calendar-latitude 39.903829718
				calendar-longitude 116.374498502)
  (setq view-diary-entries-initially t
		mark-diary-entries-in-calendar t
		number-of-diary-entries 7)
  (setq diary-file "~/org/diary/diary"))


(leaf helpful
  :bind
  ;; Note that the built-in `describe-function' includes both functions
  ;; and macros. `helpful-function' is functions only, so we provide
  ;; `helpful-callable' as a drop-in replacement.
  (("C-h f" . helpful-callable)
   ("C-h v" . helpful-variable)
   ("C-h k" . helpful-key)
   ("C-h F" . helpful-function)
   ("C-c C-d" . helpful-at-point)

   ;; Look up *C*ommands.
   ;;
   ;; By default, C-h C is bound to describe `describe-coding-system'. I
   ;; don't find this very useful, but it's frequently useful to only
   ;; look at interactive functions.
   ("C-h C" . helpful-command)))

(leaf super-save
  ;; :custom
  ;; (super-save-auto-save-when-idle . nil)
  ;; (super-save-idle-duration . 1)
  ;; :global-minor-mode super-save-mode
  )

(leaf 2048-game)



(leaf hungry-delete
  :config
  :global-minor-mode global-hungry-delete-mode)


(leaf nov
  :config (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode)))


(leaf winner
  :tag "builtin"
  :bind(("H-<left>" . winner-undo)
		("H-<right>" . winner-redo))
  :global-minor-mode winner-mode)
(leaf pangu-spacing
  :disabled nil
  :custom (pangu-spacing-real-insert-separtor . t)
  :global-minor-mode global-pangu-spacing-mode
  )

(setq confirm-kill-emacs 'yes-or-no-p)
(tool-bar-mode -1)

(leaf recentf
  :tag "builtin"
  :custom ((recentf-auto-cleanup . 'never)
		   (recentf-exclude . nil)
		   (recentf-max-menu-items . 1000)
		   (recentf-max-saved-items . 1000))
  :global-minor-mode recentf-mode
  )

(leaf saveplace
  :tag "builtin"
  :global-minor-mode save-place-mode)

(leaf atomic-chrome
  :disabled t
  :hook (after-init-hook . atomic-chrome-start-server)
  :config (setq atomic-chrome-enable-auto-update nil))





(defun toggle-display-global-line-numbers()
  (interactive)
  (if (bound-and-true-p global-display-line-numbers-mode)
	  (setq on -1)
	(setq on +1))
  (global-display-line-numbers-mode on)
  )

(defun toggle-display-line-numbers()
  (setq display-line-numbers 'visual)
  (setq display-line-numbers-type 'visual)
  (setq on +1)
										;(interactive)
  (if (bound-and-true-p display-line-numbers-mode)
	  (setq on -1))
  (display-line-numbers-mode on)
  )

(global-set-key (kbd "<f6>")
				(lambda ()
				  (interactive)
				  (toggle-display-line-numbers)))

(global-set-key (kbd "C-c <f6>")
				(lambda ()
				  (interactive)
				  (toggle-display-global-line-numbers)))


(leaf telega
  :config
  (setq telega-animation-play-inline t)
  (setq telega-chat-show-avatars nil)
  (setq telega-photo-show-details nil)
  (setq telega-server-libs-prefix "/usr")
  (setq telega-proxies
		(list
		 '(:server "127.0.0.1" :port 7891 :enable t
				   :type (:@type "proxyTypeSocks5")))))

(leaf mermaid-mode)

(leaf gnuplot)
(leaf mpv)
(leaf netease-cloud-music
  :config
  )

(leaf vimrc-mode)

(leaf format-all
  :hook
  ;; (prog-mode-hook . format-all-ensure-formatter)
  ;; (emacs-lisp-mode-hook . format-all-ensure-formatter)
  :config
  (setq format-all-show-errors 'never)
  )
(leaf clang-format)

(leaf elisp-format
  :disabled t)

(defun skx/update-org-modified-property ()
  "If a file contains a '#+LAST_MODIFIED' property update it to contain
  the current date/time"
  (interactive)
  (save-excursion (widen)
				  (goto-char (point-min))
				  (when (re-search-forward "^#\\+LAST_MODIFIED:" (point-max) t)
					(progn (kill-line)
										;(insert (format-time-string " %d/%m/%Y %H:%M:%S") )))))
						   (insert (format-time-string " [%Y-%m-%d %a %H:%M]") ))))
  )



(defun solar-sunrise-string (date &optional nolocation)
  "String of *local* time of sunrise and daylight on Gregorian DATE."
  (let ((l (solar-sunrise-sunset date)))
	(format "%s (%s hours daylight)" (if (car l)
										 (concat "Sunset " (apply 'solar-time-string (car l)))
									   "no sunset")
			(nth 2 l)))
  )
;; To be called from diary-list-sexp-entries, where DATE is bound.
;;;###diary-autoload
(defun diary-sunrise ()
  "Local time of sunrise as a diary entry.
  Accurate to a few seconds."
  (or (and calendar-latitude
		   calendar-longitude
		   calendar-time-zone
		   )
	  (solar-setup)
	  )
  (solar-sunrise-string date)
  )

(defun solar-sunset-string (date &optional nolocation)
  "String of *local* time of sunset and daylight on Gregorian DATE."
  (let ((l (solar-sunrise-sunset date)))
	(format "%s (%s hours daylight)" (if (cadr l)
										 (concat "Sunset " (apply 'solar-time-string (cadr l)))
									   "no sunset")
			(nth 2 l)))
  )
;; To be called from diary-list-sexp-entries, where DATE is bound.
;;;###diary-autoload
(defun diary-sunset ()
  "Local time of sunset as a diary entry.
  Accurate to a few seconds."
  (or (and calendar-latitude
		   calendar-longitude
		   calendar-time-zone
		   )
	  (solar-setup)
	  )
  (solar-sunset-string date)
  )

(defun skx-org-mode-before-save-hook ()
  (when (eq major-mode 'org-mode)
	(skx/update-org-modified-property))
  )


(leaf org
  :hook (
		 (
		  (before-save-hook . skx-org-mode-before-save-hook)
		  )
		 (org-trigger-hook . save-buffer)

		 ;; (org-agenda-mode-hook  . (lambda () 
		 ;; 							 (visual-line-mode -1) 
		 ;; 							 (setq truncate-lines 1)))
		 )
  :config


  (setq org-startup-truncated   nil)
	  ;;;;;;; org-agenda-begin
  (setq org-log-done  'time)
  (setq org-agenda-files  '("~/org" "~/org/work" "~/org/personal" "~/org/journal" "~/org/notes" "~/org/roam"))
										;(org-agenda-include-diary . t)
  (setq org-agenda-time-grid '((daily today require-timed)
							   (000 100 200 300 400 500 600 700 800 900 1000 1100 1200 1300 1400 1500 1600 1700 1800 1900 2000 2100 2200 2300 2400)
							   "......"
							   "----------------"))
  (setq org-agenda-use-tag-inheritance  t)
  (setq org-agenda-window-setup 'current-window)
  (setq org-agenda-restore-windows-after-quit  t)
	  ;;;;;;; org-agenda-end
  (setq org-startup-with-inline-images t)
  (setq org-tag-beautify-mode  t)
  (setq org-confirm-babel-evaluate  t)
  (setq org-return-follows-link   t)
  (setq org-enforce-todo-dependencies  t)
  (setq org-enforce-todo-checkbox-dependencies  t)
  (setq org-ellipsis " ⭍")
  (setq org-default-notes-file  "~/org/notes/")
  (setq org-capture-templates '(
								("w" "work" entry
								 (file+headline  "~/org/work/work.org" "WORK" )
								 "** TODO [#B] %i %?
		 %T
		 ")
								("p" "personal stuff" entry (file+headline "~/org/personal/personal.org" "Personl")
								 "* TODO %i %?")
								("e" "EXEC" plain (file+headline "~/org/personal/exec.org" "EXEC") "** %i %?")

								("c" "Code Stuff")
								("cl" "LeetCode"
								 plain
								 (file+headline "~/org/personal/leetocde.org" "Daily Challenge")
								 "** %T %i %?
		  #+BEGIN_SRC c

		  #+END_SRC
		  ")
								))
  (setq org-todo-keywords
		'((sequence "TODO(t)" "|" "SKIP(s)" "CANCEL(c)" "DONE(d)")
		  (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
		  ))
  (C-def
	"o" '(nil :which-key "Org Mode")
	"ol" 'org-store-link
	"oa" 'org-agenda
	"oc" 'org-capture
	)
  (leaf org-super-agenda
	)

  ;; active Babel languages
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
	 (gnuplot . t)
	 )
   )

  (leaf ftable)
  (leaf org-superstar
	:hook (org-mode-hook . org-superstar-mode)
	:config (setq org-hide-leading-stars nil)
	(setq org-superstar-leading-bullet ?\s)
	(setq org-indent-mode-turns-on-hiding-stars nil)
	(setq org-superstar-special-todo-items t))
  (leaf org-cliplink
	:after (org))
  (leaf org-appear
	:after (org)
	:hook
	(org-mode-hook . org-appear-mode)
	)

  (leaf org-modern
	:after (org)
	:global-minor-mode global-org-modern-mode)
  (leaf ob-go)
  (leaf ob-rust)


  (leaf org-download
	:config

	;; (setq org-download-method 'directory)
	(setq org-download-method 'attach)
	(setq org-download-screenshot-method "flameshot gui --raw > %s")
	)
  )


(leaf org-journal
  :bind (
		 ("C-c o j" . org-journal-new-entry)
		 )
  :config
  (setq org-journal-dir  "~/org/journal/")
  (setq org-journal-date-format   "%F, %A")
  (setq org-journal-time-format  "%T ")
  (setq org-journal-file-format  "%Y.org")  ; their file names
  (setq org-journal-file-type  'yearly)
  (setq org-journal-enable-agenda-integration  t)
  (setq org-journal-enable-cache  t)
  )





(leaf hl-todo
  :config (hl-todo-mode))


;; good morning
(leaf fanyi
  :leaf-defer t
  :init
  (setq read-extended-command-predicate #'command-completion-default-include-p)
  :custom
  (fanyi-providers .	'(
						  ;; fanyi-haici-provider
						  ;; fanyi-etymon-provider
						  ;; fanyi-longman-provider
						  fanyi-youdao-thesaurus-provider
						  ;; fanyi-libre-provider
						  ))
  )



(leaf deft
  :after org
  :custom (deft-extensions . '("txt" "org" "md"))
  (deft-directory . "~/org/")
  (deft-recursive . t)
  (deft-use-filename-as-title . t)
  :bind (("C-c d d" . deft)
		 ("C-c d f" . deft-find-file)))

(leaf org-roam
  :init
  (require 'ucs-normalize)
  (setq org-roam-directory "~/org/roam/"
		org-roam-db-location "~/.cache/org-roam/org-roam.db")

  :bind (
		 ("C-c n l" . org-roam-buffer-toggle)
		 ("C-c n f" . org-roam-node-find)
		 ("C-c n F" . org-roam-ref-find)
		 ("C-c n g" . org-roam-graph)
		 ("C-c n i" . org-roam-node-insert)
		 ("C-c n I" . org-id-get-create)
		 ("C-c n c" . org-roam-capture)
		 ("C-c n r" . org-roam-refile)

		 ;; org roam properties
		 ("C-c n o a" . org-roam-alias-add)
		 ("C-c n o A" . org-roam-alias-remove)
		 ("C-c n o t" . org-roam-tag-add)
		 ("C-c n o T" . org-roam-tag-remove)
		 ("C-c n o r" . org-roam-ref-add)
		 ("C-c n o R" . org-roam-ref-remove)

		 ;; org roam dailies
		 ("C-c n d c d" . org-roam-dailies-capture-date)
		 ("C-c n d c c" . org-roam-dailies-capture-today)
		 ("C-c n d c m" . org-roam-dailies-capture-tomorrow)
		 ("C-c n d c y" . org-roam-dailies-capture-yesterday)
		 ("C-c n d d" . org-roam-dailies-goto-date)
		 ("C-c n d m" . org-roam-dailies-goto-tomorrow)
		 ("C-c n d t" . org-roam-dailies-goto-today)
		 ("C-c n d y" . org-roam-dailies-goto-yesterday)
		 ("C-c n d -" . org-roam-dailies-find-directory)
		 )
  :config
  (setq org-roam-completion-everywhere t)
  (setq  org-roam-node-display-template` "${title:*} ${tags:30}")
  ;; default is "${title:*} ${tags:10}"
  ;; remove :* and :10
  (setq
   org-roam-dailies-directory "dailies/"
   org-roam-db-gc-threshold most-positive-fixnum
   org-roam-mode-section-functions (list #'org-roam-backlinks-section
										 #'org-roam-reflinks-section
										 ;; #'org-roam-unlinked-references-section
										 )
   org-roam-capture-templates '(("d" "default" plain "%?"
								 :if-new (file+head "${slug}-%<%Y%m%d%H%M%S>.org"
													"#+TITLE: ${title}
#+FILETAGS:
#+CREATED_AT: %u
#+LAST_MODIFIED: <>
") :unnarrowed t)))

  (add-to-list 'display-buffer-alist
			   '("\\*org-roam\\*"
				 (display-buffer-in-side-window)
				 (side . right)
				 (slot . 0)
				 (window-width . 0.33)
				 (window-parameters . ((no-other-window . t)
									   (no-delete-other-windows . t)))))
  :global-minor-mode org-roam-db-autosync-mode)


(leaf org-roam-ui
  :after org-roam ;; or :after org
  ;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
  ;;         a hookable mode anymore, you're advised to pick something yourself
  ;;         if you don't care about startup time, use
  ;;  :hook (after-init . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
		org-roam-ui-follow t
		org-roam-ui-update-on-save t
		org-roam-ui-open-on-start t))

(leaf websocket)

(leaf org-download
  :after org
  :hook (org-mode-hook . org-download-enable)
  :config (setq-default org-download-image-dir "~/Pictures/org/"))
(leaf projectile
  :bind("C-c p" . projectile-command-map)
  :custom
  :config
  (setq projectile-current-project-on-switch 'keep)
  (setq projectile-indexing-method 'alien)
  (setq projectile-per-project-compilation-buffer t)
  (setq projectile-enable-caching t)
  :global-minor-mode projectile-mode
  )


(leaf yasnippet
  :bind (("H-i" . yas-insert-snippet)
		 ("H-e" . yas-expand))
  :config
  )
(leaf yasnippet-snippets
  :global-minor-mode  yas-global-mode)

(C-def
  "e" '(nil :which-key "Emacs Stuff")
  "ef" 'leaf-find
  "ec" 'customize-group
  )

(general-def 'normal "gd" 'evil-jump-to-tag)


(leaf treemacs
  :leaf-defer t
  ;; :init (with-eval-after-load 'winum (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  ;; :init (with-eval-after-load 'winum (evil-leader/set-key "n" 'treemacs-select-window))
  :config

  (general-def treemacs-mode-map
	"p" 'treemacs-goto-parent-node
	)

  (progn
	(setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
		  treemacs-deferred-git-apply-delay      0.5
		  treemacs-directory-name-transformer  #'identity
		  treemacs-display-in-side-window        t
		  treemacs-eldoc-display t
		  treemacs-file-event-delay              5000
		  treemacs-file-extension-regex treemacs-last-period-regex-value
		  treemacs-file-follow-delay             0.2
		  treemacs-file-name-transformer         #'identity
		  treemacs-follow-after-init t
		  treemacs-expand-after-init             t
		  treemacs-git-command-pipe ""
		  treemacs-goto-tag-strategy             'refetch-index
		  treemacs-indentation 2
		  treemacs-indentation-string            " "
		  treemacs-is-never-other-window nil
		  treemacs-max-git-entries               5000
		  treemacs-missing-project-action 'ask
		  treemacs-move-forward-on-expand        nil
		  treemacs-no-png-images nil
		  treemacs-no-delete-other-windows       t
		  treemacs-project-follow-cleanup nil
		  treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist"
																   user-emacs-directory)
		  treemacs-position                      'left
		  treemacs-read-string-input 'from-child-frame
		  treemacs-recenter-distance  0.1
		  treemacs-recenter-after-file-follow    nil
		  treemacs-recenter-after-tag-follow nil
		  treemacs-recenter-after-project-jump   'always
		  treemacs-recenter-after-project-expand 'on-distance
		  treemacs-litter-directories  '("/node_modules" "/.venv" "/.cask")
		  treemacs-show-cursor                   nil
		  treemacs-show-hidden-files             t
		  treemacs-silent-filewatch nil
		  treemacs-silent-refresh                nil
		  treemacs-sorting 'alphabetic-asc
		  treemacs-space-between-root-nodes      t
		  treemacs-tag-follow-cleanup            t
		  treemacs-tag-follow-delay 1.5
		  treemacs-user-mode-line-format         nil
		  treemacs-user-header-line-format nil
		  treemacs-width                         35
		  treemacs-workspace-switch-cleanup nil)

	;; The default width and height of the icons is 22 pixels. If you are
	;; using a Hi-DPI display, uncomment this to double the icon size.
	;;(treemacs-resize-icons 44)
	(treemacs-follow-mode t)
	(treemacs-filewatch-mode t)
	(treemacs-fringe-indicator-mode 'always)
	(pcase (cons (not (null (executable-find "git")))
				 (not (null treemacs-python-executable)))
	  (`(t . t)
	   (treemacs-git-mode 'deferred))
	  (`(t . _)
	   (treemacs-git-mode 'simple)))
	(treemacs-hide-gitignored-files-mode t)
	)
  :bind(("M-0"       . treemacs-select-window)
		("C-x t 1"   . treemacs-delete-other-windows)
		("C-x t t"   . treemacs)
		("C-x t d"   . treemacs-display-current-project-exclusively)
		("C-x t B"   . treemacs-bookmark)
		("C-x t C-t" . treemacs-find-file)
		("C-x t M-t" . treemacs-find-tag))

  )






(leaf treemacs-evil
  :after (evil treemacs)
  )



(leaf treemacs-projectile
  :after (treemacs projectile)
  :ensure t)



(leaf treemacs-magit
  :after (treemacs magit)
  :ensure t)

(defvar mode-line-cleaner-alist
  `((company-mode . " α")
	(company-box-mode . " β")
	(yas-minor-mode . " υ")
	(paredit-mode . " π")
	(eldoc-mode . "")
	(abbrev-mode . "")
	;; Major modes
	(lisp-interaction-mode . " λ")
	(hi-lock-mode . "")
	(python-mode . " Py")
	(git-gutter-mode . " G")
	(projectile-mode . " P")
	(emacs-lisp-mode . " EL")
	(nxhtml-mode . " nx"))
  "Alist for `clean-mode-line'.

When you add a new element to the alist, keep in mind that you
must pass the correct minor/major mode symbol and a string you
want to use in the modeline *in lieu of* the original.")

(leaf restart-emacs
  :config
  (C-def
	"er" 'restart-emacs
	)
  )
(defun clean-mode-line ()
  (interactive)
  (cl-loop for cleaner in mode-line-cleaner-alist
		   do (let* ((mode (car cleaner))
					 (mode-str (cdr cleaner))
					 (old-mode-str (cdr (assq mode minor-mode-alist))))
				(when old-mode-str
				  (setcar old-mode-str mode-str))
				;; major mode
				(when (eq mode major-mode)
				  (setq mode-name mode-str)))))


;; (add-hook 'after-change-major-mode-hook 'clean-mode-line)
(leaf dockerfile-mode)

(leaf minions
  :global-minor-mode minions-mode)

(leaf doom-modeline
  :disabled t
  :config (setq doom-modeline-height  (window-font-height))
  (setq doom-modeline-project-detection  'project)
  (setq doom-modeline-buffer-encoding  nil)
  (setq doom-modeline-unicode-fallback t)
  (setq doom-modeline-major-mode-color-icon  t)
  (setq doom-modeline-buffer-state-icon  t)
  (setq doom-modeline-buffer-modification-icon  t)
  (setq doom-modeline-minor-modes  nil)
  (setq doom-modeline-hud nil)
  (setq doom-modeline-bar-width 0)
  :global-minor-mode doom-modeline-mode
  )

(leaf spaceline-all-the-icons
  :disabled t
  :config
  ;; 'slant, 'arrow, 'cup, 'wave, 'none
  (setq spaceline-all-the-icons-separator-type 'none)
  (setq spaceline-all-the-icons-icon-set-modified 'toggle)
  (setq spaceline-all-the-icons-icon-set-vc-icon-git 'git-name)
  (setq spaceline-all-the-icons-clock-always-visible nil)
  (setq spaceline-all-the-icons-highlight-file-name t)


  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
  (spaceline-toggle-all-the-icons-projectile-off)
  (spaceline-toggle-all-the-icons-buffer-id-off)
  (spaceline-all-the-icons-theme)
  (custom-set-faces
   '(spaceline-evil-insert ((t (:background "red" :foreground "#ffffff" :inherit 'mode-line))))
   '(spaceline-evil-normal ((t (:background "green" :foreground "#3E3D31" :inherit 'mode-line))))
   '(spaceline-evil-visual ((t (:background "purple" :foreground "#ffffff" :inherit 'mode-line))))
   )
  )



(leaf paren
  :global-minor-mode show-paren-mode)



(leaf writeroom-mode
  :bind (:writeroom-mode-map ("C-M-<" .  writeroom-decrease-width)
							 ("C-M->" .  writeroom-increase-width)
							 ("C-M-=" .  writeroom-adjust-width)
							 )
  :custom (writeroom-width . 148))

(leaf atom-one-dark-theme)
(leaf cyberpunk-theme)
(leaf github-theme)
(leaf almost-mono-themes)



(leaf doom-themes)
(leaf all-the-icons)
(leaf all-the-icons-dired
  :hook (dired-mode-hook . all-the-icons-dired-mode)
  )
(leaf treemacs-all-the-icons)
(leaf all-the-icons-completion
  :global-minor-mode all-the-icons-completion-mode
  )

(leaf moe-theme)

(leaf material-theme)

(leaf sublime-themes)

(leaf  hybrid-reverse-theme)

(leaf idea-darkula-theme)
;;; load custom theme

(setq custom-theme-allow-multiple-selections nil)
(setq menu-bar nil)

(leaf ayu-theme)

(leaf plan9-theme)
(leaf professional-theme)

(leaf dracula-theme)

(leaf acme-theme)
(leaf inverse-acme-theme)
(leaf nofrils-acme-theme)

(leaf sexy-monochrome-theme)
(leaf which-key
  :config
  ;; Allow C-h to trigger which-key before it is done automatically
  (setq which-key-show-early-on-C-h t)
  (setq which-key-enable-extended-define-key t)
  (setq which-key-popup-type 'minibuffer)
  (setq which-key-frame-max-width 271)
  (setq which-key-frame-max-height 100)
  (setq which-key-idle-delay 0.3)
  (setq which-key-idle-secondary-delay 0)
  (setq which-key-max-description-length nil)
  (setq which-key-side-window-max-height 100)
  (setq which-key-sort-order 'which-key-prefix-then-key-order)
  :global-minor-mode which-key-mode)


(leaf which-key-posframe
  ;; :disabled t
  :init
  ;; (setq which-key-posframe-font "Jetbrains Mono NL 9")
  ;; (setq which-key-posframe-font "Liberation Mono 10")
  :disabled nil
  :config
  (setq which-key-posframe-poshandler 'posframe-poshandler-frame-bottom-center)
  (setq which-key-posframe-border-width 1)
  :global-minor-mode which-key-posframe-mode
  )




(leaf olivetti
  :config)

(leaf highlight-defined
  :config
  :hook (emacs-lisp-mode-hook . highlight-defined-mode))

(setq dired-listing-switches "-alFh")

(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose t)


(leaf dired-hacks-utils
  :global-minor-mode dired-utils-format-information-line-mode)
(leaf dired-filter)
(leaf dired-open)

(leaf diredfl
  :global-minor-mode diredfl-global-mode)

(leaf dired-subtree)
(leaf dired-ranger)
(leaf dired-narrow)
(leaf dired-collapse
  :global-minor-mode dired-collapse-mode)

(leaf dirvish)

(leaf info-colors
  :hook (Info-selection-hook . info-colors-fontify-node)
  )

(leaf expand-region
  :bind ("C-=" . er/expand-region))

(setq inferior-lisp-program "/usr/bin/sbcl")
(leaf sly
  :config
  )
(defun exec/screenshot-svg ()
  "Save a screenshot of the current frame as an SVG image.
  Saves to a temp file and puts the filename in the kill ring."
  (interactive)
  (let* ((filename (make-temp-file "Emacs" nil ".svg"))
		 (data (x-export-frames nil 'svg)))
	(with-temp-file filename (insert data))
	(kill-new filename)
	(message filename))
  )

(leaf origami
  :global-minor-mode global-origami-mode)

(leaf danneskjold-theme)
(leaf flatui-theme)
(leaf twilight-bright-theme )
(leaf simplicity-theme)

(leaf bm
  :config
  )
(leaf sqlup-mode)


(leaf spacemacs-theme)
(leaf gruvbox-theme)
(leaf color-theme-sanityinc-tomorrow)
(leaf vscode-dark-plus-theme)
(leaf solarized-theme)

(defun exec/prog-mode-fixed()
  "Set a fixed width (monospace) font in current buffer."
  (interactive)
  (setq buffer-face-mode-face '(:family "Liberation Mono" ))
  (buffer-face-mode))

(defun exec/open-in-tmux()
  (interactive)
  (shell-command (concat "tmux new-window -c \"" default-directory "\""))
  )

;; (defun exec/prog-mode-format()
;;   "Set a fixed width (monospace) font in current buffer."
;;   (interactive)
;;   (add-hook 'before-save-hook '(lambda()
;; 								 (format-all-buffer)
;; 								 )))

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'electric-indent-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'exec/prog-mode-fixed)
;; (add-hook 'prog-mode-hook 'exec/prog-mode-format)
(add-hook 'emacs-lisp-mode-hook 'exec/prog-mode-fixed)
(add-hook 'emacs-lisp-mode-hook (lambda ()
								  (add-hook 'local-write-file-hooks
											'check-parens)))

;; (add-hook 'before-save-hook 'delete-trailing-whitespace)

(leaf line-reminder
  :config
  (setq line-reminder-show-option 'indicators)  ; Or set to 'indicators

  ;; :global-minor-mode global-line-reminder-mode
  )

2
(leaf deadgrep)
(leaf evil-numbers
  :bind (
		 ("C-c n +" . evil-numbers/inc-at-pt)
		 ("C-c n -" . evil-numbers/dec-at-pt)
		 )
  )
(leaf multiple-cursors

  )
(leaf xml+
  )

(leaf cnfonts

  :config
  :global-minor-mode cnfonts-mode
  )

(defun disable-all-themes ()
  "Disable all active themes."
  (dolist (i custom-enabled-themes)
	(disable-theme i))
  )

(defadvice load-theme (before disable-themes-first activate)
  (disable-all-themes))
(leaf subatomic256-theme)
(leaf srcery-theme
  )


(setq custom-safe-themes t)
(load-theme
 ;; 'dracula
 ;; 'almost-mono-black
 ;; 'srcery
 'atom-one-dark
 ;; 'subatomic256
 ;; 'doom-solarized-dark
 ;; 'solarized-dark
 ;; 'atom-dark
 ;; 'moe-light
 ;; 'dichromacy
 ;; 'gruvbox-dark-hard
 ;; 'doom-vibrant
 ;; 'doom-city-lights
 ;; 'vscode-dark-plus
 ;; 'ayu-dark
 )


(leaf telephone-line
  :init
  (defface telephone-line-evil-insert
	'((t (:background "red3" :inherit telephone-line-evil)))
	"Face used in evil color-coded segments when in Insert state."
	:group 'telephone-line-evil)

  (defface telephone-line-evil-visual
	'((t (:background "blue" :inherit telephone-line-evil)))
	"Face used in evil color-coded segments when in Visual{,-Block,-Line} state."
	:group 'telephone-line-evil)

  (defface telephone-line-evil-normal
	'((t (
		  :background "green"
		  :foreground "black"
		  :inherit telephone-line-evil
		  )))
	"Face used in evil color-coded segments when in Normal state."
	:group 'telephone-line-evil)
  :global-minor-mode telephone-line-mode)

(defvar after-load-theme-hook
  '(lambda()
	 (set-face-attribute 'hl-line nil :background "#000000")
	 )

  "Hook run after a color theme is loaded using `load-theme'.")
(defadvice load-theme (after run-after-load-theme-hook activate)
  "Run `after-load-theme-hook'."
  (run-hooks 'after-load-theme-hook))

(leaf hl-line
  :config
  (set-face-attribute 'hl-line nil :background "#000000")
  :global-minor-mode global-hl-line-mode
  )

(leaf wakatime-mode
  :config
  (global-wakatime-mode)
  )

(leaf fcitx
  :after evil
  :config
  (setq fcitx-remote-command "fcitx-remote")
  (fcitx-default-setup)
  )

;; (global-set-key (kbd "s-=") (lambda()
;; 			      (interactive)
;; 			      (shell-command "/usr/bin/fcitx-remote -t")
;; 			      ))
(server-start)
;;; init.el ends here
