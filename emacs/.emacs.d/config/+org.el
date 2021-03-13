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
  (setq 
   org-capture-bookmark nil
   org-default-notes-file "~/org/notes/"
   org-capture-templates
   '(("w" "work" entry
      (file+headline "~/org/work/work.org" "WORK")
      "** TODO %?  %i %T %a ")
     ("p" "personal stuff" entry
      (file "~/org/personal/personal.org")
      "* TODO %? %i %T %a")))
  )

(use-package org-roam
  :ensure t
  :hook
  (after-init . org-roam-mode)
  :custom
  (org-roam-directory "~/org/roam/")
  :bind (:map org-roam-mode-map
	      (("C-c n l" . org-roam)
	       ("C-c n f" . org-roam-find-file)
	       ("C-c n g" . org-roam-graph))
	      :map org-mode-map
	      (("C-c n i" . org-roam-insert))
	      (("C-c n I" . org-roam-insert-immediate))))



(use-package org-bullets
  :ensure t
  :init
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

  )
