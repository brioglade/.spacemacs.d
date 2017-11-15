(defconst zx-misc-packages
  '(
	;; 可用于编辑论坛的帖子
    ;; atomic-chrome

	;; 自动保存文件
    auto-save-buffers-enhanced
    ))

;; (defun zx-misc/init-atomic-chrome()
;;   (use-package atomic-chrome
;;     :config
;;     (atomic-chrome-start-server)
;;     (setq atomic-chrome-default-major-mode 'markdown-mode)
;;     (setq atomic-chrome-url-major-mode-alist
;;           '(("github\\.com" . gfm-mode)
;;             ("redmine" . textile-mode)))
;;     (setq atomic-chrome-buffer-open-style 'frame)
;;     ))

(defun zx-misc/init-auto-save-buffers-enhanced ()
  (use-package auto-save-buffers-enhanced
    :config
    (auto-save-buffers-enhanced t)
    ;; (setq auto-save-buffers-enhanced-include-regexps '(".+"))
    (setq auto-save-buffers-enhanced-exclude-regexps '(".gpg$"))
    (setq auto-save-buffers-enhanced-quiet-save-p t)
))

