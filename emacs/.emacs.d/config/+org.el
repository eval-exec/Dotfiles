(use-package org
  :config
  (setq org-confirm-babel-evaluate nil)

  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
	 (shell . t)
	 (C . t)
	 (emacs-lisp . t)
	 (go . t)
	 (sed . t)
	 (rust . t)
	 ))

  ;; templates
  (setq 
   org-capture-bookmark nil
   org-default-notes-file "~/org/notes/"

   org-capture-templates
   '(
	 ("w" "work" entry
	  (file+headline "~/org/work/work.org" "WORK")
	  "** TODO %i %T %? ")

	 ("p" "personal stuff" entry
	  (file+headline "~/org/personal/personal.org" "Personl")
	  "* TODO %i %T  %?")

	 ("e" "EXEC" plain
	  (file+headline "~/org/personal/exec.org" "EXEC")
	  "** %i %T  %?")
	 ("c" "Code Stuff")
	 ("cl" "LeetCode" plain (file+headline "~/org/personal/leetocde.org" "Daily Challenge")    "**  %T %i %? 
#+BEGIN_SRC c

#+END_SRC
")
	 )
   )
  )

(use-package org-roam
  :hook (after-init . org-roam-mode)
  :custom
  (org-roam-directory "~/org/roam/")
  :custom
  (org-roam-db-location "~/org/roam-db/roam.db")
  :bind (:map org-roam-mode-map
			  (("C-c n l" . org-roam)
			   ("C-c n f" . org-roam-find-file)
			   ("C-c n g" . org-roam-graph))
			  :map org-mode-map
			  (("C-c n i" . org-roam-insert))
			  (("C-c n I" . org-roam-insert-immediate)))
  :config

  
  (setq org-roam-capture-templates
		'(
		  ("d" "default" plain (function org-roam--capture-get-point)
		   "%?"
		   :file-name "%(format-time-string \"%Y-%m-%d--%H-%M-%SZ--${slug}\" (current-time) t)"
		   :head "#+title: ${title}\n"
		   :unnarrowed t)
		  )
		)

  )




(use-package org-bullets
  :after (org)
  :init
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  )

(use-package org-cliplink
  :after (org)
  )
