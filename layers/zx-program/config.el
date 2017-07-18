(defvar tools "c:/tc/tools/")

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
                 (concat tools "ag/")
                 (concat tools "pt/")
                 (concat tools "python3/")
                 (concat tools "wget/bin/")
                 (concat tools "pandoc/")
                 (concat tools "Aspell/bin/")
                 (concat tools "imagemagick/")
                 (concat tools "Git/bin/")
                 (concat tools "w3m/w3m/")
                 (concat tools "texlive/bin/win32/")
                 (concat tools "grep/bin/")
				 (concat tools "sdcv/")
                 )))

(custom-set-variables '(epg-gpg-program "c:/tc/Tools/GnuPG/gpg2.exe"))

