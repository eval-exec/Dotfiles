;; To disable collection of benchmark data after init is done.
 (use-package benchmark-init
   :config
   ;; To disable collection of benchmark data after init is done.
   (add-hook 'after-init-hook 'benchmark-init/deactivate))

(use-package quelpa-use-package)

(setq custom-file "~/.emacs.d/config/custom.el")
(load custom-file)

(load "~/.emacs.d/load-directory")
(load-directory "~/.emacs.d/config")

(defmacro k-time (&rest body)
  "Measure and return the time it takes evaluating BODY."
  `(let ((time (current-time)))
	 ,@body
	 (float-time (time-since time))))

;; Set garbage collection threshold to 10GB.
(setq gc-cons-threshold 20000000000)

;; When idle for 15sec run the GC no matter what.
(defvar k-gc-timer
  (run-with-idle-timer 60 t
					   (lambda ()
						 (message "Garbage Collector has run for %.06fsec"
								  (k-time (garbage-collect))
								  )
						 )))


