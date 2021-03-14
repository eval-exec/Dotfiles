;;; ../Dotfiles/emacs/.doom.d/+org.el -*- lexical-binding: t; -*-



;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;;
;;



(use-package! org
  :defer
  :config
  (setq-default org-display-custom-times t)
  (setq org-time-stamp-custom-formats
        '("<%Y-%m-%d %a>" . "<%Y-%m-%d %a %H:%M:%S>"))

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
           (file+headline "~/org/personal/todo.org" "Inbox")
           "* TODO %?
%i
%a" :prepend t)
          ("n" "Personal notes" entry
           (file+headline "~/org/personal/notes" "Inbox")
           "* %u %?
%i
%a" :prepend t)
          ))
  )

(use-package! org-appear
  :after (org)
  :config
  (setq org-appear-autolinks t)
  (setq org-appear-autosubmarkers t)
  )
