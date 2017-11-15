
;; 插入图片后删除原图片 -- zhixing
;; org-download, add pictures to org files and delete original files.
;; abo-abo helped a lot.
(defun zx-org/delete-file (link filename)
  (setq link (org-link-unescape link))
  (let ((filename (and (string-match "\\`file:\\(.*\\)\\'" link)
                       (match-string 1 link))))
    (when (and filename
               (file-exists-p filename))
      (delete-file filename t))))

(defun zx-org/org-download-method (link)
  (let ((filename
         (file-name-nondirectory
          (car (url-path-and-query
                (url-generic-parse-url link)))))
        (dirname (concat "Images/" (file-name-sans-extension (buffer-name)) "-img/")))
    (unless (file-exists-p dirname)
      (make-directory dirname :parents))
    (expand-file-name (format "%s.%s"
                              (format-time-string "%Y-%m-%d_%H-%M-%S")
                              (file-name-extension filename))
                      dirname)))
