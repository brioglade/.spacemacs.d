
(setq gnus-select-method '(nntp "news.cn99.com"))

(setq user-full-name "zhixing")
(setq user-mail-address "zhixing2017@gmail.com")

(setq gnus-ignored-newsgroups "")

(setq gnus-secondary-select-methods
      '(
        (nnimap "zhixing2017"
                (nnimap-address "imap.gmail.com")
                (nnimap-server-port 993)
                (nnimap-stream ssl)
                )
		(nnimap "gmail1"
                (nnimap-address "imap.gmail.com")
                (nnimap-server-port 993)
                (nnimap-stream ssl)
                )
        (nnimap "gmail2"
                (nnimap-address "imap.gmail.com")
                (nnimap-server-port 993)
                (nnimap-stream ssl)
                )
        (nnimap "gmail3"
                (nnimap-address "imap.gmail.com")
                (nnimap-server-port 993)
                (nnimap-stream ssl)
                )
        (nnimap "yeah"
                (nnimap-address "imap.yeah.net")
                (nnimap-server-port 993)
                (nnimap-stream ssl)
                )
        (nnimap "qq1"
                (nnimap-address "imap.qq.com")
                (nnimap-server-port 993)
                (nnimap-stream ssl)
                )
        (nnimap "qq2"
                (nnimap-address "imap.qq.com")
                (nnimap-server-port 993)
                (nnimap-stream ssl)
                )
        (nnimap "sina1"
                (nnimap-address "imap.sina.com")
                (nnimap-server-port 993)
                (nnimap-stream ssl)
                )
        (nnimap "sina2"
                (nnimap-address "imap.sina.com")
                (nnimap-server-port 993)
                (nnimap-stream ssl)
                )
        ))
