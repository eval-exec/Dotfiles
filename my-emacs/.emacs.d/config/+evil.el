(leaf evil
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :bind(
	(:evil-insert-state-map
	 (
	  ("M-h" . left-char)
	  ("M-l" . right-char)
	  ("M-j" . next-line)
	  ("M-k" . previous-line)
	  )
	 )
	)
  :hook(after-init-hook . evil-mode)
  :custom
  (evil-want-C-u-scroll . t)
  (evil-want-C-i-jump . t)
  (evil-undo-system . 'undo-redo)
  
  :config
(with-eval-after-load 'evil-maps
  (define-key evil-motion-state-map (kbd "SPC") nil)
  (define-key evil-motion-state-map (kbd "RET") nil)
  (define-key evil-motion-state-map (kbd "TAB") nil))
  (leaf evil-leader
    :after evil
    :global-minor-mode global-evil-leader-mode
    :config
    (evil-leader/set-key
      "e" 'find-file
      "b" 'ibuffer
      "k" 'kill-this-buffer)
    (evil-leader/set-key
      "ci" 'evilnc-comment-or-uncomment-lines
      "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
      "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
      "cc" 'evilnc-copy-and-comment-lines
      "cp" 'evilnc-comment-or-uncomment-paragraphs
      "cr" 'comment-or-uncomment-region
      "cv" 'evilnc-toggle-invert-comment-line-by-line
      "."  'evilnc-copy-and-comment-operator
      "\\" 'evilnc-comment-operator ; if you prefer backslash key
      )



    )
  (leaf evil-collection
    :after evil
    :config
    (setq evil-collection-setup-minibuffer t)
    (evil-collection-init)
    )

  (setq evil-want-keybinding t)
  (leaf fcitx
    :after evil
    :config
    (setq fcitx-remote-command "/usr/bin/fcits5-remote")
    (fcitx-evil-turn-on)
    )
  (leaf evil-exchange
    :after evil
    :config
    (evil-exchange-install)
    )
  (leaf evil-mc
    :after evil
    :config
    :global-minor-mode global-evil-mc-mode
    )
  (leaf evil-commentary
    :after evil
    :config
    :global-minor-mode evil-commentary-mode
    )

  (leaf evil-surround
    :after evil
    :custom
    (evil-surround-pairs-alist .
			       '((40 "( " . " )")
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


    :global-minor-mode global-evil-surround-mode
    )
  (leaf evil-terminal-cursor-changer
    :config
    (evil-terminal-cursor-changer-activate) ; or (etcc-on)
    )

  (evil-define-motion exec/sync-org-entry-to-tg(beg end)
    :jump t
    :repeat nil
    (interactive "<r>")
    (setq content (buffer-substring-no-properties
		   (region-beginning)
		   (region-end)))
    (setq url-proxy-services '(("http" . "127.0.0.1:1081")
			       ("https" . "127.0.0.1:1081"))) 
    (url-retrieve-synchronously
     (url-encode-url (format 
		      "https://api.telegram.org/bot%s/sendMessage?chat_id=@%s&text=%s"
		      (read-file "/home/vory/.emacs.d/config/tgsync.token")
		      (read-file "/home/vory/.emacs.d/config/chatid.priv")
		      (url-hexify-string content))))
    (if (evil-visual-state-p)
	(evil-exit-visual-state))
    (message "sync to telegram channel success")
    )
  )

(leaf electric
  :tag "builtin"
  :hook (
	 (after-init-hook . electric-pair-mode)
	 (prog-mode . electric-indent-mode)
	 )
  )
(defun read-file (filename)
  (save-excursion
    (let ((new (get-buffer-create filename)) (current (current-buffer)))
      (switch-to-buffer new)
      (insert-file-contents filename)
      (mark-whole-buffer)
      (let ((contents (buffer-substring (mark) (point))))
	(kill-buffer new)
	(switch-to-buffer current)
	contents))))






;; (define-minor-mode evil-visualstar-mode
;;   "Minor mode for visual star selection."
;;   :keymap (let ((map (make-sparse-keymap)))
;; 	    (evil-define-key 'visual map (kbd "<f8>") #'exec/sync-org-entry-to-tg)
;; 	    map)
;;   (evil-normalize-keymaps))
;; 
;; (evil-visualstar-mode t)
