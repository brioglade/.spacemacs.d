
(when (eq system-type 'windows-nt)

  ;; 使用 Irfanview 来截图, picpick 来添加标注 -- zhixing
  (defun zx-org/capture-emacs ()
	(interactive)
	;; (lower-frame)
	(let ((imagename (concat (format-time-string "%Y-%m-%d_%H-%M-%S") ".jpg"))
		  (imagepath (concat (file-name-directory buffer-file-name) "Images/" (file-name-sans-extension (buffer-name)) "-img/"))
		  (shortpath (concat "Images/" (file-name-sans-extension (buffer-name)) "-img/"))

		  (irfanview (concat tools "IrfanView/i_view32.exe"))
		  (picpick (concat tools "picpick/picpick.exe")))

	  (shell-command (concat " "irfanview" /capture=4 /convert=" "\"" imagepath (format "\\%s\"" imagename)))
	  (insert (concat "#+ATTR_ORG: :width 300\n"  "[[File:" shortpath imagename "]]"))
	  (org-redisplay-inline-images)
	  ))

  (defun zx-org/capture ()
	(interactive)
	(lower-frame)
	(let ((imagename (concat (format-time-string "%Y-%m-%d_%H-%M-%S") ".jpg"))
		  (imagepath (concat (file-name-directory buffer-file-name) "Images/" (file-name-sans-extension (buffer-name)) "-img/"))
		  (shortpath (concat "Images/" (file-name-sans-extension (buffer-name)) "-img/"))

		  (irfanview (concat tools "IrfanView/i_view32.exe"))
		  (picpick (concat tools "picpick/picpick.exe")))

	  (shell-command (concat " "irfanview" /capture=4 /convert=" "\"" imagepath (format "\\%s\"" imagename)))
	  (insert (concat "#+ATTR_ORG: :width 300\n"  "[[File:" shortpath imagename "]]"))
	  (org-redisplay-inline-images)
	  ))

  (defun zx-org/capture-edit ()
	(interactive)
	(lower-frame)
	(let ((imagename (concat (format-time-string "%Y-%m-%d_%H-%M-%S") ".jpg"))
		  (imagepath (concat (file-name-directory buffer-file-name) "Images/" (file-name-sans-extension (buffer-name)) "-img/"))
		  (shortpath (concat "Images/" (file-name-sans-extension (buffer-name)) "-img/"))

		  (irfanview (concat tools "IrfanView/i_view32.exe"))
		  (picpick (concat tools "picpick/picpick.exe")))

	  (shell-command (concat " "irfanview" /capture=4 /convert=" "\"" imagepath (format "\%s\"" imagename)))
	  (shell-command (concat " "picpick" " imagepath (format "\%s\"" imagename)))
	  (insert (concat "#+ATTR_ORG: :width 300\n"  "[[File:" shortpath imagename "]]"))
	  (org-redisplay-inline-images)
	  ))

  (defun zx-org/delay-capture ()
	(interactive)
	(lower-frame)
	(sleep-for 5)
	(let ((imagename (concat (format-time-string "%Y-%m-%d_%H-%M-%S") ".jpg"))
		  (imagepath (concat (file-name-directory buffer-file-name) "Images/" (file-name-sans-extension (buffer-name)) "-img/"))
		  (shortpath (concat "Images/" (file-name-sans-extension (buffer-name)) "-img/"))

		  (irfanview (concat tools "IrfanView/i_view32.exe"))
		  (picpick (concat tools "picpick/picpick.exe")))

	  (shell-command (concat " "irfanview" /capture=4 /convert=" "\"" imagepath (format "\%s\"" imagename)))
	  (insert (concat "#+ATTR_ORG: :width 300\n"  "[[File:" shortpath imagename "]]"))
	  (org-redisplay-inline-images)
	  ))

  (defun zx-org/delay-capture-edit ()
	(interactive)
	(lower-frame)
	(sleep-for 5)
	(let ((imagename (concat (format-time-string "%Y-%m-%d_%H-%M-%S") ".jpg"))
		  (imagepath (concat (file-name-directory buffer-file-name) "Images/" (file-name-sans-extension (buffer-name)) "-img/"))
		  (shortpath (concat "Images/" (file-name-sans-extension (buffer-name)) "-img/"))

		  (irfanview (concat tools "IrfanView/i_view32.exe"))
		  (picpick (concat tools "picpick/picpick.exe")))

	  (shell-command (concat " "irfanview" /capture=4 /convert=" "\"" imagepath (format "\%s\"" imagename)))
	  ;; (shell-command (concat " "picpick" " imagepath (format "\%s\"" imagename)))
	  (insert (concat "#+ATTR_ORG: :width 300\n"  "[[File:" shortpath imagename "]]"))
	  (org-redisplay-inline-images)
	  ))

  )
