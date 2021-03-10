;;; ../Dotfiles/emacs/.doom.d/+org-journal.el -*- lexical-binding: t; -*-
(use-package! org-journal
  :config
  (setq org-journal-dir "~/org/journal/")
  (setq org-journal-date-format "%A, %d %B %Y")
  (setq org-journal-file-format "%Y-%m-%d.org")  ; their file names
  (setq org-journal-file-type 'daily)


  (defun org-journal-file-header-func (time)
    "Custom function to create journal header."
    (concat
     (pcase org-journal-file-type
       (`daily "#+TITLE: Daily Journal\n#+STARTUP: showeverything")
       (`weekly "#+TITLE: Weekly Journal\n#+STARTUP: folded")
       (`monthly "#+TITLE: Monthly Journal\n#+STARTUP: folded")
       (`yearly "#+TITLE: Yearly Journal\n#+STARTUP: folded"))))

  (setq org-journal-file-header 'org-journal-file-header-func)

  )
