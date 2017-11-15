;; mode-line setup
(setq evil-normal-state-tag (propertize "[N]" 'face '((:background "DarkGoldenrod2" :foreground "black")))
      evil-emacs-state-tag (propertize "[E]" 'face '((:background "SkyBlue2" :foreground "black")))
      evil-insert-state-tag (propertize "[I]" 'face '((:background "DarkGoldenrod2") :foreground "white"))
      evil-hybrid-state-tag (propertize "[H]" 'face '((:background "SkyBlue2") :foreground "white"))
      evil-motion-state-tag (propertize "[M]" 'face '((:background "plum3") :foreground "white"))
      evil-visual-state-tag (propertize "[V]" 'face '((:background "gray" :foreground "black")))
      evil-operator-state-tag (propertize "[O]" 'face '((:background "purple"))))

(setq-default mode-line-format
  (list
   " %1"
    '(:eval (propertize (winum-get-number-string) 'face '(:foreground "white")))
    " %1"
    ;; the buffer name; the file name as a tool tip
    '(:eval (propertize "%b " 'face '(:foreground "green")
        'help-echo (buffer-file-name)))
    ;; relative position and size
    (propertize "[%p/%I] " 'face '(:foreground "white"))
    ;; the current major mode for the buffer.
    '(:eval (propertize "[%m" 'face '(:foreground "white")
              'help-echo buffer-file-coding-system))
    ;; insert vs overwrite mode, input-method in a tooltip
    ;; '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
    ;;           'face nil
    ;;           'help-echo (concat "Buffer is in "
    ;;                        (if overwrite-mode "overwrite" "insert") " mode")))
    ;; was this buffer modified since the last save?
    '(:eval (when (buffer-modified-p)
              (concat ","  (propertize "Mod"
                             'face '(:foreground "red")
                             'help-echo "Buffer has been modified"))))
    ;; is this buffer read-only?
    ;; '(:eval (when buffer-read-only
    ;;           (concat ","  (propertize "RO"
    ;;                          'face nil
    ;;                          'help-echo "Buffer is read-only"))))
    (propertize "]" 'face '(:foreground "white"))
    ;; '(vc-mode vc-mode)
    " "
    ;; date and time
    '(:eval (propertize (format-time-string "%a ") 'face '(:foreground "green")))
    '(:eval (propertize (format-time-string "%b %d %Y ") 'face '(:foreground "white")))
    '(:eval (propertize (format-time-string "%H:%M ") 'face '(:foreground "green")))
    ;; evil state tags
    '(:eval (evil-generate-mode-line-tag evil-state))
    ;;global-mode-string, org-timer-set-timer in org-mode need this
    (propertize "%M" 'face nil)
	" "
	'(current-input-method (:propertize (" " current-input-method-title " ")))
    " --"
    "%-" ;; fill with '-'
    ))

