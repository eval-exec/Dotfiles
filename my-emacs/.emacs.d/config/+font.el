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
(set-frame-font "Source Code Pro")
(set-fontset-font "fontset-default" 'unicode "Sarasa Mono SC Nerd")
(set-fontset-font "fontset-default" 'han "Sarasa Mono SC Nerd")
(set-fontset-font "fontset-default" 'symbol "Symbola")
(set-fontset-font "fontset-default" 'ascii "Source Code Pro")
(set-fontset-font "fontset-default" 'latin "Source Code Pro")
(set-fontset-font "fontset-default" 'unicode "Sarasa Mono SC Nerd")
 (set-fontset-font "fontset-default" 'cjk-misc "Sarasa Mono SC Nerd")

(add-to-list 'face-font-rescale-alist '("Symbola" . 0.6))

(leaf valign
  :hook (org-mode-hook . valign-mode))

