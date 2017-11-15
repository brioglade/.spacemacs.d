
(mouse-avoidance-mode 'animate) ;; move the mouse cursor

(setq system-time-locale "C")

(when (eq system-type 'windows-nt)
  ;; (set-language-environment 'Chinese-GBK)
  (set-default 'process-coding-system-alist
			   '(("[pP][lL][iI][nN][kK]" gbk-dos . gbk-dos)
				 ("[cC][mM][dD][pP][rR][oO][xX][yY]" gbk-dos . gbk-dos)
				 ("[rR][gG]" utf-8-dos . gbk-dos)
				 ("[pP][tT]" utf-8-dos . gbk-dos)
				 ("[gG][iI][tT]" utf-8-dos . gbk-dos)
				 ("[sS][dD][cC][vV]" utf-8-dos . gbk-dos)
				 ))

  ;; JulyFinal from https://emacs-china.org/t/topic/2900/3
  ;; 设置垃圾回收，在Windows下，emacs25版本会频繁出发垃圾回收，所以需要设置
  (setq gc-cons-threshold (* 512 1024 1024))
  (setq gc-cons-percentage 0.5)
  (run-with-idle-timer 5 t #'garbage-collect)
  ;; 显示垃圾回收信息，这个可以作为调试用
  ;; (setq garbage-collection-messages t)
  )

;; 用空格替代TAB(nil) or not(t).
(setq-default indent-tabs-mode t)
;; 定义TAB的宽度为4个空格.
(setq-default default-tab-width 4)

(menu-bar-mode t)

(setq frame-title-format '(:eval (lx/layouts-for-title-bar)))


;; 下面是我自己的配置，可按需更改 -- zhixing
(setq default-directory (concat doc "Files/"))

(setq-default org-agenda-files (list (concat doc "Files/")))
(setq bookmark-default-file (concat misc "bookmarks"))

(add-hook 'after-init-hook '(lambda () (add-to-list 'auth-sources (concat files "MySpace/auth.gpg"))))

(with-eval-after-load 'org
  (setq org-ref-bibliography-notes (concat files "Research.org")
		org-ref-default-bibliography (list (concat files "BibLatex/research.bib")
										   (concat files "BibLatex/leader.bib")
										   (concat files "BibLatex/peptide.bib")
										   (concat files "BibLatex/experiments.bib")
										   (concat files "BibLatex/surface-potential.bib")
										   (concat files "BibLatex/temp.bib"))
		org-ref-pdf-directory (concat doc "Research/PDFs/PDFs/")
		))

(setq ispell-personal-dictionary (concat misc "aspell_en.pws"))

(setq cnfonts-profiles-directory (concat misc "cnfonts-profiles/"))
(setq cnfonts-profiles
	  '("normal" "org-mode" "paper"))

(setq-default abbrev-mode t)
(setq abbrev-file-name (concat misc "abbrev"))

(setq eshell-aliases-file (concat misc "eshell/alias"))
(setq eshell-directory-name (concat misc "eshell/"))

(setq purpose-layout-dirs (concat misc "layout/"))
(setq purpose-default-layout-file (concat misc "layout/"))
(setq spacemacs-layouts-directory (concat misc "layout/"))
(setq layouts-enable-autosave t)
;; (persp-load-state-from-file (concat misc "layout/zhixing"))

;; Open Specific Files
(defun zx-misc/Temp.org ()
  (interactive)
  (find-file (concat files "Temp.org")))

(defun zx-misc/Research.org ()
  (interactive)
  (find-file (concat files "Research.org")))

(setq gnus-default-directory (concat misc "Gnus/"))
(setq gnus-home-directory (concat misc "Gnus/"))
(setq gnus-dribble-directory (concat misc "Gnus/"))
(setq gnus-directory (concat misc "Gnus/News/"))
(setq gnus-article-save-directory (concat misc "Gnus/News/"))
(setq gnus-kill-files-directory (concat misc "Gnus/News/trash/"))
(setq gnus-agent-directory (concat misc "Gnus/News/agent/"))
(setq gnus-cache-directory (concat misc "Gnus/News/cache/"))
(setq gnus-cache-active-file (concat misc "Gnus/News/cache/active"))
(setq message-directory (concat misc "Gnus/Mail/"))
(setq message-auto-save-directory (concat misc "Gnus/Mail/drafts"))
(setq mail-source-directory (concat misc "Gnus/Mail/incoming"))
(setq nnmail-message-id-cache-file (concat misc "Gnus/.nnmail-cache"))
(setq nnml-newsgroups-file (concat misc "Gnus/Mail/newsgroup"))
(setq nntp-marks-directory (concat misc "Gnus/News/marks"))

(with-eval-after-load 'evil
  (evil-set-initial-state 'calendar-mode 'emacs)
  (evil-set-initial-state 'text-mode 'emacs)
  )

