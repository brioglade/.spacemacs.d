
(with-eval-after-load 'org
  (setq-default org-agenda-files (list "~/Misc/Files/"))
  (setq diary-file "~/Misc/Files/diary")
  (setq bookmark-default-file "~/Misc/Files/bookmarks")

  (setq org-download-heading-lvl nil)
  (setq org-download-annotate-function 'ignore)

  (advice-add 'org-download-insert-link :after 'zx-org/delete-file)
  (setq org-download-method 'zx-org/org-download-method)

  ;; delete whitespaces
  ;; (add-hook 'before-save-hook 'delete-trailing-whitespace)
  ;; (add-hook 'org-mode-hook 'end-of-buffer)
  (add-hook 'org-mode-hook 'auto-fill-mode)
  ;; (add-hook 'org-mode-hook 'whitespace-mode)
  ;; (setq next-line-add-newlines t)
  ;; auto truncate lines
  (add-hook 'org-mode-hook
            (lambda () (setq truncate-lines nil)))

  (setq-default word-wrap t)
  (setq org-startup-indented t)
  (setq org-completion-use-ido t
        org-hide-emphasis-markers t
        org-catch-invisible-edits 'smart
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
        )
  (org-agenda-to-appt)

  (setq org-columns-default-format "%20ITEM %TODO %3PRIORITY %TAGS %DATE %COST{+}")

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

  ;; https://emacs.stackexchange.com/questions/12841/quickly-insert-source-blocks-in-org-mode
  (add-to-list 'org-structure-template-alist
			   '("C" "#+BEGIN_SRC calc \n ? \n#+END_SRC"))
  (add-to-list 'org-structure-template-alist
			   '("se" "#+BEGIN_SRC emacs-lisp \n ? \n#+END_SRC"))
  (add-to-list 'org-structure-template-alist
			   '("ao" "#+attr_org: " ""))
  (add-to-list 'org-structure-template-alist
			   '("al" "#+attr_latex: " ""))
  (add-to-list 'org-structure-template-alist
			   '("ca" "#+caption: " ""))
  (add-to-list 'org-structure-template-alist
			   '("ti" "#+title: " ""))

;; set the end of Chinese sentence
(setq sentence-end "\\([¡££¡£¿]\\|¡¡\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;; * Rescaling inline-images
;; Copied from https://github.com/jkitchin/scimax/blob/master/scimax-org.el
;; This will eventually be obsolete if this makes it into org-mode
(defvar org-inline-image-resize-function
  #'org-inline-image-resize
  "Function that takes a filename and resize argument and returns
 a new filename pointing to the resized image.")

(defun org-inline-image-resize (fname resize-options)
  "Resize FNAME with RESIZE-OPTIONS.
RESIZE-OPTIONS are passed to \"mogrify resized-fname -resize resize-options\".
RESIZE-OPTIONS could be:
N% to scale the image by a percentage.
N to set the width, keeping the aspect ratio constant.
xN to set the height, keeping the aspect ratio constant.
NxM! to set the width and height, ignoring the aspect ratio.
See http://www.imagemagick.org/Usage/resize/#resize for more options."
  (let* ((md5-hash (with-temp-buffer (insert-file-contents fname)
									 (insert (format "%s" resize-options))
									 (md5 (buffer-string))))
		 (resized-fname (concat (expand-file-name
								 md5-hash
								 temporary-file-directory)
								"."
								(file-name-extension fname)))
		 (cmd (format "mogrify -resize %s %s"
					  resize-options
					  resized-fname)))
    (if (not (executable-find "mogrify"))
		(progn
		  (message "No mogrify executable found. To eliminate this message, set  `org-inline-image-resize-function' to nil or install imagemagick from http://www.imagemagick.org/script/binary-releases.php")
		  fname)
      (unless (file-exists-p resized-fname)
		(copy-file fname resized-fname)
		(shell-command cmd))
      resized-fname)))

;; this is copied and modified from org.el
(defun org-display-inline-images (&optional include-linked refresh beg end)
  "Display inline images.
An inline image is a link which follows either of these
conventions:
  1. Its path is a file with an extension matching return value
     from `image-file-name-regexp' and it has no contents.
  2. Its description consists in a single link of the previous
     type.
When optional argument INCLUDE-LINKED is non-nil, also links with
a text description part will be inlined.  This can be nice for
a quick look at those images, but it does not reflect what
exported files will look like.
When optional argument REFRESH is non-nil, refresh existing
images between BEG and END.  This will create new image displays
only if necessary.  BEG and END default to the buffer
boundaries."
  (interactive "P")
  (when (display-graphic-p)
    (unless refresh
      (org-remove-inline-images)
      (when (fboundp 'clear-image-cache) (clear-image-cache)))
    (org-with-wide-buffer
     (goto-char (or beg (point-min)))
     (let ((case-fold-search t)
		   (file-extension-re (image-file-name-regexp)))
       (while (re-search-forward "[][]\\[\\(?:file\\|[./~]\\)" end t)
		 (let ((link (save-match-data (org-element-context))))
		   ;; Check if we're at an inline image.
		   (when (and (equal (org-element-property :type link) "file")
					  (or include-linked
						  (not (org-element-property :contents-begin link)))
					  (let ((parent (org-element-property :parent link)))
						(or (not (eq (org-element-type parent) 'link))
							(not (cdr (org-element-contents parent)))))
					  (org-string-match-p file-extension-re
										  (org-element-property :path link)))
			 (let ((file (expand-file-name
						  (org-link-unescape
						   (org-element-property :path link)))))
			   (when (file-exists-p file)
				 (let ((width
						;; Apply `org-image-actual-width' specifications.
						(cond
						 ((and (not (image-type-available-p 'imagemagick))
							   (not org-inline-image-resize-function))
						  nil)
						 ((eq org-image-actual-width t) nil)
						 ((listp org-image-actual-width)
						  (or
						   ;; First try to find a width among
						   ;; attributes associated to the paragraph
						   ;; containing link.
						   (let* ((paragraph
								   (let ((e link))
									 (while (and (setq e (org-element-property
														  :parent e))
												 (not (eq (org-element-type e)
														  'paragraph))))
									 e))
								  (attr_org (org-element-property :attr_org paragraph)))
							 (when attr_org
							   (plist-get
								(org-export-read-attribute :attr_org  paragraph) :width)))
						   ;; Otherwise, fall-back to provided number.
						   (car org-image-actual-width)))
						 ((numberp org-image-actual-width)
						  org-image-actual-width)))
					   (old (get-char-property-and-overlay
							 (org-element-property :begin link)
							 'org-image-overlay)))
				   (if (and (car-safe old) refresh)
					   (image-refresh (overlay-get (cdr old) 'display))

					 (when (and width org-inline-image-resize-function)
					   (setq file (funcall  org-inline-image-resize-function file width)
							 width nil))
					 (let ((image (create-image file
												(cond
												 ((image-type-available-p 'imagemagick)
												  (and width 'imagemagick))
												 (t nil))
												nil
												:width width)))
					   (when image
						 (let* ((link
								 ;; If inline image is the description
								 ;; of another link, be sure to
								 ;; consider the latter as the one to
								 ;; apply the overlay on.
								 (let ((parent
										(org-element-property :parent link)))
								   (if (eq (org-element-type parent) 'link)
									   parent
									 link)))
								(ov (make-overlay
									 (org-element-property :begin link)
									 (progn
									   (goto-char
										(org-element-property :end link))
									   (skip-chars-backward " \t")
									   (point)))))
						   (overlay-put ov 'display image)
						   (overlay-put ov 'face 'default)
						   (overlay-put ov 'org-image-overlay t)
						   (overlay-put
							ov 'modification-hooks
							(list 'org-display-inline-remove-overlay))
						   (push ov org-inline-image-overlays)))))))))))))))

;; * Enable and eps images in org-mode
(add-to-list 'image-file-name-extensions "eps")

(add-to-list 'image-type-file-name-regexps '("\\.eps\\'" . imagemagick))
(add-to-list 'image-file-name-extensions "eps")

)
