;;; ../Dotfiles/emacs/.doom.d/+org-agenda.el -*- lexical-binding: t; -*-

(use-package! org-agenda
  :defer t
  :config
  (setq org-agenda-files '("~/org" "~/org/work"))
  (add-hook 'org-trigger-hook 'save-buffer)

  (setq org-agenda-skip-scheduled-if-done nil
        org-columns-default-format "%58ITEM %TODO %3PRIORITY %TAGS %5Effort(Est.){:} %CLOCKSUM(Spent){:}"
        org-agenda-skip-deadline-if-done nil
        org-agenda-include-deadlines t
                                        ;org-agenda-block-separator '|
        org-agenda-compact-blocks nil
        org-agenda-start-day "-1d";; i.e. today
        org-agenda-span 'week
        org-agenda-start-on-weekday nil)

  (setq org-journal-enable-agenda-integration t) ; so entries are on the agenda
  (setq org-agenda-include-diary t)
  )
(use-package! org-super-agenda
  :after org-agenda
  :init
  :config
  (let ((org-super-agenda-groups
         '((:auto-dir-name t)))))
  (org-super-agenda-mode)
  )
