;;; ../Dotfiles/emacs/.doom.d/+org-agenda.el -*- lexical-binding: t; -*-

(use-package! org-agenda
  :config
  (setq org-journal-enable-agenda-integration t) ; so entries are on the agenda
  )
(use-package! org-super-agenda
  :after org-agenda

  :init
  (setq org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-if-done t
      org-agenda-include-deadlines t
      org-agenda-block-separator nil
      org-agenda-compact-blocks t
      org-agenda-start-day nil ;; i.e. today
      org-agenda-span 1
      org-agenda-start-on-weekday nil)
  (setq org-agenda-custom-commands
        '(("c" "Super view"
           ((agenda "" ((org-agenda-overriding-header "")
                        (org-super-agenda-groups
                         '((:name "Today"
                                  :time-grid t
                                  :date today
                                  :order 1)))))
            (alltodo "" ((org-agenda-overriding-header "")
                         (org-super-agenda-groups
                          '((:log t)
                            (:name "Next to do"
                                   :todo "NEXT"
                                   :order 1)
                            (:name "Important"
                                   :priority "A"
                                   :order 6)
                            (:name "Work"
                                   :file-path "work/")
                            (:name "Today's tasks"
                                   :file-path "journal/")
                            (:name "Due Today"
                                   :deadline today
                                   :order 2)
                            (:name "Scheduled Soon"
                                   :scheduled future
                                   :order 8)
                            (:name "Overdue"
                                   :deadline past
                                   :order 7)
                            (:name "Meetings"
                                   :and (:todo "MEET" :scheduled future)
                                   :order 10)
                            (:discard (:not (:todo "TODO")))))))))))

  :config
  (org-super-agenda-mode)
  )
