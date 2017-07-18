
(defun evil-toggle-input-method ()
  "when toggle on input method, goto evil-insert-state. "
  (interactive)

  ;; load IME when needed, less memory footprint
  (unless (featurep 'chinese-pyim)
    (require 'chinese-pyim))

  ;; some guy don't use evil-mode at all
  (cond
   ((and (boundp 'evil-mode) evil-mode)
    ;; evil-mode
    (cond
     ((eq evil-state 'insert)
      (toggle-input-method))
     (t
      (evil-insert-state)
      (unless current-input-method
        (toggle-input-method))))
    (if current-input-method (message "IME on!")))
   (t
    ;; NOT evil-mode
    (toggle-input-method))))

(defadvice evil-insert-state (around evil-insert-state-hack activate)
  ad-do-it
  (if current-input-method (message "IME on!")))

(global-set-key (kbd "C-\\") 'evil-toggle-input-method)
;; }}

(defvar my-pyim-directory
  (concat Misc)
  "There directory of peronsal dictionaries for chinese-pyim.")

(add-to-list 'auto-mode-alist '("\\.pyim\\'" . text-mode))

(defun my-pyim-personal-dict (&optional dict-name)
  (file-truename (concat (file-name-as-directory my-pyim-directory)
                         (or dict-name "personal"))))

(defun my-pyim-export-dictionary ()
  "Export words you use in chinese-pyim into personal dictionary."
  (interactive)
  (with-temp-buffer
    (maphash
     #'(lambda (key value)
         ;; only export two character word
         (if (string-match "-" key)
             (insert (concat key
                             " "
                             (mapconcat #'identity value ""))
                     "\n")))
     pyim-dcache-icode2word)
    (unless (and my-pyim-directory
                 (file-directory-p my-pyim-directory))
      (setq my-pyim-directory
            (read-directory-name "Personal Chinese dictionary directory:")))
    (if my-pyim-directory
        (write-file (my-pyim-personal-dict)))))

