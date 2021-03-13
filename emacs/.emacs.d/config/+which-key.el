

;; Allow C-h to trigger which-key before it is done automatically
(setq which-key-show-early-on-C-h t)
;; make sure which-key doesn't show normally but refreshes quickly after it is
;; triggered.
(setq which-key-idle-delay 0.1)
(setq which-key-idle-secondary-delay 0.01)
(setq which-key-max-description-length nil)
(setq which-key-popup-type 'side-window)
(setq which-key-side-window-max-height 0.5)



(which-key-mode)
