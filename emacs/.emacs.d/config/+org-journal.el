(use-package org-journal
  :config
  (setq org-journal-dir "~/org/journal/")
  (setq org-journal-date-format  "%A, %d %B %Y")
  (setq org-journal-time-format "%T")
  (setq org-journal-file-format "%Y.org")  ; their file names
  (setq org-journal-file-type 'yearly)
  (setq org-journal-enable-agenda-integration t)
  (defun org-journal-save-entry-and-exit()
	"Simple convenience function.
  Saves the buffer of the current day's entry and kills the window
  Similar to org-capture like behavior"
	(interactive)
	(save-buffer)
	(kill-buffer-and-window))
  (define-key org-journal-mode-map (kbd "C-x C-s") 'org-journal-save-entry-and-exit)
  )
