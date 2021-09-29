(leaf rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(leaf calendar
  :config
  (setq
   calendar-latitude 39.903829718
   calendar-longitude 116.374498502
   )


  (setq view-diary-entries-initially t
	mark-diary-entries-in-calendar t
	number-of-diary-entries 7)

  (setq diary-file "~/org/diary/diary")
  )

(leaf undo-tree
  :config
  (global-undo-tree-mode)
  )

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
  :config
  (global-hl-line-mode)
  )

(leaf fcitx
  :after evil
  
  :custom
  (fcitx-remote-command . "/usr/bin/fcitx5-remote")
  :config
  (fcitx-aggressive-setup)
  )

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
   ("C-h C" . helpful-command))
  )

(leaf super-save
  ;; :custom
  ;; (super-save-auto-save-when-idle . nil)
  ;; (super-save-idle-duration . 1)
  ;; :global-minor-mode super-save-mode
  )




(leaf emojify
  :hook (after-init  global-emojify-mode))

(leaf hungry-delete
  :config
  (global-hungry-delete-mode)
  )






(leaf nov
  :config
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
  )


(leaf winner
  :tag "builtin"
  :bind(
	("H-<left>" . winner-undo)
	("H-<right>" . winner-redo)
	)
  :global-minor-mode winner-mode
  )
(leaf pangu-spacing
  :disabled nil
  :custom
  (pangu-spacing-real-insert-separtor . t)
  :global-minor-mode global-pangu-spacing-mode
  )

(setq confirm-kill-emacs 'yes-or-no-p)
(tool-bar-mode -1)

(defun google-translate--search-tkk () "Search TKK." (list 430675 2721866130))
(leaf google-translate
  :config
  :custom
  (
   (google-translate-default-source-language . "en")
   (google-translate-default-target-language . "zh-CN")

   (google-translate--tkk-url . "https://translate.google.cn/")
   (google-translate-base-url . "https://translate.google.cn/translate_a/single")
   (google-translate-listen-url . "https://translate.google.cn/translate_tts")
   (google-translate-backend-method  . 'curl)
   (google-translate-output-destination . 'echo-area)


   (google-translate-translation-directions-alist .    '(("en" . "zh-CN") ("zh-CN" . "en") ))
   )
  :bind(
	("C-c t t" . google-translate-at-point)
	("C-c t s" . google-translate-smooth-translate)
	)
  )

(leaf saveplace
  :tag "builtin"
  :global-minor-mode save-place-mode)

(leaf atomic-chrome
  :disabled t
  :hook (after-init-hook . atomic-chrome-start-server)
  :config
  (setq atomic-chrome-enable-auto-update nil)
  )





(defun toggle-display-global-line-numbers() 
  (interactive)

  (if (bound-and-true-p global-display-line-numbers-mode)
      (setq on -1)
    (setq on +1)
    )
  (global-display-line-numbers-mode on)
  )

(defun toggle-display-line-numbers() 
  (setq display-line-numbers 'visual)
  (setq display-line-numbers-type 'visual)
  (setq on +1)
					;(interactive)
  (if (bound-and-true-p display-line-numbers-mode) (setq on -1))
  (display-line-numbers-mode on)
  )

(global-set-key (kbd "<f6>")
		(lambda ()
		  (interactive)
		  (toggle-display-line-numbers)
		  )
		)

(global-set-key (kbd "C-c <f6>")
		(lambda ()
		  (interactive)
		  (toggle-display-global-line-numbers)
		  )
		)

(leaf pdf-tools
  :config
					;(pdf-loader-install)
  )


(leaf use-proxy
  :custom
  (use-proxy-http-proxy . "127.0.0.1:1081")
  (use-proxy-https-proxy . "127.0.0.1:1081")
  (use-proxy-display-in-global-mode-string . nil)
  :config
  (use-proxy-mode)
  )

(leaf telega
  :disabled t
  :config
  (setq telega-animation-play-inline nil)
  (setq telega-chat-show-avatars t)
  (setq telega-proxies
	(list
	 '(:server "127.0.0.1" :port 1080 :enable t
		   :type (:@type "proxyTypeSocks5")))))


(leaf mermaid-mode)

(leaf gnuplot)

(leaf vimrc-mode)
(setq debug-on-error nil)


(leaf elisp-format
  :disabled t)
