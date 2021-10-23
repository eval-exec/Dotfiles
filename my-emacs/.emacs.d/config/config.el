
(setq my-font "Sarasa Mono SC Nerd")
(setq split-height-threshold nil)
(setq split-width-threshold 160)

(setq posframe-mouse-banish nil)
(leaf avy 
  :bind (("C-S-j"  . avy-goto-char-2-below) 
		 ("C-S-k"  . avy-goto-char-2-above)))
(leaf elfeed (leaf elfeed-dashboard))

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






;; (define-minor-mode evil-visualstar-mode
;;   "Minor mode for visual star selection."
;;   :keymap (let ((map (make-sparse-keymap)))
;; 	    (evil-define-key 'visual map (kbd "<f8>") #'exec/sync-org-entry-to-tg)
;; 	    map)
;;   (evil-normalize-keymaps))
;;
;; (evil-visualstar-mode t)
(leaf flycheck 
  :config (leaf flycheck-color-mode-line 
			:global-minor-mode  flycheck-color-mode-line-mode) 
  (leaf flycheck-pos-tip 
	:global-minor-mode flycheck-pos-tip-mode) 
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
	:hook (text-mode . (lambda () 
						 (require 'flycheck-languagetool))) 
	:init (setq flycheck-languagetool-server-jar "~/cache/languagetool.jar") 
	(setq flycheck-languagetool-language "zh-CN") 
	:config)
  (setq flycheck-display-errors-delay 0.9) 
  (leaf attrap 
	:bind ("C-x /" . attrap-attrap)) 
  :global-minor-mode global-flycheck-mode)

;; 中文测试
;; english
;;(member "Sarasa Mono SC Nerd" (font-family-list))
;;; Code:

;; (add-to-list 'default-frame-alist
;;              '(font . "Sarasa Gothic SC-10")
;; 	     )
;; (add-to-list 'default-frame-alist
;;              '(font . "Sarasa Mono SC Nerd-10")
;; 	     )
;; (set-frame-font "Sarasa Mono SC Nerd")
;; (set-fontset-font "fontset-default" 'unicode "Monaco")
;; (set-fontset-font "fontset-default" 'han "Monaco")
;; (set-fontset-font "fontset-default" 'symbol "Monaco")
;; (set-fontset-font "fontset-default" 'ascii "Monaco")
;; (set-fontset-font "fontset-default" 'latin "Monaco")
;;  (set-fontset-font "fontset-default" 'cjk-misc "Monaco")

;; (add-to-list 'face-font-rescale-alist '("Monaco" . 0.6))

(leaf valign 
  :hook (org-mode-hook . valign-mode))




(defun exec/put-file-name-on-clipboard () 
  "Put the current file name on the clipboard" 
  (interactive) 
  (let ((filename (if (equal major-mode 'dired-mode) default-directory (buffer-file-name)))) 
	(when filename (with-temp-buffer (insert filename)
									 (clipboard-kill-region (point-min)
															(point-max)))
		  (message filename))) )

(leaf general :custom :config (general-define-key :state
												  'normal "C-S-c" 'exec/put-file-name-on-clipboard))


;; (leaf elisp-autofmt
;;   :commands (elisp-autofmt-save-hook-for-this-buffer)
;;   :quelpa (elisp-autofmt
;; 		   :fetcher gitlab
;; 		   :repo "ideasman42/emacs-elisp-autofmt"
;; 		   )
;;   :hook
;;   (emacs-lisp-mode-hook . (lambda () (elisp-autofmt-save-hook-for-this-buffer t)))
;;   )






(leaf helm 
  :bind (("M-x" . helm-M-x)
		 ("C-j" . helm-next-line) 
		 ("C-k" . helm-prev-line) 
		 ("C-x C-f" . helm-find-files) 
		 ("C-x b" . 	helm-mini ) 
		 ("C-c h m" . helm-mini) 
		 ("C-c h o" . helm-imenu) 
		 ("C-c h a" . helm-apropos) 
		 ("M-y" . helm-show-kill-ring 	 ) 
		 ("C-s" . helm-ff-run-grep 	 ) 
		 ("C-c h i" . helm-semantic-or-imenu 	 ) 
		 ("C-c h m" . helm-man-woman 	 ) 
		 ("C-c h /" . helm-find 	 ) 
		 ("C-c h l" . helm-locate 	 ) 
		 ("C-c h o" . helm-occur 	 ) 
		 ("C-c h a" . helm-apropos 	 ) 
		 ("C-c h h g" . helm-info-gnus 	  ) 
		 ("C-c h h i" . helm-info-at-point 	  ) 
		 ("C-c h h r" . helm-info-emacs 	  ) 
		 ("C-c h <tab>" . helm-lisp-completion-at-point 	 ) 
		 ("C-c h b" . helm-resume 	 ) 
		 ("C-h SPC" . helm-all-mark-rings 	 ) 
		 ("C-c h r" . helm-recentf) 
		 ("C-c h x" . helm-register) 
		 ("C-c h t" . helm-top) 
		 ("C-c h s" . helm-surfraw) 
		 ("C-c h g" . helm-google-suggest) 
		 ("C-c h c" . helm-color) 
		 ("C-c h M-:" . helm-eval-expression-with-eldoc) 
		 ("C-c h C-," . helm-calcul-expression) 
		 ("C-x r l" . helm-filtered-bookmarks)) 
  :hook (after-init-hook . helm-mode) 
  :config (setq helm-completion-in-region-fuzzy-match t) 
  (setq helm-completion-style 'helm-fuzzy) 
  (setq helm-etags-fuzzy-match t) 
  (setq helm-etags-match-part-only 'all) 
  (setq helm-ff-skip-boring-files t) 
  (setq helm-mode-fuzzy-match t) 
  (setq helm-M-x-always-save-history t) 
  (setq helm-M-x-fuzzy-match t) 
  (setq helm-split-window-default-side 'below) 
  (setq helm-split-window-inside-p t) 
  (setq helm-always-two-windows t)
  :config (helm-autoresize-mode t) 
  (helm-popup-tip-mode t) 
  (leaf helm-icons 
	:custom (helm-icons-provider . 'treemacs) 
	:config (helm-icons-enable)) 
  (leaf helm-swoop 
	:bind ("M-i" . helm-swoop) 
	("M-I" . helm-swoop-back-to-last-point) 
	("C-c M-i" . helm-multi-swoop) 
	("C-x M-i" . helm-multi-swoop-all) 
	:config (setq helm-swoop-split-direction 'split-window-horizontally) 
	(setq helm-swoop-split-with-multiple-windows t)) 
  (leaf helm-descbinds 
	:hook (after-init-hook . helm-discbinds-mode)) 
  (leaf helm-projectile 
	:bind (( "C-c p h"  	. helm-projectile 	) 
		   ( "C-c p p"  	. helm-projectile-switch-project ) 
		   ( "C-c p f"  	. helm-projectile-find-file 	) 
		   ( "C-c p F"  	. helm-projectile-find-file-in-known-projects 	) 
		   ( "C-c p g"  	. helm-projectile-find-file-dwim ) 
		   ( "C-c p d"  	. helm-projectile-find-dir ) 
		   ( "C-c p e"  	. helm-projectile-recentf ) 
		   ( "C-c p a"  	. helm-projectile-find-other-file) 
		   ( "C-c p i"  	. hrojectile-invalidate-cache 	) 
		   ( "C-c p z"  	. hrojectile-cache-current-file 	) 
		   ( "C-c p b"  	. helm-projectile-switch-to-buffer) 
		   ( "C-c p s g" 	. helm-projectile-grep 	 ) 
		   ( "C-c p s a "	. helm-projectile-ack 	 ) 
		   ( "C-c p s s" 	. helm-projectile-ag 	 )) 
	:config (helm-projectile-on)) 
  (leaf helm-wikipedia) 
  (leaf helm-posframe 
	:disabled nil 
	:custom 
	:config (setq helm-posframe-font my-font) 
	(setq helm-posframe-poshandler 'posframe-poshandler-frame-bottom-center) 
	(setq helm-posframe-border-width 1) 
	(setq helm-posframe-min-width 274)
										;(helm-posframe-enable)
	) 
  (leaf helm-ag 
	:custom (helm-follow-mode-persistent . t) 
	(helm-ag-base-command . "rg") 
	(helm-ag-success-exit-status . '(0 2))))
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
										;(leetcode-directory . "/home/vory/github.com/eval-exec/Algorithm/LeetCode/eleet")
  )
;; (set inferior-lisp-program "sbcl")
;; (leaf common-lisp-snippets)

(leaf slime 
  :config (setq inferior-lisp-program "sbcl"))
(leaf lsp-mode 
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l") 
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
		 (c++-mode-hook . lsp) 
		 (sh-mode-hook . lsp) 
		 (c-mode-hook . lsp) 
		 (go-mode-hook . lsp) 
		 (python-mode-hook . lsp) 
		 (lsp-mode-hook . lsp-len-mode) 
		 (lsp-mode-hook . lsp-enable-which-key-integration)) 
  :custom (lsp-headerline-breadcrumb-enable . nil) 
  (lsp-headerline-breadcrumb-icons-enable . nil) 
  (lsp-idle-delay . 0.5) 
  (lsp-enable-snippet . t) 
  :commands lsp 
  :config (setq gc-cons-threshold 100000000) 
  (setq read-process-output-max (* 2024 2024)) ;; 1mb
  (leaf go-mode 
	:hook ((before-save-hook . #'lsp-format-buffer) 
		   (before-save-hook . #'lsp-organize-imports)) 
	:config
	(leaf go-expr-completion :bind("C-c C-c" . go-expr-completion)) 
	(leaf go-gen-test) 
	(leaf go-impl) 
	(leaf go-fill-struct) 
	(leaf go-rename) 
	(leaf go-tag) 
	(leaf go-imports 
	  :config (setq gofmt-command "goimports")) 
	(add-hook 'before-save-hook 'gofmt-before-save))


  (leaf lsp-ui 
	:commands lsp-ui-mode 
	:hook (lsp-mode . lsp-ui-mode)) 
  (leaf lsp-treemacs 
	:commands lsp-treemacs-errors-list)
  ;; (leaf dap-mode)
  (leaf helm-lsp 
	:config (define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol)))


(leaf company 
  :custom (company-clang-insert-arguments . t) 
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
  (company-backends . '(company-tabnine company-capf company-keywords company-files
										company-dabbrev-code company-dabbrev)) 
  :global-minor-mode  global-company-mode 
  :bind ((:company-active-map ("C-p" . company-select-previous) 
							  ("C-n" . company-select-next) 
							  ("<tab>" . company-complete-common-or-cycle)
							  ) 
		 (:company-search-map ("C-p" . company-select-previous) 
							  ("C-n" . company-select-next)
							  )) 
  :config (leaf company-box 
			:hook (company-mode . company-box-mode)) 
  (leaf go-mode (leaf company-go)) 
  (leaf company-prescient 
	:init (company-prescient-mode)) 
  (leaf company-tabnine 
	:config (add-to-list 'company-backends #'company-tabnine)))
(leaf magit 
  :config (leaf forge))

(leaf rainbow-delimiters 
  :hook ((prog-mode-hook emacs-lisp-mode-hook) .  rainbow-delimiters-mode))

(leaf calendar 
  :config (setq calendar-latitude 39.903829718
				calendar-longitude 116.374498502)
  (setq view-diary-entries-initially t
		mark-diary-entries-in-calendar t
		number-of-diary-entries 7) 
  (setq diary-file "~/org/diary/diary"))

(leaf undo-tree 
  :config (global-undo-tree-mode))

;; (leaf projectile
;;   :init (projectile-mode +1)

;;   :config
;;   (setq projectile-enable-caching t
;; 		projectile-completion-system 'helm   )
;;   (leaf helm-projectile
;; 	:config
;; 	(helm-projectile-on)
;; 	)
;;   )
(leaf hl-line 
  :config (global-hl-line-mode))

(leaf helpful 
  :bind
  ;; Note that the built-in `describe-function' includes both functions
  ;; and macros. `helpful-function' is functions only, so we provide
  ;; `helpful-callable' as a drop-in replacement.
  (("C-h f" . helpful-callable) 
   ("C-h v" . helpful-variable)


   ;; Lookup the current symbol at point. C-c C-d is a common keybinding
   ;; for this in lisp modes.

   ;; Look up *F*unctions (excludes macros).
   ;;
   ;; By default, C-h F is bound to `Info-goto-emacs-command-node'. Helpful
   ;; already links to the manual, if a function is referenced there.
   ("C-h k" . helpful-key) 
   ("C-c C-d" . helpful-at-point) 
   ("C-h F" . helpful-function)

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




(leaf emojify 
  :hook (after-init  global-emojify-mode))

(leaf hungry-delete 
  :config (global-hungry-delete-mode))






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
  :global-minor-mode global-pangu-spacing-mode)

(setq confirm-kill-emacs 'yes-or-no-p)
(tool-bar-mode -1)

(leaf google-translate
  :custom :bind(("C-c t t" . google-translate-at-point) 
				("C-c t s" . google-translate-smooth-translate)) 
  :config (defun google-translate--search-tkk@fix () 
			"Search TKK."
			(list 430675 2721866130)
			) 
  (advice-add 'google-translate--search-tkk 
			  :override 'google-translate--search-tkk@fix) 
  (setq google-translate-default-source-language  "en") 
  (setq google-translate-default-target-language  "zh-CN") 
  (setq google-translate--tkk-url  "https://translate.google.cn/") 
  (setq google-translate-base-url  "https://translate.google.cn/translate_a/single") 
  (setq google-translate-listen-url  "https://translate.google.cn/translate_tts") 
  (setq google-translate-backend-method   'curl) 
  (setq google-translate-output-destination  'echo-area)
  (setq google-translate-translation-directions-alist     '(("en" . "zh-CN") 
															("zh-CN" . "en") )))
(leaf recentf 
  :tag "builtin" 
  :custom ((recentf-auto-cleanup . 'never) 
		   (recentf-exclude . nil) 
		   (recentf-max-menu-items . 1000) 
		   (recentf-max-saved-items . 1000)))

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
  :disabled nil 
  :config (setq telega-proxies (list 
								'(:server "127.0.0.1" 
										  :port 1080 
										  :enable t 
										  :type (:@type "proxyTypeSocks5" )))) 
  (setq telega-animation-play-inline nil) 
  (setq telega-chat-show-avatars t) 
  (setq telega-use-images nil))

(leaf mermaid-mode)

(leaf gnuplot)

(leaf vimrc-mode)
(setq debug-on-error nil)


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
  :bind (("C-c o l" . org-store-link) 
		 ("C-c o a" . org-agenda) 
		 ("C-c o c" . org-capture)) 
  :hook ((before-save-hook .   skx-org-mode-before-save-hook) 
		 (org-trigger-hook . save-buffer)) 
  :custom
;;;;;;; org-agenda-begin
  (org-log-done .  'time) 
  (org-agenda-files . '("~/org" "~/org/work" "~/org/personal" "~/org/journal" "~/org/notes"))
										;(org-agenda-include-diary . t)
  (org-agenda-time-grid . '((daily today require-timed) 
							(000 100 200 300 400 500 600 700 800 900 1000 1100 1200 1300 1400 1500 1600 1700 1800 1900 2000 2100 2200 2300 2400)
							"......"
							"----------------")) 
  (org-agenda-use-tag-inheritance . t)
;;;;;;; org-agenda-end
  (org-startup-with-inline-images . t) 
  ( org-tag-beautify-mode .  t) 
  ( org-confirm-babel-evaluate . nil) 
  ( org-return-follows-link  . t) 
  ( org-enforce-todo-dependencies . t) 
  ( org-enforce-todo-checkbox-dependencies . t)
  (org-ellipsis  . "⤵") 
  (org-default-notes-file . "~/org/notes/") 
  (org-capture-templates . '(
							 ("w" "work" entry (file+headline "~/org/work/work.org" "WORK" )
							  "** TODO [#B] %i %T %?") 
							 ("p" "personal stuff" entry (file+headline
														  "~/org/personal/personal.org" "Personl")
							  "* TODO %i %T %?") 
							 ("e" "EXEC" plain (file+headline "~/org/personal/exec.org" "EXEC")
							  "** %i %T %?") 
							 ("c" "Code Stuff") 
							 ("cl" "LeetCode" plain (file+headline "~/org/personal/leetocde.org"
																   "Daily Challenge") "** %T %i %?
#+BEGIN_SRC c

#+END_SRC
"))) 
  :config
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
	:hook (org-mode-hook . org-appear-mode))
  (leaf ob-go) 
  (leaf ob-rust))








(leaf org-journal 
  :bind (("C-c o j" . org-journal-new-entry)
		 ) 
  :custom (org-journal-dir . "~/org/journal/") 
  (org-journal-date-format .  "%F, %A") 
  (org-journal-time-format . "%T") 
  (org-journal-file-format . "%Y.org")  ; their file names
  (org-journal-file-type . 'Yearly) 
  (org-journal-enable-agenda-integration . t) 
  (org-journal-enable-cache . t))


(leaf hl-todo 
  :config (hl-todo-mode))


(leaf org-download 
  :after org)





(leaf deft 
  :after org 
  :custom (deft-extensions . '("txt" "org" "md")) 
  (deft-directory . "~/org/") 
  (deft-recursive . t) 
  (deft-use-filename-as-title . t) 
  :bind (("C-c d d" . deft) 
		 ("C-c d f" . deft-find-file)))


(leaf org-roam 
  :bind (("C-c n l" . org-roam-buffer-toggle) 
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
		 ("C-c n o R" . org-roam-ref-remove)) 
  :config (setq org-roam-mode-section-functions (list #'org-roam-backlinks-section
													  #'org-roam-reflinks-section
													  ;; #'org-roam-unlinked-references-section
													  )) 
  (setq org-roam-capture-templates '(("d" "default" plain "%?" 
									  :if-new (file+head "${slug}-%<%Y%m%d%H%M%S>.org"
														 "#+TITLE: ${title}
#+FILETAGS:
#+CREATED_AT: %u
#+LAST_MODIFIED: <>
") 
									  :unnarrowed t)))
  (add-to-list 'display-buffer-alist '("\\*org-roam\\*" (display-buffer-in-side-window) 
									   (side . right) 
									   (slot . 0) 
									   (window-width . 0.34) 
									   (window-parameters . ((no-other-window . t) 
															 (no-delete-other-windows . t)))))

  (setq org-roam-completion-everywhere t)
  (setq org-roam-directory (file-truename "~/org-roam")) 
  (org-roam-setup))

(leaf org-download 
  :hook (org-mode-hook . org-download-enable) 
  :config (setq-default org-download-image-dir "~/Pictures/org/"))
(leaf ox-hugo 
  :after ox
  ;;(setq org-hugo-footer "\nBlog with Emacs & Org-mode (•̀ᴗ•́)و\n")
  )
(leaf projectile 
  :custom (projectile-completion-system  . 'helm) 
  (projectile-current-project-on-switch . 'keep) 
  (projectile-enable-caching . t) 
  (projectile-indexing-method . 'hybrid) 
  :config (projectile-mode 1))

(leaf rust-mode 
  :config (add-hook 'rust-mode-hook (lambda () 
									  (setq indent-tabs-mode nil))) 
  (setq rust-format-on-save t))
(leaf yasnippet 
  :bind (("H-i" . yas-insert-snippet) 
		 ("H-e" . yas-expand)) 
  :config (leaf yasnippet-snippets 
			:global-minor-mode  yas-global-mode))

(leaf treemacs 
  :init (with-eval-after-load 'winum (define-key winum-keymap (kbd "M-0") #'treemacs-select-window)) 
  :config (progn 
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
			   (treemacs-git-mode 'simple)))) 
  :bind(("M-0"       . treemacs-select-window) 
		("C-x t 1"   . treemacs-delete-other-windows) 
		("C-x t t"   . treemacs) 
		("C-x t B"   . treemacs-bookmark) 
		("C-x t C-t" . treemacs-find-file) 
		("C-x t M-t" . treemacs-find-tag)))







(leaf treemacs-evil 
  :after (treemacs evil))






(leaf treemacs-projectile 
  :after (treemacs projectile) 
  :ensure t)






(leaf treemacs-icons-dired 
  :after (treemacs dired) 
  :ensure t
  :config (treemacs-icons-dired-mode))





(leaf treemacs-magit 
  :after (treemacs magit) 
  :ensure t)

;; use-package treemacs-persp ;;treemacs-perspective if you use perspective.el vs. persp-mode
;;  :after (treemacs persp-mode) ;;or perspective vs. persp-mode
;;  :ensure t
;;  :config (treemacs-set-scope-type 'Perspectives))
(leaf tree-sitter 
  :hook (prog-mode-hook . tree-sitter-hl-mode) 
  :config (leaf tree-sitter-langs 
			:config))
(leaf modern-cpp-font-lock 
  :config (modern-c++-font-lock-global-mode t))

;; (leaf dashboard

;;   :config
;; 					;(setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
;;   ;; (setq dashboard-startup-banner "~/Pictures/avator/heckert_gnu.png")
;;   ;; (setq dashboard-startup-banner "~/Pictures/dark-skull.png")
;;   ;; (setq dashboard-startup-banner "~/Pictures/ghost1.png")
;;   ;; (setq dashboard-startup-banner "~/Pictures/skull-logo-transparent-4.png")
;;   ;; (setq dashboard-startup-banner "~/Pictures/Pik.png")
;;   ;; (setq dashboard-startup-banner "~/Pictures/acdb3835b1cc16d68834d73a8c500ea0.png")
;;   ;;   (setq dashboard-startup-banner "~/Pictures/avator/camo-phone.png")
;;   (setq dashboard-startup-banner "~/Pictures/avator/horror-skull.png")
;;   ;;(setq dashboard-footer   "While any text editor can save your files, only Emacs can save your soul")

;;   ;;   (setq dashboard-startup-banner
;;   ;; ;"~/.emacs.d/banners/logo.txt"
;;   ;; "~/.emacs.d/banners/alien.txt"
;;   ;; )
;;   (setq dashboard-center-content t)
;;   (setq dashboard-set-heading-icons t)
;;   (setq dashboard-set-file-icons t)
;;   (setq dashboard-set-navigator t)

;;   (setq dashboard-items '(
;; 					; (recents  . 0)
;; 			  ;;			  (bookmarks . 50)
;; 			  ;;(projects . 50)
;; 					;(agenda . 5)
;; 					; (registers . 50)
;; 			  ))
;;   (setq dashboard-set-init-info t)
;;   (dashboard-setup-startup-hook))

(leaf doom-modeline 
  :config (setq doom-modeline-height  (window-font-height)) 
  (setq doom-modeline-project-detection  'project) 
  (setq doom-modeline-buffer-encoding  nil) 
  (setq doom-modeline-major-mode-color-icon  t) 
  (setq doom-modeline-buffer-state-icon  t) 
  (setq doom-modeline-buffer-modification-icon  t) 
  (setq doom-modeline-minor-modes  nil) 
  :global-minor-mode doom-modeline-mode)
(leaf beacon 
  :custom (beacon-blink-when-focused .  t) 
  (beacon-blink-when-buffer-changes . t) 
  (beacon-blink-when-window-scrolls . nil) 
  (beacon-blink-when-window-changes . t) 
  (beacon-blink-when-point-moves-vertically . nil) 
  :config (setq beacon-color  "#333333")
  ;; :global-minor-mode beacon-mode
  )

(leaf paren 
  :global-minor-mode show-paren-mode)




(leaf writeroom-mode 
  :bind (:writeroom-mode-map ("C-M-<" .  writeroom-decrease-width) 
							 ("C-M->" .  writeroom-increase-width) 
							 ("C-M-=" .  writeroom-adjust-width)
							 ) 
  :custom (writeroom-width . 148))


;; (leaf centaur-tabs
;;   :after evil
;;   :hook
;;   (org-agenda-mode . centaur-tabs-local-mode)
;;   (helpful-mode . centaur-tabs-local-mode)
;;   :bind(
;; 		(:evil-normal-state-map
;; 		 (
;; 		  ("g T" . centaur-tabs-backward)
;; 		  ("g t" . centaur-tabs-forward)
;; 		  )
;; 		 )
;; 		)
;;   :custom
;;   (centaur-tabs-style . "bar")
;;   (centaur-tabs-height . 32)
;;   (centaur-tabs-set-icons . t)
;;   (centaur-tabs-set-bar . 'over)
;;   (centaur-tabs-set-modified-marker . t)
;;   (centaur-tabs-show-navigation-buttons . t)
;;   (centaur-tabs-set-bar . 'under)
;;   :config
;;   (centaur-tabs-headline-match)
;;   :global-minor-mode centaur-tabs-mode
;; )

(leaf atom-one-dark-theme)
(leaf github-theme)
(leaf almost-mono-themes)



(leaf doom-themes)
(leaf all-the-icons)
(leaf all-the-icons-dired)
(leaf treemacs-all-the-icons)

(leaf moe-theme)
(leaf nyan-mode
  ;;   :config
  ;;   :custom (
  ;; 	   (nyan-animate-nyancat . t)
  ;; 	   (nyan-cat-face-number . 3)
  ;; 				)
  ;;   (setq mode-line-format
  ;; 	'(:eval (list (nyan-create)))
  ;; 	 ))
  )

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
  (setq which-key-popup-type 'side-window)

  ;; make sure which-key doesn't show normally but refreshes quickly after it is
  ;; triggered.
  (setq which-key-idle-delay 0.3) 
  (setq which-key-idle-secondary-delay 0) 
  (setq which-key-max-description-length nil) 
  (setq which-key-side-window-max-height 1)

										;(setq which-key-sort-order 'which-key-key-order)
  (setq which-key-sort-order 'which-key-prefix-then-key-order)
  ;; (setq which-key-sort-order 'which-key-local-then-key-order)

										; (add-to-list 'which-key-replacement-alist '(("TAB" . nil) . ("↹" . nil)))
										; (add-to-list 'which-key-replacement-alist '(("RET" . nil) . ("⏎" . nil)))
										; (add-to-list 'which-key-replacement-alist '(("DEL" . nil) . ("⇤" . nil)))
										; (add-to-list 'which-key-replacement-alist '(("SPC" . nil) . ("␣" . nil)))

										;  (setq which-key-special-keys '("SPC" "TAB" "RET" "ESC" "DEL"))

  ;;   (which-key-add-key-based-replacements
  ;;     "SPC b" "buffer"
  ;;     "SPC c" "close or hide"
  ;;     "SPC m" "bookmark"
  ;;     "SPC o" "open"
  ;;     "SPC s" "search"
  ;;     "SPC t" "toggle"
  ;;     "SPC w" "window"
  ;;     "SPC f" "frame"
  ;;     "SPC h" "help"
  ;;     )
  :global-minor-mode which-key-mode)


(leaf which-key-posframe 
  :disabled nil 
  :config (setq which-key-posframe-font my-font) 
  (defun exec/posframe-arghandler (buffer-or-name arg-name value) 
	(let ((info 
		   '(:internal-border-width 1 
									:width 274
									))) 
	  (or (plist-get info arg-name) 
		  value
		  ))
	) 
  (setq posframe-arghandler #'exec/posframe-arghandler) 
  (setq which-key-posframe-poshandler 'posframe-poshandler-frame-bottom-center) 
  (setq which-key-posframe-border-width 0) 
  :global-minor-mode which-key-posframe-mode)


(leaf evil 
  :init (setq evil-want-keybinding nil) 
  (setq evil-want-C-i-jump nil) 
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-C-u-scroll t) 
  :bind((:evil-insert-state-map (("M-h" . left-char) 
								 ("M-l" . right-char) 
								 ("M-j" . next-line) 
								 ("M-k" . previous-line))
								)) 
  :hook(after-init-hook . evil-mode) 
  :custom (evil-undo-system . 'undo-redo) 
  :config (evil-define-key 'normal org-mode-map (kbd "<tab>") #'org-cycle) 
  (evil-define-key 'normal org-mode-map (kbd "RET") #'org-return) 
  (leaf evil-collection 
	:after evil 
	:config (setq evil-collection-setup-minibuffer t) 
	(evil-collection-init)) 
  (setq evil-want-keybinding t) 
  (leaf fcitx 
	:after evil 
	:config (setq fcitx-remote-command "/usr/bin/fcitx5-remote") 
	(fcitx-aggressive-setup) 
	(setq fcitx-use-dbus nil)) 
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
  (evil-define-motion 
	exec/sync-org-entry-to-tg
	(beg end) 
	:jump t 
	:repeat nil 
	(interactive "<r>") 
	(setq content 
		  (buffer-substring-no-properties 
		   (region-beginning) 
		   (region-end)
		   )) 
	(setq url-proxy-services '(("http" . "127.0.0.1:1081") 
							   ("https" . "127.0.0.1:1081"))) 
	(url-retrieve-synchronously (url-encode-url (format
												 "https://api.telegram.org/bot%s/sendMessage?chat_id=@%s&text=%s" (read-file "/home/vory/.emacs.d/config/tgsync.token")
												 (read-file "/home/vory/.emacs.d/config/chatid.priv")
												 (url-hexify-string content))))
	(if (evil-visual-state-p)
		(evil-exit-visual-state))
	(message "sync to telegram channel success")


	(leaf fcitx
	  :init (setq fcitx-remote-command  "/usr/bin/fcitx5-remote")
	  :after evil
	  :config (fcitx-aggressive-setup))
	))

(leaf olivetti
  :config)

(leaf highlight-defined

  :config
  :hook (emacs-lisp-mode-hook . highlight-defined-mode))

(setq dired-listing-switches "-alFh")
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

(leaf expand-region
  :bind ("C-=" . er/expand-region))

(setq inferior-lisp-program "/usr/bin/sbcl")
(leaf sly
  :config (leaf helm-sly))
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

(leaf danneskjold-theme)
(leaf modus-themes)
(leaf flatui-theme)
(leaf twilight-bright-theme )

(leaf bm
  :config (leaf helm-bm))
(leaf sqlup-mode)

(set-frame-font my-font)


;; (setq face-font-rescale-alist '(("Sarasa Mono SC Nerd" . 1)))
;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;   (set-fontset-font (frame-parameter nil 'font)
;; 		    charset
;; 		    (font-spec :family "Sarasa Mono SC Nerd")))
(leaf spacemacs-theme)
(load-theme 'doom-vibrant)
										;(load-theme 'modus-vivendi)
