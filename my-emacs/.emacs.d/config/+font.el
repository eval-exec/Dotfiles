;; 中文测试
;; english
;;(member "Sarasa Mono SC Nerd" (font-family-list))
;;; Code:

;; (add-to-list 'default-frame-alist
;;              '(font . "Sarasa Gothic SC-10")
;; 	     )
;; (add-to-list 'default-frame-alist
;;              '(font . "Sarasa Mono SC Nerd-10")
;; 	     )
;; (set-frame-font "Sarasa Mono SC Nerd")
;; (set-fontset-font "fontset-default" 'unicode "Monaco")
;; (set-fontset-font "fontset-default" 'han "Monaco")
;; (set-fontset-font "fontset-default" 'symbol "Monaco")
;; (set-fontset-font "fontset-default" 'ascii "Monaco")
;; (set-fontset-font "fontset-default" 'latin "Monaco")
;;  (set-fontset-font "fontset-default" 'cjk-misc "Monaco")

;; (add-to-list 'face-font-rescale-alist '("Monaco" . 0.6))

(leaf valign
  :hook (org-mode-hook . valign-mode))



(setq imy/english-font "Noto Sans Mono")
(setq imy/chinese-font "NOto Sans CJK SC")
;; (setq imy/english-font "Sarasa Mono SC Nerd")
;; (setq imy/chinese-font "Sarasa Mono SC Nerd")
(setq imy/english-font-height 100)
(setq imy/chinese-font-size 100)


;; Setting English Font  - Fira Code | Inconsolata | Monoid  + Unifont | Sarasa Mono SC Nerd |  PinFang SC | Source Code Pro | Monaco | menlo
(set-face-attribute 'default nil :height imy/english-font-height :weight 'regular :family imy/english-font)

;; Chinese Font 配制中文字体 PingFang SC | Songti SC
(if (display-graphic-p)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
			charset
			(font-spec  :family imy/chinese-font :size imy/chinese-font-size))))
