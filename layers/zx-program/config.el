
(when (eq system-type 'windows-nt)

  (defun wttr/prepend-to-exec-path (path)
	"prepand the path to the emacs intenral `exec-path' and \"PATH\" env variable.
Return the updated `exec-path'"
	(setenv "PATH" (concat (expand-file-name path)
						   path-separator
						   (getenv "PATH")))
	(setq exec-path
		  (cons (expand-file-name path)
				exec-path)))

  ;; 下面是我自己的配置，可按需修改 -- zhixing
  (mapc #'wttr/prepend-to-exec-path
		(reverse ( list
				   (concat tools "rg/")
				   (concat tools "Git/bin/")
				   "c:/texlive/2017/bin/win32/"
				   "d:/Tools/ImageMagick/"
				   )))
  )
