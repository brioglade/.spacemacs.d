
(defun spacemacs//zx-search-source (engines)
  "return a source for helm selection"
  `((name . "Search Engines")
    (candidates . ,(mapcar (lambda (engine)
                             (cons (plist-get (cdr engine) :name)
                                   (intern (format "engine/search-%S"
                                                   (car engine)))))
                           engines))
    (action . (lambda (candidate) (call-interactively candidate)))))

(defun spacemacs/helm-zx-search-select ()
  "Set search engine to use with helm."
  (interactive)
  (helm :sources (list (spacemacs//zx-search-source
                        zx-search-alist))))

(defun spacemacs/ivy-zx-search-select ()
  "Set search engine to use with ivy."
  (interactive)
  (ivy-read "Search Engines: "
            (mapcar (lambda (engine)
                      (cons (plist-get (cdr engine) :name)
                            (intern (format "engine/search-%S"
                                            (car engine)))))
                    zx-search-alist)
            :action (lambda (candidate) (call-interactively (cdr candidate)))))

(defun spacemacs/zx-search-select ()
  "Set search engine to use."
  (interactive)
  (if (configuration-layer/layer-usedp 'ivy)
      (call-interactively 'spacemacs/ivy-zx-search-select)
    (call-interactively 'spacemacs/helm-zx-search-select)))
