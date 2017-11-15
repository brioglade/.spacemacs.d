
(with-eval-after-load 'org
  (setq org-download-heading-lvl nil)
  (setq org-download-annotate-function 'ignore)

  ;; 插入图片后删除原图片 -- zhixing
  (advice-add 'org-download-insert-link :after 'zx-org/delete-file)
  (setq org-download-method 'zx-org/org-download-method)

  )
