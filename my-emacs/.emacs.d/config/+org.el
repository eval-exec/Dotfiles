(leaf org

  :bind (
		 ("C-c l" . org-store-link)
		 ("C-c a" . org-agenda)
		 ("C-c c" . org-capture)
		 )
  :hook (org-agenda-mode-hook .  (lambda ()
								   (display-line-numbers-mode -1)))
  :hook (org-trigger-hook . save-buffer)
  
  :config

  (setq org-tag-beautify-mode t)
  (setq org-confirm-babel-evaluate nil)
  (setq org-return-follows-link  t)
  (setq org-log-done 'time)
  (setq org-enforce-todo-dependencies t)
  (setq org-enforce-todo-checkbox-dependencies t)

  (setq org-agenda-files '("~/org" "~/org/work" "~/org/personal" "~/org/journal" "~/org/notes"))
  
  (setq org-agenda-use-tag-inheritance t)

  (setq org-ellipsis "\"⤵\"")

  (setq org-default-notes-file "~/org/notes/")

  (setq org-capture-templates
		'(
		  ("w"
		   "work"
		   entry
		   (file+headline "~/org/work/work.org" "WORK" )
		   "** TODO [#B] %i %T %?"
		   )

		  ("p"
		   "personal stuff"
		   entry
		   (file+headline "~/org/personal/personal.org" "Personl")
		   "* TODO %i %T %?"
		   )

		  ("e"
		   "EXEC"
		   plain
		   (file+headline "~/org/personal/exec.org" "EXEC")
		   "** %i %T %?")
		  ("c"
		   "Code Stuff")
		  ("cl"
		   "LeetCode"
		   plain
		   (file+headline "~/org/personal/leetocde.org" "Daily Challenge")
		   "** %T %i %? 
#+BEGIN_SRC c

#+END_SRC
")
		  )
		)

  (leaf org-bullets
	:after (org)
	:init
	(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
	)

  (leaf org-cliplink
	:after (org)
	)

  (leaf org-appear
	:after (org)
	:init
	(org-appear-mode)
	)

  )






(leaf org-roam
  :leaf-defer t
  :bind
  (
   (:org-roam-mode-map
	("C-c n l" . org-roam)
	("C-c n f" . org-roam-find-file)

	("C-c n d"   . org-roam-dailies-find-date)
	("C-c n c"   . org-roam-dailies-capture-today)
	("C-c n C r" . org-roam-dailies-capture-tomorrow)
	("C-c n t"   . org-roam-dailies-find-today)
	("C-c n y"   . org-roam-dailies-find-yesterday)
	("C-c n r"   . org-roam-dailies-find-tomorrow)
	("C-c n g" . org-roam-graph)
	)

   (:org-mode-map
	("C-c n i" . org-roam-insert)
	("C-c n I" . org-roam-insert-immediate))
   )

  :custom
  (org-roam-directory . "~/org/roam/")
  (org-roam-db-location . "~/.cache/org-roam-db/roam.db")
  :config
  ;;  (setq org-roam-capture-templates
  ;; 		'(
  ;; 		  ("d" "default" plain (function org-roam--capture-get-point)
  ;; 		   "%?"
  ;; 		   :file-name "%(format-time-string \"%Y-%m-%d--%H-%M-%SZ--${slug}\" (current-time) t)"
  ;; 		   :head "#+title: ${title}\n"
  ;; 		   :unnarrowed t)
  ;; 		  ("ll" "link note" plain
  ;; 		   #'org-roam-capture--get-point
  ;; 		   "* %^{Link}"
  ;; 		   :file-name "Inbox"
  ;; 		   :olp ("Links")
  ;; 		   :unnarrowed t
  ;; 		   :immediate-finish)
  ;; 		  ("lt" "link task" entry
  ;; 		   #'org-roam-capture--get-point
  ;; 		   "* TODO %^{Link}"
  ;; 		   :file-name "Inbox"
  ;; 		   :olp ("Tasks")
  ;; 		   :unnarrowed t
  ;; 		   :immediate-finish)
  ;; 		  )
  ;; 		)



  ;;(org-roam-dailies-directory "Journal/")
  (setq   org-roam-dailies-capture-templates
		  '(("d" "default" entry
			 #'org-roam-capture--get-point
			 "* %?"
			 :file-name "Journal/%<%Y-%m-%d>"
			 :head "#+title: %<%Y-%m-%d %a>\n\n[[roam:%<%Y-%B>]]\n\n")
			("t" "Task" entry
			 #'org-roam-capture--get-point
			 "* TODO %?\n  %U\n  %a\n  %i"
			 :file-name "Journal/%<%Y-%m-%d>"
			 :olp ("Tasks")
			 :empty-lines 1
			 :head "#+title: %<%Y-%m-%d %a>\n\n[[roam:%<%Y-%B>]]\n\n")
			("j" "journal" entry
			 #'org-roam-capture--get-point
			 "* %<%I:%M %p> - Journal  :journal:\n\n%?\n\n"
			 :file-name "Journal/%<%Y-%m-%d>"
			 :olp ("Log")
			 :head "#+title: %<%Y-%m-%d %a>\n\n[[roam:%<%Y-%B>]]\n\n")
			("l" "log entry" entry
			 #'org-roam-capture--get-point
			 "* %<%I:%M %p> - %?"
			 :file-name "Journal/%<%Y-%m-%d>"
			 :olp ("Log")
			 :head "#+title: %<%Y-%m-%d %a>\n\n[[roam:%<%Y-%B>]]\n\n")
			("m" "meeting" entry
			 #'org-roam-capture--get-point
			 "* %<%I:%M %p> - %^{Meeting Title}  :meetings:\n\n%?\n\n"
			 :file-name "Journal/%<%Y-%m-%d>"
			 :olp ("Log")
			 :head "#+title: %<%Y-%m-%d %a>\n\n[[roam:%<%Y-%B>]]\n\n")))
  )


(leaf org-journal
  :bind
  (
   ("C-c C-j" . org-journal-new-entry)
   )
  :config
  (setq org-journal-dir "~/org/journal/")
  (setq org-journal-date-format  "%F, %A")
  (setq org-journal-time-format "%T")
  (setq org-journal-file-format "%Y.org")  ; their file names
  (setq org-journal-file-type 'Yearly)
  (setq org-journal-enable-agenda-integration t)

  (setq org-journal-enable-cache t)
  )

