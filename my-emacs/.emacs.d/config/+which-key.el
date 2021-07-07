(leaf which-key
  :config
  ;; Allow C-h to trigger which-key before it is done automatically
  (setq which-key-show-early-on-C-h t)
  (setq which-key-enable-extended-define-key t)
  (setq which-key-popup-type 'side-window)

  ;; make sure which-key doesn't show normally but refreshes quickly after it is
  ;; triggered.
  (setq which-key-idle-delay 0.01)
  (setq which-key-idle-secondary-delay 0.01)
  (setq which-key-max-description-length nil)
  (setq which-key-side-window-max-height 0.5)

										;(setq which-key-sort-order 'which-key-key-order)
  (setq which-key-sort-order 'which-key-prefix-then-key-order)
  ;; (setq which-key-sort-order 'which-key-local-then-key-order)

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



  (leaf which-key-posframe
    :config
    (setq which-key-posframe-poshandler 'posframe-poshandler-frame-center)
    (setq which-key-posframe-poshandler 'posframe-poshandler-frame-top-center)
    (setq which-key-posframe-poshandler 'posframe-poshandler-frame-top-left-corner)
    (setq which-key-posframe-poshandler 'posframe-poshandler-frame-top-right-corner)
    (setq which-key-posframe-poshandler 'posframe-poshandler-frame-bottom-left-corner)
    (setq which-key-posframe-poshandler 'posframe-poshandler-frame-bottom-right-corner)
    (setq which-key-posframe-poshandler 'posframe-poshandler-window-center)
    (setq which-key-posframe-poshandler 'posframe-poshandler-window-top-left-corner)
    (setq which-key-posframe-poshandler 'posframe-poshandler-window-top-right-corner)
    (setq which-key-posframe-poshandler 'posframe-poshandler-window-bottom-left-corner)
    (setq which-key-posframe-poshandler 'posframe-poshandler-window-bottom-right-corner)
    (setq which-key-posframe-poshandler 'posframe-poshandler-point-top-left-corner)
    (setq which-key-posframe-poshandler 'posframe-poshandler-point-bottom-left-corner)


    (setq which-key-posframe-font "Noto Sans Mono")
    (which-key-posframe-mode)
    )

  :global-minor-mode which-key-mode
  )
