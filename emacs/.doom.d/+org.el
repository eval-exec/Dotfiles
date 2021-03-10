;;; ../Dotfiles/emacs/.doom.d/+org.el -*- lexical-binding: t; -*-



;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(use-package! org
  :config
  (setq org-directory "~/org/")
  (setq org-noter-notes-search-path '("~/org/notes/"))

  ;; Org Capture
  ;;
  (setq org-capture-templates
        '(("w" "Work" entry
           (file+headline "~/org/work/work.org" "Work")
           "* %T %?
%i
%a" :prepend t)
          ("t" "Personal todo" entry
           (file+headline +org-capture-todo-file "Inbox")
           "* [ ] %?
%i
%a" :prepend t)
          ("n" "Personal notes" entry
           (file+headline +org-capture-notes-file "Inbox")
           "* %u %?
%i
%a" :prepend t)
          ("j" "Journal" entry
           (file+olp+datetree +org-capture-journal-file)
           "* %U %?
%i
%a" :prepend t)
          ("p" "Templates for projects")
          ("pt" "Project-local todo" entry
           (file+headline +org-capture-project-todo-file "Inbox")
           "* TODO %?
%i
%a" :prepend t)
          ("pn" "Project-local notes" entry
           (file+headline +org-capture-project-notes-file "Inbox")
           "* %U %?
%i
%a" :prepend t)
          ("pc" "Project-local changelog" entry
           (file+headline +org-capture-project-changelog-file "Unreleased")
           "* %U %?
%i
%a" :prepend t)
          ("o" "Centralized templates for projects")
          ("ot" "Project todo" entry #'+org-capture-central-project-todo-file "* TODO %?
 %i
 %a" :heading "Tasks" :prepend nil)
          ("on" "Project notes" entry #'+org-capture-central-project-notes-file "* %U %?
 %i
 %a" :heading "Notes" :prepend t)
          ("oc" "Project changelog" entry #'+org-capture-central-project-changelog-file "* %U %?
 %i
 %a" :heading "Changelog" :prepend t))
        )
  )
