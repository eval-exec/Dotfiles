;;; package --- Summary
;;; Commentary:

;;; Code:
(eval-and-compile
  (customize-set-variable
   'package-archives

   '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
	 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
	 ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/"))

   )

  (package-initialize)
  (unless (package-installed-p 'leaf)
	(package-refresh-contents)
	(package-install 'leaf))

  (leaf leaf-keywords
	:ensure t
	:require t
	:config
	(leaf-keywords-init)))
;; </leaf-install-code>
(leaf leaf
  :custom ((leaf-defaults . '(:ensure t))))

(leaf gcmh
  (gcmh-mode 1)
  )

(set-default-coding-systems 'utf-8)
(leaf exec-path-from-shell
  :config

  (setenv   "GOPATH" "/home/vory/go")
  (setenv "GOBIN" "/home/vory/go/bin")
  (setenv "GO111MODULE" "auto")

 ( exec-path-from-shell-initialize))

(leaf leaf-tree :ensure t)
(leaf leaf-convert :ensure t)

(leaf autorevert
  :doc "revert buffers when files on disk change"
  :tag "builtin"
  :custom ((auto-revert-interval . 0.1))
  :global-minor-mode global-auto-revert-mode)

(leaf transient-dwim
  :ensure t
  :bind ("M-=" . transient-dwim-dispatch))



(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
(load "~/.emacs.d/load-directory")
(load-directory "~/.emacs.d/config")

(winner-mode 1)


;; (setq url-proxy-services '(
;; 						   ("no_proxy" . "^\\(*.tsinghua.*\\)")
;; 						   ("http" . "http://127.0.0.1:1081")
;; 						   ("https" . "http://127.0.0.1:1081")
;; 						   )
;; 	  )

