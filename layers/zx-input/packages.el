
(defconst zx-input-packages
  '(
    chinese-pyim
    ))

(defun zx-input/init-chinese-pyim()
  (use-package chinese-pyim
    :config
	;; use western punctuation (ban jiao fu hao)
	(setq pyim-punctuation-dict nil)
	;; always input English when isearch
	(setq pyim-isearch-enable-pinyin-search t)
    (setq default-input-method "chinese-pyim")
    (setq pyim-default-scheme 'wubi)
    (setq pyim-page-style 'vertical)
    (define-key pyim-mode-map ";" '(lambda ()
                                     (interactive)
                                     (pyim-page-select-word-by-number 2)))
    (define-key pyim-mode-map "'" '(lambda ()
                                     (interactive)
                                     (pyim-page-select-word-by-number 3)))
	(if (and my-pyim-directory
			 (file-exists-p (my-pyim-personal-dict)))
		(add-to-list 'pyim-dicts (list :name "personal" :file (my-pyim-personal-dict))))
	;; don't use tooltip
	(setq pyim-use-tooltip 'popup)
    ))
