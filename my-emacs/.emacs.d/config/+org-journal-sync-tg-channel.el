(defun read-file (filename)
  (save-excursion
    (let ((new (get-buffer-create filename)) (current (current-buffer)))
      (switch-to-buffer new)
      (insert-file-contents filename)
      (mark-whole-buffer)
      (let ((contents (buffer-substring (mark) (point))))
	(kill-buffer new)
	(switch-to-buffer current)
	contents))))


(defun exec/get-org-entry-summary ()
  (interactive)
  (setq urlraw (format 
		"https://api.telegram.org/bot%s/sendMessage?chat_id=@%s&text="
		(read-file "/home/vory/.emacs.d/config/tgsync.token")	(read-file "/home/vory/.emacs.d/config/chatid.priv")))
  (setq urlraw (concat urlraw   (buffer-substring (line-beginning-position) (line-end-position))))

  (message urlraw)
  (setq urlq (url-encode-url urlraw))
  
  (setq url-proxy-services '(("http" . "127.0.0.1:1081")
			     ("https" . "127.0.0.1:1081"))) 
  (url-retrieve-synchronously urlq)
  (message "sync to telegram channel success")
  )




