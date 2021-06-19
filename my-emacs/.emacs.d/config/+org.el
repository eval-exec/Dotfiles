






(defun skx/update-org-modified-property ()
  "If a file contains a '#+LAST_MODIFIED' property update it to contain
  the current date/time"
  (interactive)
  (save-excursion
    (widen)
    (goto-char (point-min))
    (when (re-search-forward "^#\\+LAST_MODIFIED:" (point-max) t)
      (progn
	(kill-line)
					;(insert (format-time-string " %d/%m/%Y %H:%M:%S") )))))
	(insert (format-time-string " [%Y-%m-%d %a %H:%M]") )))))



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

(defun solar-sunrise-string (date &optional nolocation)
  "String of *local* time of sunrise and daylight on Gregorian DATE."
  (let ((l (solar-sunrise-sunset date)))
    (format
     "%s (%s hours daylight)"
     (if (car l)
	 (concat "Sunset " (apply 'solar-time-string (car l)))
       "no sunset")
     (nth 2 l)
     )))
;; To be called from diary-list-sexp-entries, where DATE is bound.
;;;###diary-autoload
(defun diary-sunrise ()
  "Local time of sunrise as a diary entry.
  Accurate to a few seconds."
  (or (and calendar-latitude calendar-longitude calendar-time-zone)
      (solar-setup))
  (solar-sunrise-string date))

(defun solar-sunset-string (date &optional nolocation)
  "String of *local* time of sunset and daylight on Gregorian DATE."
  (let ((l (solar-sunrise-sunset date)))
    (format
     "%s (%s hours daylight)"
     (if (cadr l)
	 (concat "Sunset " (apply 'solar-time-string (cadr l)))
       "no sunset")
     (nth 2 l)
     )))
;; To be called from diary-list-sexp-entries, where DATE is bound.
;;;###diary-autoload
(defun diary-sunset ()
  "Local time of sunset as a diary entry.
  Accurate to a few seconds."
  (or (and calendar-latitude calendar-longitude calendar-time-zone)
      (solar-setup))
  (solar-sunset-string date))

(defun skx-org-mode-before-save-hook ()
  (when (eq major-mode 'org-mode)
    (skx/update-org-modified-property)))


(leaf org
  :bind (
	 ("C-c o l" . org-store-link)
	 ("C-c o a" . org-agenda)
	 ("C-c o c" . org-capture)
	 )
  :hook
  (
   (before-save .   skx-org-mode-before-save-hook)
   (org-trigger-hook . save-buffer)
   )

  :custom
;;;;;;; org-agenda-begin
  (org-log-done .  'time)
  (org-agenda-files . '("~/org" "~/org/work" "~/org/personal" "~/org/journal" "~/org/notes"))
  (org-agenda-include-diary . t)

  (org-agenda-time-grid . '((daily today require-timed) (000 100 200 300 400 500 600 700 800 900 1000 1100 1200 1300 1400 1500 1600 1700 1800 1900 2000 2100 2200 2300 2400) "......" "----------------"))
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
  (org-capture-templates .
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
  :config


  (leaf org-superstar
    :hook (org-mode-hook . org-superstar-mode)
    :config
    (setq org-hide-leading-stars nil)
    (setq org-superstar-leading-bullet ?\s)
    (setq org-indent-mode-turns-on-hiding-stars nil)
    (setq org-superstar-special-todo-items t)
    )

  (leaf org-cliplink
    :after (org)
    )

  (leaf org-appear
    :after (org)
    :hook (org-mode-hook . org-appear-mode)
    )
)






(leaf org-roam
  :hook	 (after-init-hook . org-roam-mode)
  :bind (
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

  (org-roam-buffer-width . 0.33)

  (org-roam-completion-everywhere . t)
  (org-roam-completion-ignore-case . t)
  (org-roam-completion-system . 'helm)
  (org-roam-include-type-in-ref-path-completions . nil)

  (org-roam-db-location . "~/.cache/org-roam-db/roam.db")
  (org-roam-db-update-method . 'immediate)
  (org-roam-directory . "~/org/roam/")

  (org-roam-file-completion-tag-position . 'append)
  (org-roam-graph-shorten-titles . 'wrap)
  (org-roam-include-type-in-ref-path-completions . t)
  (org-roam-protocol-store-links . t)
  (org-roam-title-to-slug-function . 'EXEC/org-roam--title-to-slug)

  (org-roam-capture-templates . '(
				("d" "default" plain (function org-roam--capture-get-point)
				 "%?"
				 :file-name "%(format-time-string \"${slug}__%Y-%m-%d-%H:%M:%S\")"
				 :head "#+TITLE: ${title}\n#+CREATED: %U\n#+LAST_MODIFIED: %U\n#+ROAM_TAGS: \n"
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
  (org-roam-dailies-capture-templates .   '(("d" "default" entry
					 #'org-roam-capture--get-point
					 "* %?"
					 :file-name "Journal/%<%Y-%m-%d>"
					 :head "#+TITLE: %<%Y-%m-%d %a>\n\n[[roam:%<%Y-%B>]]\n\n")
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
  :config
  ;;; org-roam-server
  (leaf org-roam-server
    :custom
    (org-roam-server-host . "127.0.0.1")
    (org-roam-server-port . 3333 )
    (org-roam-server-authenticate . nil )
    (org-roam-server-export-inline-images . t )
    (org-roam-server-serve-files . nil )
    (org-roam-server-served-file-extensions . '("pdf" "mp4" "ogv" "org") )
    (org-roam-server-network-poll . t )
    (org-roam-server-network-arrows . nil )
    (org-roam-server-network-label-truncate . t )
    (org-roam-server-network-label-truncate-length . 60 )
    (org-roam-server-network-label-wrap-length . 20)
    ;;:global-minor-mode org-roam-server-mode
    )
  )


(leaf org-journal
  :bind
  (
   ("C-c o j" . org-journal-new-entry)
   )
  :custom
  (org-journal-dir . "~/org/journal/")
  (org-journal-date-format .  "%F, %A")
  (org-journal-time-format . "%T")
  (org-journal-file-format . "%Y.org")  ; their file names
  (org-journal-file-type . 'Yearly)
  (org-journal-enable-agenda-integration . t)
  (org-journal-enable-cache . t)
  )


(leaf hl-todo
  :config
  (hl-todo-mode))


(leaf org-download
  )



(leaf org-pdftools
  :hook (org-mode . org-pdftools-setup-link))
(leaf org-noter
  :config
  ;; Your org-noter config ........


  (leaf org-noter-pdftools
    :config
    ;; Add a function to ensure precise note is inserted
    (defun org-noter-pdftools-insert-precise-note (&optional toggle-no-questions)
      (interactive "P")
      (org-noter--with-valid-session
       (let ((org-noter-insert-note-no-questions (if toggle-no-questions
						     (not org-noter-insert-note-no-questions)
						   org-noter-insert-note-no-questions))
	     (org-pdftools-use-isearch-link t)
	     (org-pdftools-use-freestyle-annot t))
	 (org-noter-insert-note (org-noter--get-precise-info)))))

    ;; fix https://github.com/weirdNox/org-noter/pull/93/commits/f8349ae7575e599f375de1be6be2d0d5de4e6cbf
    (defun org-noter-set-start-location (&optional arg)
      "When opening a session with this document, go to the current location.
With a prefix ARG, remove start location."
      (interactive "P")
      (org-noter--with-valid-session
       (let ((inhibit-read-only t)
	     (ast (org-noter--parse-root))
	     (location (org-noter--doc-approx-location (when (called-interactively-p 'any) 'interactive))))
	 (with-current-buffer (org-noter--session-notes-buffer session)
	   (org-with-wide-buffer
	    (goto-char (org-element-property :begin ast))
	    (if arg
		(org-entry-delete nil org-noter-property-note-location)
	      (org-entry-put nil org-noter-property-note-location
			     (org-noter--pretty-print-location location))))))))
    (with-eval-after-load 'pdf-annot
      (add-hook 'pdf-annot-activate-handler-functions #'org-noter-pdftools-jump-to-note))
    )
  )


(leaf deft
  :custom
  (deft-extensions . '("txt" "org" "md"))
  (deft-directory . "~/org/")
  (deft-recursive . t)
  (deft-use-filename-as-title . t)
  :bind (
	 ("C-c d d" . deft)
	 ("C-c d f" . deft-find-file)
	 )
  )
