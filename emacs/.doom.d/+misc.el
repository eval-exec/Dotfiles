;;; ../Dotfiles/emacs/.doom.d/+misc.el -*- lexical-binding: t; -*-

(use-package! leetcode
  :defer t
  :config
  (setq leetcode-prefer-language "c++")
  (setq leetcode-save-solutions t)
  (setq leetcode-directory "~/github.com/eval-exec/Algorithm/LeetCode/")
  )

(setq diary-file "~/org/diary")
