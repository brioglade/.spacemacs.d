
;; Code from the Internet https://gist.github.com/et2010/d7a547d689f65345a06011a35f5044f1
;; join two lines about Chinese character
(defun zx-misc/fixup-whitespace ()
  (interactive "*")
  (save-excursion
    (delete-horizontal-space)
    (if (or (looking-at "^\\|\\s)")
            (save-excursion (forward-char -1)
                            (looking-at "\\cc\\|$\\|\\s(\\|\\s'")))
        nil
      (insert ?\s))))
(defun zx-misc/delete-indentation (old-func &rest args)
  (cl-letf (((symbol-function 'fixup-whitespace) #'zx-misc/fixup-whitespace))
    (apply old-func args)))
(advice-add #'delete-indentation :around #'zx-misc/delete-indentation)

(defun toggle-env-http-proxy ()
  "set/unset the environment variable http_proxy which w3m uses"
  (interactive)
  (let ((proxy "http://127.0.0.1:8087"))
    (if (string= (getenv "http_proxy") proxy)
        ;; clear the proxy
        (progn
          (setenv "http_proxy" "")
          (message "env http_proxy is empty now")
          )
      ;; set the proxy
      (setenv "http_proxy" proxy)
      (message "env http_proxy is %s now" proxy)
      )))


;; 下面是我自己的配置，可按需更改 -- zhixing
(defun zx-misc/insert-time-string ()
  (interactive)
  (insert (format-time-string "%Y%m%d")))
(defun zx-misc/insert-time-string-for-git ()
  (interactive)
  (insert (format-time-string "[%Y%m%d_%H%M]")))

(defun zx-misc/clean ()
  (interactive)
  (desktop-clear) (recentf-cleanup) (clean-buffer-list) (projectile-clear-known-projects) (spacemacs/home))

