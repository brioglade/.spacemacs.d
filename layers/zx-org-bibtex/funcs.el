
;; clean entries and set bibtexkey
(defun bibtex-clean-entries ()
  "Clean all bibtex entries in the buffer."
  (interactive)
  (goto-char (point-min))
  (let ((number 0))
    (save-restriction
      (bibtex-map-entries (lambda (_key _beg _end) (setq number (1+ number)))))
    (dotimes (i number)
      (org-ref-bibtex-next-entry 1)
      (org-ref-clean-bibtex-entry))))

(defun orcb-year-author-doi ()
  "Replace bibtex key using YYYY-Author-DOI format."
  (save-excursion
    (bibtex-narrow-to-entry)
    (bibtex-beginning-of-entry)
    (when (looking-at bibtex-entry-maybe-empty-head)
      (let ((key (bibtex-key-in-head))
            (year (bibtex-autokey-get-field "year"))
            (author (car (last (mapcar 'bibtex-autokey-demangle-name
                                       (split-string (bibtex-autokey-get-field "author")
                                                     "[ \t\n]+and[ \t\n]+")))))
            (doi (bibtex-autokey-get-field "doi")))
        (re-search-forward key nil t)
        (if (string= doi "")
            (replace-match
             (format "%s-%s"
                     year
                     (s-capitalize author)))
          (replace-match
           (format "%s-%s-%s"
                   year
                   (s-capitalize author)
                   (replace-regexp-in-string "/" "_" doi))))))))

