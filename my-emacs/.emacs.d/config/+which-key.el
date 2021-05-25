(leaf which-key
  :config
  ;; Allow C-h to trigger which-key before it is done automatically
  (setq which-key-show-early-on-C-h t)

  ;; make sure which-key doesn't show normally but refreshes quickly after it is
  ;; triggered.
  (setq which-key-idle-delay 0.1)
  (setq which-key-idle-secondary-delay 0.01)
  (setq which-key-max-description-length nil)
  (setq which-key-popup-type 'side-window)
  (setq which-key-side-window-max-height 0.5)
; (add-to-list 'which-key-replacement-alist '(("TAB" . nil) . ("↹" . nil)))
; (add-to-list 'which-key-replacement-alist '(("RET" . nil) . ("⏎" . nil)))
; (add-to-list 'which-key-replacement-alist '(("DEL" . nil) . ("⇤" . nil)))
; (add-to-list 'which-key-replacement-alist '(("SPC" . nil) . ("␣" . nil)))

;  (setq which-key-special-keys '("SPC" "TAB" "RET" "ESC" "DEL"))

;;   (which-key-add-key-based-replacements
;;     "SPC b" "buffer"
;;     "SPC c" "close or hide"
;;     "SPC m" "bookmark"
;;     "SPC o" "open"
;;     "SPC s" "search"
;;     "SPC t" "toggle"
;;     "SPC w" "window"
;;     "SPC f" "frame"
;;     "SPC h" "help"
;;     )


  (which-key-mode)
  )


