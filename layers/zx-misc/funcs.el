
;; 设置标题栏样式
;; https://github.com/lululau/dot_files/blob/use-ruby-mode/emacs-config/funcs/title-format.el
(defun lx/layout-format-name (name pos)
  "Format the layout name given by NAME for display in mode-line."
  (let* ((layout-name (if (file-directory-p name)
                          (file-name-nondirectory (directory-file-name name))
                        name))
         (string-name (format "%s" layout-name))
         (current (equal name (spacemacs//current-layout-name)))
         (caption (concat (number-to-string (if (eq 9 pos) 0 (1+ pos)))
                          ". " string-name)))
    (if current
        ;; (propertize (concat "<<  " caption " >>") 'face 'warning)
        (propertize (concat "★ " caption) 'face 'warning)
      caption)))

(defun lx/layouts-for-title-bar ()
  "Return a one liner string containing all the layout names."
  (let* ((persp-list (or (persp-names-current-frame-fast-ordered)
                         (list persp-nil-name)))
         (spaces (if (< (display-pixel-width) 1300)
                     "    "
                   "          "))
         (formatted-persp-list
          (concat " "
                  (mapconcat (lambda (persp)
                               (lx/layout-format-name
                                persp (position persp persp-list)))
                             persp-list spaces)))
         (file (if (projectile-project-p)
                    (if (buffer-file-name)
                        (s-replace (projectile-project-root) (format "【%s】" (projectile-project-name)) (buffer-file-name))
                      (buffer-name))
                 (if (buffer-file-name)
                     (if (string-match (concat "^" (getenv "HOME")) (buffer-file-name))
                         (concat "~" (substring (buffer-file-name) (length (getenv "HOME"))))
                       (buffer-file-name)) (buffer-name)))))
    (concat file "     -     " formatted-persp-list)))

(defun lx/default-title-bar ()
  (if (projectile-project-p)
      (concat
       (projectile-project-name)
       (if (buffer-file-name)
           (concat "  ✈  " (substring (buffer-file-name) (length (projectile-project-root))))
         (concat "  ✈  "(buffer-name))))
    (if (buffer-file-name)
        (if (string-match (concat "^" (getenv "HOME")) (buffer-file-name))
            (concat "~" (substring (buffer-file-name) (length (getenv "HOME"))))
          (buffer-file-name)) (buffer-name))))

(defun lx/toggle-title-format()
  (interactive)
  (if (equal frame-title-format '(:eval (lx/layouts-for-title-bar)))
      (setq frame-title-format '(:eval (lx/default-title-bar)))
    (setq frame-title-format '(:eval (lx/layouts-for-title-bar))))
(redraw-frame))

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

