
(defconst zx-english-packages
  '(
    flyspell-correct

	youdao-dictionary
    bing-dict

	chinese-yasdcv
	sdcv

	))

(defun zx-english/post-init-flyspell-correct ()
  (use-package flyspell-correct
    :config
    (progn
      (setq ispell-list-command "--list")
      (setq ispell-silently-savep t)
      (require 'flyspell-correct-ido)
      (setq flyspell-correct-interface #'flyspell-correct-ido)
	  (define-key global-map (kbd "C-;") 'flyspell-correct-word-generic)
      )))

(defun zx-english/init-youdao-dictionary()
  (use-package youdao-dictionary
    :config
    (define-key global-map (kbd "C-c y") 'youdao-dictionary-search-at-point+)
    (spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+)
    ))

(defun zx-english/init-bing-dict()
  (use-package bing-dict
    :config
    (setq bing-dict-pronunciation-style 'us)
    (spacemacs/set-leader-keys "od" 'bing-dict-brief)
    ))

(defun zx-english/init-chinese-yasdcv()
  (use-package chinese-yasdcv
	:config
	(require 'chinese-yasdcv)

	(setq yasdcv-sdcv-command "sdcv --non-interactive --utf8-output --utf8-input --use-dict \"%dict\" \"%word\"")

	(setq yasdcv-sdcv-dicts
		  '(("Longman Dictionary of Contemporary English" "Merrian Webster 10th dictionary" t)
		))
	))

(defun zx-english/init-sdcv()
  (use-package sdcv
	:config
	(setq sdcv-dictionary-simple-list        ;; a simple dictionary list
		  '(
			"Longman Dictionary of Contemporary English"
			"Merrian Webster 10th dictionary"
			"Oxford Advanced Learner's Dictionary"
			))
	(setq sdcv-dictionary-complete-list      ;; a complete dictionary list
		  '(
			"Longman Dictionary of Contemporary English"
			"Merrian Webster 10th dictionary"
			"Oxford Advanced Learner's Dictionary"
			))
	))

