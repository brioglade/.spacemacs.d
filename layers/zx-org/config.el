
(with-eval-after-load 'org

  ;; delete whitespaces
  ;; (add-hook 'org-mode-hook 'whitespace-mode)
  ;; (add-hook 'before-save-hook 'delete-trailing-whitespace)
  (add-hook 'org-mode-hook 'auto-fill-mode)
  ;; (setq next-line-add-newlines t)
  ;; auto truncate lines
  (add-hook 'org-mode-hook
            (lambda () (setq truncate-lines nil)))

  (setq-default word-wrap t)
  (setq org-startup-indented t)
  (setq org-completion-use-ido t
        org-hide-emphasis-markers t
        org-catch-invisible-edits 'show
        ;; org-fast-tag-selection-single-key 'expert
        org-edit-timestamp-down-means-later t
        org-agenda-start-day "-5d"
        org-agenda-span 21
        org-agenda-include-diary t
        org-agenda-window-setup 'current-window
        org-tags-column 60
        org-agenda-inhibit-startup nil
        org-pretty-entities t
        org-agenda-use-tag-inheritance t
		org-use-sub-superscripts '{}
		org-pretty-entities-include-sub-superscripts t
        )
  (org-agenda-to-appt)

  (setq org-todo-keywords
		'(
		  (sequence "TODO(t)" "DOING(i!)" "HANGUP(h!)" "|" "DONE(d!)" "CANCELLED(c!)" )
		  ))

  (setq org-columns-default-format "%20ITEM %TODO %3PRIORITY %TAGS %DATE %COST{+}")

  ;; 文学编程
  (setq org-confirm-babel-evaluate nil
        org-src-fontify-natively t
        org-src-tab-acts-natively t)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (emacs-lisp . t)
     (shell      . t)
     (latex      . t)
     (matlab     . t)
     (dot        . t)
     (ledger     . t)
     (calc       . t)
     ))

  ;; set the end of Chinese sentence
  (setq sentence-end "\\([¡££¡£¿]\\|¡¡\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
  (setq sentence-end-double-space nil)

  )
