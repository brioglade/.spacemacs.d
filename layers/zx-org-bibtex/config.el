
(with-eval-after-load 'org

  (setq org-ref-bibliography-notes (concat Misc "abc.org")
		org-ref-default-bibliography (list (concat Misc "abc.bib"))
		org-ref-pdf-directory (concat Misc "PDFs/"))
  ;; (setq org-ref-open-pdf-function
  ;;	(lambda (fpath)
  ;;	  (start-process "zathura" "*helm-bibtex-zathura*" "/usr/bin/zathura" fpath)))

  (add-to-list 'org-ref-clean-bibtex-entry-hook 'orcb-year-author-doi t)

  )
