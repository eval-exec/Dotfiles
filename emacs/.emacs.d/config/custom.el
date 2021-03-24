(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#000000" "#990000" "#339900" "#666633" "#0000C8" "#9933FF" "#666633" "#000000"])
 '(ansi-term-color-vector
   [unspecified "#2d2a2e" "#ff6188" "#a9dc76" "#ffd866" "#78dce8" "#ab9df2" "#a1efe4" "#fcfcfa"])
 '(auto-save-default nil)
 '(awesome-tray-mode-line-active-color "#2fafff")
 '(awesome-tray-mode-line-inactive-color "#323232")
 '(blink-cursor-blinks 0)
 '(blink-cursor-delay 0.1)
 '(blink-cursor-interval 0.1)
 '(column-number-mode t)
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(compilation-message-face 'default)
 '(confirm-kill-emacs 'yes-or-no-p)
 '(cua-global-mark-cursor-color "#3cafa5")
 '(cua-normal-cursor-color "#8d9fa1")
 '(cua-overwrite-cursor-color "#c49619")
 '(cua-read-only-cursor-color "#93a61a")
 '(custom-enabled-themes '(exec-dracula))
 '(custom-safe-themes t)
 '(display-line-numbers 'visual)
 '(display-line-numbers-grow-only t)
 '(display-line-numbers-major-tick 0)
 '(display-line-numbers-minor-tick 0)
 '(display-line-numbers-type 'visual)
 '(display-line-numbers-width nil)
 '(exwm-floating-border-color "#646464")
 '(fci-rule-color "#4C566A")
 '(flymake-error-bitmap '(flymake-double-exclamation-mark modus-theme-fringe-red))
 '(flymake-note-bitmap '(exclamation-mark modus-theme-fringe-cyan))
 '(flymake-warning-bitmap '(exclamation-mark modus-theme-fringe-yellow))
 '(frame-background-mode nil)
 '(fringe-mode 6 nil (fringe))
 '(global-display-line-numbers-mode t)
 '(helm-minibuffer-history-key "M-p")
 '(helm-scroll-amount 8)
 '(highlight-changes-colors '("#e2468f" "#7a7ed2"))
 '(highlight-symbol-colors
   '("#3c6f408d329d" "#0c4a45f64ce3" "#486e33913532" "#1fac3bea568d" "#2ec943ac3324" "#449935a7314d" "#0b04411b5986"))
 '(highlight-symbol-foreground-color "#9eacac")
 '(highlight-tail-colors '(("#2f4a00" . 0) ("#00415e" . 20)))
 '(hl-bg-colors
   '("#936d00" "#a72e01" "#ae1212" "#a81761" "#3548a2" "#0069b0" "#008981" "#687f00"))
 '(hl-fg-colors
   '("#002732" "#002732" "#002732" "#002732" "#002732" "#002732" "#002732" "#002732"))
 '(hl-paren-background-colors '("#e8fce8" "#c1e7f8" "#f8e8e8"))
 '(hl-paren-colors '("#3cafa5" "#c49619" "#3c98e0" "#7a7ed2" "#93a61a"))
 '(hl-sexp-background-color "#1c1f26")
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
	 ("NEXT" . "#dc752f")
	 ("THEM" . "#2d9574")
	 ("PROG" . "#4f97d7")
	 ("OKAY" . "#4f97d7")
	 ("DONT" . "#f2241f")
	 ("FAIL" . "#f2241f")
	 ("DONE" . "#86dc2f")
	 ("NOTE" . "#b1951d")
	 ("KLUDGE" . "#b1951d")
	 ("HACK" . "#b1951d")
	 ("TEMP" . "#b1951d")
	 ("FIXME" . "#dc752f")
	 ("XXX+" . "#dc752f")
	 ("\\?\\?\\?+" . "#dc752f")))
 '(hscroll-step nil)
 '(ibuffer-deletion-face 'modus-theme-mark-del)
 '(ibuffer-filter-group-name-face 'modus-theme-mark-symbol)
 '(ibuffer-marked-face 'modus-theme-mark-sel)
 '(ibuffer-title-face 'modus-theme-pseudo-header)
 '(jdee-db-active-breakpoint-face-colors (cons "#191C25" "#81A1C1"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#191C25" "#A3BE8C"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#191C25" "#434C5E"))
 '(line-spacing 0.0)
 '(linum-format 'dynamic)
 '(lsp-ui-doc-border "#9eacac")
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(nrepl-message-colors
   '("#ec423a" "#db5823" "#c49619" "#687f00" "#c3d255" "#0069b0" "#3cafa5" "#e2468f" "#7a7ed2"))
 '(objed-cursor-color "#BF616A")
 '(org-agenda-files
   '("/home/vory/org/Routine.org" "/home/vory/org/habits.org" "/home/vory/org/test.org" "/home/vory/org/work/work.org" "/home/vory/org/personal/exec.org" "/home/vory/org/personal/leetocde.org" "/home/vory/org/personal/personal.org" "/home/vory/org/personal/todo.org" "/home/vory/org/notes/TheGraph.org" "/home/vory/org/notes/interview.org" "/home/vory/org/notes/popo.org" "/home/vory/org/journal/2021.org"))
 '(org-src-block-faces 'nil)
 '(package-archives
   '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
	 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
	 ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))
 '(package-native-compile t)
 '(package-selected-packages
   '(beacon fzf helm-fuzzy-find calfw-cal calfw-org calfw acme-theme doom-themes spaceline-all-the-icons all-the-icons-gnus treemacs-all-the-icons helm-rg helm-themes doom-modeline-now-playing rainbow-delimiters evil-leader evil-nerd-commenter avk-emacs-themes zenburn-theme cyberpunk-2019-theme cyberpunk-theme quelpa tao-theme sexy-monochrome-theme almost-mono-themes firecode-theme leuven-theme dark-krystal-theme cherry-blossom-theme blackboard-theme quelpa-use-package solarized-theme benchmark-init forge rainbow-identifiers visual-fill-column epc org-roam-protocol dired-rainbow all-the-icons-dired leetcode professional-theme ibuffer zerodark-theme which-key vdiff-magit use-package undo-tree treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired treemacs-evil spacegray-theme poet-theme ox-hugo orgit org-super-agenda org-roam org-plus-contrib org-cliplink org-bullets ob-rust ob-go material-theme ibuffer-vc ibuffer-projectile helpful helm-flx fcitx evil-smartparens evil-collection eterm-256color dracula-theme doom-modeline dashboard counsel company-irony company-c-headers auto-complete atom-one-dark-theme all-the-icons-ivy-rich all-the-icons-ibuffer))
 '(pdf-view-midnight-colors (cons "#ECEFF4" "#2E3440"))
 '(pos-tip-background-color "#01323d")
 '(pos-tip-foreground-color "#9eacac")
 '(rustic-ansi-faces
   ["#2E3440" "#BF616A" "#A3BE8C" "#EBCB8B" "#81A1C1" "#B48EAD" "#88C0D0" "#ECEFF4"])
 '(scroll-bar-mode nil)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#93a61a" "#01323d" 0.2))
 '(sml/active-background-color "#98ece8")
 '(sml/active-foreground-color "#424242")
 '(sml/inactive-background-color "#4fa8a8")
 '(sml/inactive-foreground-color "#424242")
 '(tab-width 4)
 '(term-default-bg-color "#002732")
 '(term-default-fg-color "#8d9fa1")
 '(tetris-x-colors
   [[229 192 123]
	[97 175 239]
	[209 154 102]
	[224 108 117]
	[152 195 121]
	[198 120 221]
	[86 182 194]])
 '(tool-bar-mode nil)
 '(use-package-verbose t)
 '(vc-annotate-background "#2E3440")
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (list
	(cons 20 "#A3BE8C")
	(cons 40 "#bbc28b")
	(cons 60 "#d3c68b")
	(cons 80 "#EBCB8B")
	(cons 100 "#e2b482")
	(cons 120 "#d99d79")
	(cons 140 "#D08770")
	(cons 160 "#c68984")
	(cons 180 "#bd8b98")
	(cons 200 "#B48EAD")
	(cons 220 "#b77f96")
	(cons 240 "#bb7080")
	(cons 260 "#BF616A")
	(cons 280 "#a05b67")
	(cons 300 "#815664")
	(cons 320 "#625161")
	(cons 340 "#4C566A")
	(cons 360 "#4C566A")))
 '(vc-annotate-very-old-color nil)
 '(warning-suppress-types '((comp)))
 '(weechat-color-list
   '(unspecified "#002732" "#01323d" "#ae1212" "#ec423a" "#687f00" "#93a61a" "#936d00" "#c49619" "#0069b0" "#3c98e0" "#a81761" "#e2468f" "#008981" "#3cafa5" "#8d9fa1" "#60767e"))
 '(xterm-color-names
   ["black" "#ff8059" "#44bc44" "#eecc00" "#2fafff" "#feacd0" "#00d3d0" "gray65"])
 '(xterm-color-names-bright
   ["gray35" "#f4923b" "#70c900" "#cfdf30" "#79a8ff" "#f78fe7" "#4ae8fc" "white"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(line-number-current-line ((t (:inherit line-number :background "red" :foreground "white" :weight extra-bold))))
 '(line-number-major-tick ((t nil)))
 '(line-number-minor-tick ((t nil))))



