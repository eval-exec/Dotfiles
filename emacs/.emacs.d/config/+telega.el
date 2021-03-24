(use-package telega
  :load-path  "~/github/telega.el"
  :defer t
  :custom
  (telega-proxies
   (list
    '(:server "127.0.0.1"  :port 1080 :enable t :type (:@type "proxyTypeSocks5" )
      )
    )
   )
  :commands (telega)

  )
