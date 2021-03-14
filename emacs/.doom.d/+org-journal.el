;;; ../Dotfiles/emacs/.doom.d/+org-journal.el -*- lexical-binding: t; -*-
(use-package! org-journal
  :after org
  :config
  (setq org-journal-dir "~/org/journal/")
  (setq org-journal-date-format "%A, %d %B %Y")
  (setq org-journal-file-format "%Y-%m.org")  ; their file names
  (setq org-journal-file-type 'monthly)
  )
