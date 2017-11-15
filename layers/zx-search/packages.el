(setq zx-search-packages
  '(
    engine-mode
    ))

(defun zx-search/init-engine-mode ()
  (use-package engine-mode
    :commands (defengine spacemacs/zx-search-select)
    :defines zx-search-alist
    :init
    (progn
      (spacemacs/set-leader-keys
        "a/" 'spacemacs/zx-search-select)
      (setq zx-search-alist
            '(
              (google
               :name "1-Google"
               :url "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s")
              (baidu
               :name "2-baidu"
               :url "http://www.baidu.com/s?wd=%s&ie=utf-8")
              (bing
               :name "3-Bing"
               :url "http://www.bing.com/search?q=%s")
			  (google-scholar
               :name "4-google-scholar"
               :url "http://scholar.google.com/scholar?&q=%s")
			  (google-images
               :name "Google Images"
               :url "http://www.google.com/images?hl=en&source=hp&biw=1440&bih=795&gbv=2&aq=f&aqi=&aql=&oq=&q=%s")
              (google-maps
               :name "Google Maps"
               :url "http://maps.google.com/maps?q=%s")
              (wikipedia
               :name "Wikipedia"
               :url "http://www.wikipedia.org/search-redirect.php?language=en&go=Go&search=%s")
			  (cnki-scholar
               :name "ciki-scholar"
               :url "http://scholar.cnki.net/result.aspx?q=%s")
              (wanfang
               :name "Wanfang"
               :url "http://s.g.wanfangdata.com.cn/Paper.aspx?q=%s")
              (sci-hub
               :name "sci-hub"
               :url "http://scholar.google.com.secure.sci-hub.org/scholar?q=%s")
              (project-gutenberg
               :name "Project Gutenberg"
               :url "http://www.gutenberg.org/ebooks/search.html/?format=html&default_prefix=all&sort_order=&query=%s")

              (stack-overflow
               :name "Stack Overflow"
               :url "https://stackoverflow.com/search?q=%s")
              (spacemacs-issues
               :name "Spacemacs Issues"
               :url "https://github.com/syl20bnr/spacemacs/issues?utf8=%%E2%%9C%%93&q=is%%3Aissue+is%%3Aopen+%s")
              (github
               :name "github"
               :url "https://github.com/search?q=%s")

              (amazon
               :name "Amazon"
               :url "http://www.amazon.com/s/ref=nb_sb_noss?url=search-alias%%3Daps&field-keywords=%s")
              (taobao
               :name "Taobao"
               :url "http://s.taobao.com/search?q=%s")
              (tmall
               :name "Tmall"
               :url "http://list.tmall.com/search_product.htm?q=%s&type=p")
              (jingdong
               :name "Jingdong"
               :url "http://search.jd.com/Search?keyword=%s&enc=utf-8")
              (dangdang
               :name "Dangdang"
               :url "http://search.dangdang.com/search.php?key=%s")

              (youtube
               :name "YouTube"
               :url "http://www.youtube.com/results?aq=f&oq=&search_query=%s")
              (bilibili
               :name "bilibili"
               :url "http://www.bilibili.tv/search?keyword=%s")
              (acfan
               :name "acfan"
               :url "http://www.acfun.tv/search.aspx#query=%s")
              (renrenyingshi
               :name "renren"
               :url "http://www.yyets.com/search/index?keyword=%s")

              (firefox-addon
               :name "Firefoxaddon"
               :url "https://addons.mozilla.org/zh-cn/firefox/search/?q=%s")
              (chromestore
               :name "Chromestore"
               :url "https://chrome.google.com/webstore/search-extensions/%s?hl=zh-CN")
              (greasyfork
               :name "greasyfork"
               :url "https://greasyfork.org/scripts/search?q=%s")
              (userscripts
               :name "userscripts"
               :url "http://webextender.net/scripts/search?q=%s")
              ))
      (dolist (engine zx-search-alist)
        (let ((func (intern (format "engine/search-%S" (car engine)))))
          (autoload func "engine-mode" nil 'interactive))))
    :config
    (progn
      (engine-mode t)
      (dolist (engine zx-search-alist)
        (let* ((cur-engine (car engine))
               (engine-url (plist-get (cdr engine) :url)))
          (eval `(defengine ,cur-engine ,engine-url)))))))
