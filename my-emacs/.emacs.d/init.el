(setenv "PATH" "/home/vory/.nvm/versions/node/v14.0.0/bin:/home/vory/.local/bin:/home/vory/go/bin:/home/vory/.cargo/bin:/home/vory/bin:/usr/local/bin:/home/vory/.nvm/versions/node/v14.0.0/bin:/home/vory/.local/bin:/home/vory/go/bin:/home/vory/.cargo/bin:/home/vory/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/var/lib/flatpak/exports/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/lib/jvm/default/bin")
(setenv "GOPATH" "/home/vory/go")
(setenv "GOROOT" "/usr/lib/go")
(setenv "GOBIN" "/home/vory/go/bin")
(setenv "GO111MODULE" "on")
(setenv "LANG" "en_US.UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "GOARCH" "amd64")
(add-to-list 'exec-path "/home/vory/go/bin")
(add-to-list 'exec-path "/home/vory/.cargo/bin")
(add-to-list 'exec-path "/home/vory/.local/bin")


;;; package --- Summary
;;; Commentary:

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq make-backup-files nil)

;;; Code:
(eval-and-compile
  (customize-set-variable
   'package-archives
   '(
     ("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
     ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
     ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")

     ;; ("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
     ;; ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
     ;; ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
     )
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
(setq org-roam-v2-ack t)
;; (quelpa
;;  '(quelpa-leaf
;;    :fetcher git
;;    :url "https://github.com/quelpa/quelpa-leaf.git"))
(require 'quelpa-leaf)
(quelpa-leaf-init)

(setq inhibit-compacting-font-caches t)

(leaf gcmh
  :custom
  (gcmh-high-cons-threshold . 10737418240)
  (gcmh-idle-delay . 60)
  (gcmh-verbose .  nil)
  :config
  (gcmh-mode 1)
  )

(set-default-coding-systems 'utf-8)

(leaf leaf-tree :ensure t)
(leaf leaf-convert :ensure t)

;; (leaf autorevert
;;   :doc "revert buffers when files on disk change"
;;   :tag "builtin"
;;   :custom ((auto-revert-interval . 0.1))
;;   :global-minor-mode global-auto-revert-mode)

(leaf transient-dwim
  :ensure t
  :bind ("M-=" . transient-dwim-dispatch))



(setq custom-file "~/.emacs.d/config/custom.el")
(load custom-file)
(load "~/.emacs.d/config/config.el")
