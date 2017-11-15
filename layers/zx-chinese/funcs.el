
;; Chinese-birthday setup from eshion (emacs-china.org)
(defun chinese-birthday (lunar-month lunar-day &optional year mark)
  (if year (let* ((d-date (diary-make-date lunar-month lunar-day year))
                  (a-date (calendar-absolute-from-gregorian d-date))
                  (c-date (calendar-chinese-from-absolute a-date))
                  (cycle (car c-date))
                  (yy (cadr c-date))
                  (y (+ (* 100 cycle) yy)))
             (diary-chinese-anniversary lunar-month lunar-day y mark))
    (diary-chinese-anniversary lunar-month lunar-day year mark)))

(defun evil-toggle-input-method ()
  "when toggle on input method, goto evil-insert-state. "
  (interactive)

  ;; load IME when needed, less memory footprint
  (unless (featurep 'pyim)
    (require 'pyim))

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

;; }}

(defvar my-pyim-directory
  (concat misc "WubiLexicon/")
  "There directory of peronsal dictionaries for chinese-pyim.")

(add-to-list 'auto-mode-alist '("\\.pyim\\'" . text-mode))

(defun my-pyim-personal-dict (&optional dict-name)
  (file-truename (concat (file-name-as-directory my-pyim-directory)
                         (or dict-name "NewCentryWubiForEmacs.pyim"))))

