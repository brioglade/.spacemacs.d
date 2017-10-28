
(defconst zx-chinese-packages
  '(
    cnfonts

    pyim

	pinyin-search
	chinese-conv

    cal-china-x
    ))

(defun zx-chinese/init-cnfonts ()
  (use-package cnfonts
    :config
    (cnfonts-enable)
    (add-hook 'after-make-frame-functions #'cnfonts-set-font-with-saved-step)
    (setq cnfonts-profiles
          '("normal" "org-mode" "paper"))
    ))

(defun zx-chinese/init-pyim()
  (use-package pyim
    :config
    (setq default-input-method "pyim")
    (setq pyim-default-scheme 'wubi)
	(if (and my-pyim-directory
			 (file-exists-p (my-pyim-personal-dict)))
		(add-to-list 'pyim-dicts (list :name "NewCentryWubiForEmacs" :file (my-pyim-personal-dict))))
	(add-hook 'emacs-startup-hook
			  #'(lambda () (pyim-restart-1 t)))
	(setq pyim-page-tooltip 'popup)
    (setq pyim-page-style 'vertical)
	(setq pyim-page-length 5)
    (define-key pyim-mode-map ";" '(lambda ()
                                     (interactive)
                                     (pyim-page-select-word-by-number 2)))
    (define-key pyim-mode-map "'" '(lambda ()
                                     (interactive)
                                     (pyim-page-select-word-by-number 3)))
	(setq pyim-punctuation-translate-p '(auto yes no))   ;中文使用全角标点，英文使用半角标点。
	))

(defun zx-chinese/init-pinyin-search()
  (use-package pinyin-search
	:config
	))

(defun zx-chinese/init-chinese-conv ()
  (use-package chinese-conv
    :config
	(setq chinese-conv-opencc-data (concat tools "opencc/"))
	))

(defun zx-chinese/init-cal-china-x ()
  (use-package cal-china-x
    :config
    (setq mark-holidays-in-calendar t)
    (setq holiday-wwliu-holidays
          '(
            ;; 节气
            (holiday-solar-term "小寒" "小寒")
            (holiday-solar-term "大寒" "大寒")
            (holiday-solar-term "立春" "立春")
            (holiday-solar-term "雨水" "雨水")
            (holiday-solar-term "惊蛰" "惊蛰")
            (holiday-solar-term "春分" "春分")
            (holiday-solar-term "清明" "清明节")
            (holiday-solar-term "谷雨" "谷雨")
            (holiday-solar-term "立夏" "立夏")
            (holiday-solar-term "小满" "小满")
            (holiday-solar-term "芒种" "芒种")
            (holiday-solar-term "夏至" "夏至")
            (holiday-solar-term "小暑" "小暑")
            (holiday-solar-term "大暑" "大暑")
            (holiday-solar-term "立秋" "立秋")
            (holiday-solar-term "处暑" "处暑")
            (holiday-solar-term "白露" "白露")
            (holiday-solar-term "秋分" "秋分")
            (holiday-solar-term "寒露" "寒露")
            (holiday-solar-term "霜降" "霜降")
            (holiday-solar-term "立冬" "立冬")
            (holiday-solar-term "小雪" "小雪")
            (holiday-solar-term "大雪" "大雪")
            (holiday-solar-term "冬至" "冬至")
            ))
    (setq cal-china-x-chinese-holidays holiday-wwliu-holidays)
    (setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
    (setq calendar-holidays cal-china-x-important-holidays)
    ))

