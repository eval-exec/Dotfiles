(leaf org

  :bind (
		 ("C-c o l" . org-store-link)
		 ("C-c o a" . org-agenda)
		 ("C-c o c" . org-capture)
		 )
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
  (setq org-todo-keywords '((sequence "TODO" "DONE" "CANCEL")))


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
	("C-c o r l" . org-roam)
	("C-c o r f f" . org-roam-find-file)

	("C-c o r d"   . org-roam-dailies-find-date)
	("C-c o r c"   . org-roam-dailies-capture-today)
	("C-c o r C r" . org-roam-dailies-capture-tomorrow)
	("C-c o r f t"   . org-roam-dailies-find-today)
	("C-c o r f y"   . org-roam-dailies-find-yesterday)
	("C-c o r f r"   . org-roam-dailies-find-tomorrow)
	("C-c o r g" . org-roam-graph)
	)

   (:org-mode-map
	("C-c o r i" . org-roam-insert)
	("C-c o r I" . org-roam-insert-immediate))
   )

  :custom
  (org-roam-directory . "~/org/roam/")
  (org-roam-db-location . "~/.cache/org-roam-db/roam.db")
  :config

  (setq org-roam-db-update-method 'immediate)
  (setq org-roam-completion-ignore-case t)
  (setq org-roam-completion-system 'helm)
  ;;(setq org-roam-buffer-width 0.382)
  (setq org-roam-buffer-width 0.33)
  (setq org-roam-completion-everywhere t)

  (setq org-roam-index-file "Index.org")

  (defun EXEC/org-roam--title-to-slug (title)
	"Convert TITLE to a filename-suitable slug."
	(cl-flet* ((nonspacing-mark-p (char)
                                  (memq char org-roam-slug-trim-chars))
               (strip-nonspacing-marks (s)
                                       (ucs-normalize-NFC-string
										(apply #'string (seq-remove #'nonspacing-mark-p
																	(ucs-normalize-NFD-string s)))))
               (cl-replace (title pair)
                           (replace-regexp-in-string (car pair) (cdr pair) title)))
      (let* ((pairs `(("[^[:alnum:][:digit:]]" . "_")  ;; convert anything not alphanumeric
                      ("__*" . "_")  ;; remove sequential underscores
                      ("^_" . "")  ;; remove starting underscore
                      ("_$" . "")))  ;; remove ending underscore
			 (slug (-reduce-from #'cl-replace (strip-nonspacing-marks title) pairs)))
		(format "%s" slug)
		)))
  (setq org-roam-title-to-slug-function 'EXEC/org-roam--title-to-slug)

  (format-time-string "%Y-%m-%d-%a-%H:%M:%S")

  (setq org-roam-capture-templates
		'(
		  ("d" "default" plain (function org-roam--capture-get-point)
		   "%?"
		   ;;:file-name "%(format-time-string \"${slug}--%Y-%m-%d-%a-%H-%M-%S\" (current-time) t)"
		   ;;:file-name "${slug}--%<%Y%m%d%H%M%S>"
	 ;; 	   :file-name "%(format-time-string \"${slug}--%s\" (format-time-string '%Y-%m-%d-%a-%T') t)"
     ;; :file-name "%(format-time-string \"%Y-%m-%d--%H-%M-%SZ--${slug}\" (current-time) t)"

  ;:file-name "%(format \"${slug}--%s\" (format-time-string \"%Y-%m-%d-%a--%H:%M:%S\"))"
  :file-name "%(format-time-string \"${slug}__%Y-%m-%d-%H:%M:%S\")"



		   :head "#+title: ${title}\n"
		   :unnarrowed t)
		  ("ll" "link note" plain
		   #'org-roam-capture--get-point
		   "* %^{Link}"
		   :file-name "Inbox"
		   :olp ("Links")
		   :unnarrowed t
		   :immediate-finish)
		  ("lt" "link task" entry
		   #'org-roam-capture--get-point
		   "* TODO %^{Link}"
		   :file-name "Inbox"
		   :olp ("Tasks")
		   :unnarrowed t
		   :immediate-finish)
		  )
		
		)



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


  ;;; org-roam-server
  (leaf org-roam-server
	:config
	(setq org-roam-server-host "127.0.0.1"
          org-roam-server-port 3333
          org-roam-server-authenticate nil
          org-roam-server-export-inline-images t
          org-roam-server-serve-files nil
          org-roam-server-served-file-extensions '("pdf" "mp4" "ogv" "org")
          org-roam-server-network-poll t
          org-roam-server-network-arrows nil
          org-roam-server-network-label-truncate t
          org-roam-server-network-label-truncate-length 60
          org-roam-server-network-label-wrap-length 20)
(require 'org-roam-protocol)
(org-roam-server-mode)

	)
  )


(leaf org-journal
  :bind
  (
   ("C-c o j" . org-journal-new-entry)
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

