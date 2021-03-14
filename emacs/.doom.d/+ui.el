;;; ../Dotfiles/emacs/.doom.d/+ui.el -*- lexical-binding: t; -*-

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq
 doom-font (font-spec :family "roboto mono" :size 30 :weight 'regular )
 doom-variable-pitch-font (font-spec :family "roboto mono" :size 34)
 doom-big-font (font-spec :family "roboto mono" :size 34)
 )

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

(setq max-mini-window-height 0.5)
(setq
 custom-safe-themes t
 doom-themes-treemacs-theme "doom-colors"
 )
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type `visual)

(use-package! all-the-icons-ibuffer
  :defer
  :init
  (setq  all-the-icons-ibuffer-human-readable-size t)

  (setq all-the-icons-ibuffer-formats '((mark modified read-only locked
                                              " " (icon 2 2   :left :elide)
                                              " " (name 64 -1 :left :elide)
                                              " " (size-h 10 -1 :left )
                                              " " (mode+ 16 16 :left )
                                              " " (filename-and-process+ -1 -1 :left))))
  (all-the-icons-ibuffer-mode 1)
  )


(setq fancy-splash-image "~/.doom.d/asset/logo.png")

;; (setq beacon-blink-when-point-moves-vertically 2)
;; (setq beacon-blink-when-point-moves-horizontally 2)
;; (beacon-mode 1)
(setq mode-line-format
      (list
       '(:eval (list (nyan-create)))
       ))

(nyan-mode)
;; ;; Use variable width font faces in current buffer
;;  (defun my-buffer-face-mode-variable ()
;;    "Set font to a variable width (proportional) fonts in current buffer"
;;    (interactive)
;;    (setq buffer-face-mode-face '(:family "Symbola" :height 100 :width semi-condensed))
;;    (buffer-face-mode))

;;  ;; Use monospaced font faces in current buffer
;;  (defun my-buffer-face-mode-fixed ()
;;    "Sets a fixed width (monospace) font in current buffer"
;;    (interactive)
;;    (setq buffer-face-mode-face '(:family "Inconsolata" :height 100))
;;    (buffer-face-mode))

;;  ;; Set default font faces for Info and ERC modes
;;  (add-hook 'erc-mode-hook 'my-buffer-face-mode-variable)

(defun EXEC/info-mode-view-func()
  (setq buffer-face-mode-face '(:family "sans")
        ))

(add-hook 'Info-mode-hook 'EXEC/info-mode-view-func)
