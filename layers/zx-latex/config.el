
(setq TeX-PDF-mode t)
(setq TeX-source-correlate-mode t)
(setq TeX-source-correlate-method 'synctex)

;; 需要设置SumatraPDF和emacsclientw的路径 -- zhixing
(setq TeX-view-program-list
	  '(("Sumatra PDF" ("\"d:/Tools/Sumatrapdf/SumatraPDF.exe\" -reuse-instance"
						(mode-io-correlate " -forward-search %b %n -inverse-search \"d:/Tools/Emacs/bin/emacsclientw.exe -n +%%l %%f\"") " %o"))))

(eval-after-load 'tex
  '(progn
	 (assq-delete-all 'output-pdf TeX-view-program-selection)
	 (add-to-list 'TeX-view-program-selection '(output-pdf "Sumatra PDF"))))
;; ctrl+shitf 从pdf跳回emacs
(add-hook 'LaTeX-mode-hook
		  #'(lambda ()
			  (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex --synctex=1%(mode)%' %t" TeX-run-TeX nil t))
			  (setq TeX-command-extra-options "-file-line-error -shell-escape")
			  (setq TeX-command-default "XeLaTeX")
			  (setq TeX-save-query nil) ;; 这一行不用确认保存就开始执行编译；
			  ))

(setq TeX-view-program-selection '(((output-dvi style-pstricks) "dvips and start") (output-dvi "Yap") (output-pdf "SumatraPDF") (output-html "start")))

(setq TeX-output-view-style '(
							  ("^dvi$" "^pstricks$\\|^pst-\\|^psfrag$" "dvips %d -o && start \"\" %f")
							  ("^dvi$" "." "yap -1 %dS %d")

							  ;; 需要设置 SumatraPDF 的路径 -- zhixing
							  ("^pdf$" "." "d:/Tools/SumatraPDF/SumatraPDF.exe -reuse-instance \"\" %o")
							  ("^html?$" "." "start \"\" %o")))

(setq TeX-source-correlate-start-server t)
;; 相当关键, pdf调回的成败在此一句

(add-hook 'LaTeX-mode-hook
		  (lambda () (local-set-key (kbd "<S-mouse-3>") #'TeX-view)) ;shift+鼠标右键
		  )
