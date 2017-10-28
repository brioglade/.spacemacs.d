
(defun wttr/prepend-to-exec-path (path)
  "prepand the path to the emacs intenral `exec-path' and \"PATH\" env variable.
Return the updated `exec-path'"
  (setenv "PATH" (concat (expand-file-name path)
                         path-separator
                         (getenv "PATH")))
  (setq exec-path
        (cons (expand-file-name path)
              exec-path)))

(mapc #'wttr/prepend-to-exec-path
      (reverse ( list
				 "~/rg/"
                 "~/texlive/bin/win32/"
                 )))


