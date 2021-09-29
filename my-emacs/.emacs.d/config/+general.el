(defun exec/put-file-name-on-clipboard ()
  "Put the current file name on the clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
		      default-directory
		    (buffer-file-name))))
    (when filename
      (with-temp-buffer
	(insert filename)
	(clipboard-kill-region (point-min) (point-max)))
      (message filename))))

(leaf general
  :config
  (general-define-key
   :state 'normal
   "C-S-c" 'exec/put-file-name-on-clipboard)
  )
