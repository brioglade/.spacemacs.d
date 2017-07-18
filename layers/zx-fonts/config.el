

(prefer-coding-system 'utf-8) ;;默认使用cp936
(setq process-coding-system-alist (cons '("git" . (utf-8 . utf-8)) process-coding-system-alist));;对git 的输入输入的编辑使用utf-8
(setq process-coding-system-alist (cons '("grep" . (utf-8 . utf-8)) process-coding-system-alist));;对git 的输入输入的编辑使用utf-8
(setq process-coding-system-alist (cons '("bash" . (utf-8 . utf-8)) process-coding-system-alist));对bash 的输入输入的编辑使用cp936
(setq process-coding-system-alist (cons '("diff" . (utf-8 . utf-8)) process-coding-system-alist));对bash 的输入输入的编辑使用cp936
(set-file-name-coding-system 'utf-8) ;;文件名的编辑 dired 中会用到
;; (setq-default buffer-file-coding-system 'utf-8) ;;buffer写文件时使用什么编码
;; ;; 以下两个测试中。
;; (set-terminal-coding-system 'utf-8)
;; (set-keyboard-coding-system 'utf-8)

