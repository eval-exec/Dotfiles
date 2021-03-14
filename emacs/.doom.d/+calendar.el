;;; ../Dotfiles/emacs/.doom.d/+calendar.el -*- lexical-binding: t; -*-

(after! calendar
  :init
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
  :config
  (add-hook 'diary-display-hook 'fancy-diary-display)
  (add-hook 'today-visible-calendar-hook 'calendar-mark-today)

  )
