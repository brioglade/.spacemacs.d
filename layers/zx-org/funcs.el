
;; Xu Chunyang shared this https://emacs-china.org/t/topic/3437
(defun chunyang-org-babel-highlight-result ()
  "Highlight the result of the current source block.
Adapt from `org-babel-remove-result'."
  (interactive)
  (let ((location (org-babel-where-is-src-block-result nil nil)))
    (when location
      (save-excursion
        (goto-char location)
        (when (looking-at (concat org-babel-result-regexp ".*$"))
          (pulse-momentary-highlight-region
           (1+ (match-end 0))
           (progn (forward-line 1) (org-babel-result-end))))))))

(add-hook 'org-babel-after-execute-hook
          (defun chunyang-org-babel-highlight-result-maybe ()
            (when (eq this-command 'org-ctrl-c-ctrl-c)
              (chunyang-org-babel-highlight-result))))
