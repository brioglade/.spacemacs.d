
(with-eval-after-load 'org

  ;; (setq org-ref-open-pdf-function
  ;;	(lambda (fpath)
  ;;	  (start-process "zathura" "*helm-bibtex-zathura*" "/usr/bin/zathura" fpath)))

  (add-to-list 'org-ref-clean-bibtex-entry-hook 'orcb-year-author-doi t)

  ;; open pdf with system pdf viewer (works on mac)
  ;; (setq bibtex-completion-pdf-open-function
  ;;       (lambda (fpath)
  ;;         (start-process "open" "*open*" "open" fpath)))

  ;; alternative
  (setq bibtex-completion-pdf-open-function 'helm-open-file-with-default-tool)

  )
