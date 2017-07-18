(defconst zx-fonts-packages
  '(
    chinese-fonts-setup
    ))

(defun zx-fonts/init-chinese-fonts-setup ()
  (use-package chinese-fonts-setup
    :config
    (chinese-fonts-setup-enable)
    (add-hook 'after-make-frame-functions #'cfs-set-font-with-saved-step)
    (setq cfs-profiles-directory (concat Misc "cfs-profiles/"))
    (setq cfs-profiles
          '("normal" "org-mode" "paper"))
    ))


