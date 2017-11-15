(with-eval-after-load 'org
  (add-to-list 'org-latex-classes
			   '(
				 "zx-article"
				 "\\documentclass[12pt]{article}
				  [NO-DEFAULT-PACKAGES]
				  %中文设置
				  \\usepackage{fontspec}
				  \\usepackage{xeCJK}
				  \\setmainfont[Mapping=tex-text]{Times New Roman}
				  \\setsansfont[Mapping=tex-text]{Arial}
				  \\setmonofont{Source Code Pro}
				  \\setCJKmainfont[BoldFont=STXihei,ItalicFont=Microsoft YaHei]{SimSun}
				  \\setCJKsansfont{STXihei}
				  \\setCJKmonofont{Microsoft YaHei}
				  \\punctstyle{hangmobanjiao}
				  % 中文断行
				  \\XeTeXlinebreaklocale \"zh\"
				  \\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt
				  %图片支持
				  \\usepackage{graphicx}
				  %页面调整
				  \\usepackage[a4paper,left=2cm,right=2cm,top=1.5cm,bottom=1.5cm]{geometry}
				  %超链接
				  \\usepackage[colorlinks,linkcolor=black,anchorcolor=black,citecolor=black]{hyperref}
				  %数学符号
				  \\usepackage{amsmath}
				  %首行缩进
				  \\usepackage{indentfirst}
				  % 公式中的粗体字符
				  \\usepackage{bm}
				  %代码排版
				  \\usepackage{listings}
				  % 代码设置
				  \\lstset{
				  %行号
				  numbers=left,
				  %背景框
				  framexleftmargin=10mm,
                  frame=none,
                  %背景色
                  %backgroundcolor=\\color[rgb]{1,1,0.76},
                  backgroundcolor=\\color[RGB]{245,245,244},
                  %样式
                  keywordstyle=\\bf\\color{blue},
                  identifierstyle=\\bf,
                  numberstyle=\\color[RGB]{0,192,192},
                  commentstyle=\\it\\color[RGB]{0,96,96},
                  stringstyle=\\rmfamily\\slshape\\color[RGB]{128,0,0},
                  %显示空格
                  showstringspaces=true
                  }
                  "
				 ("\\section{%s}" . "\\section*{%s}")
				 ("\\subsection{%s}" . "\\subsection*{%s}")
				 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
				 ("\\paragraph{%s}" . "\\paragraph*{%s}")
				 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
				 ))

  (setq org-preview-latex-default-process 'dvisvgm)
  (setq org-format-latex-options (quote
								  (:foreground default :background default :scale 2.0
											   :html-foreground "Black" :html-background "Transparent" :html-scale 2.0
											   :matchers ("begin" "$1" "$" "$$" "\\(" "\\["))))

  (setq org-latex-default-class "zx-article")
  (setq org-latex-pdf-process
		'(
		  "xelatex -interaction nonstopmode -output-directory %o %f"
		  "bibtex %b"
		  "xelatex -interaction nonstopmode -output-directory %o %f"
		  "xelatex -interaction nonstopmode -output-directory %o %f"
		  ))
  (setq org-preview-latex-image-directory "Images/ltximg/")

  )
