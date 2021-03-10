;;; ../Dotfiles/emacs/.doom.d/+calendar.el -*- lexical-binding: t; -*-

(after! calendar
  (setq calendar-date-style 'iso)
  (setq calendar-time-display-form
        '(24-hours \":\" minutes
                  (if time-zone \" (\") time-zone (if time-zone \")\"))
        )



  (setq calendar-latitude 39.54)
  (setq calendar-longitude 116.24)
  (setq calendar-location-name "Beijing, China")

  (setq view-diary-entries-initially t
        mark-diary-entries-in-calendar t
        number-of-diary-entries 7)
  (add-hook 'diary-display-hook 'fancy-diary-display)
  (add-hook 'today-visible-calendar-hook 'calendar-mark-today)



  (add-hook 'fancy-diary-display-mode-hook
            '(lambda ()
               (alt-clean-equal-signs)))

  (defun alt-clean-equal-signs ()
    "This function makes lines of = signs invisible."
    (goto-char (point-min))
    (let ((state buffer-read-only))
      (when state (setq buffer-read-only nil))
      (while (not (eobp))
        (search-forward-regexp "^=+$" nil 'move)
        (add-text-properties (match-beginning 0)
                             (match-end 0)
                             '(invisible t)))
      (when state (setq buffer-read-only t))))




  (define-derived-mode fancy-diary-display-mode  fundamental-mode
    "Diary"
    "Major mode used while displaying diary entries using Fancy Display."
    (set (make-local-variable 'font-lock-defaults)
         '(fancy-diary-font-lock-keywords t))
    (define-key (current-local-map) "q" 'quit-window)
    (define-key (current-local-map) "h" 'calendar))

  (defadvice fancy-diary-display (after set-mode activate)
    "Set the mode of the buffer *Fancy Diary Entries* to
 `fancy-diary-display-mode'."
    (save-excursion
      (set-buffer fancy-diary-buffer)
      (fancy-diary-display-mode)))
  )
