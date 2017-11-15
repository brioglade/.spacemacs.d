
(define-key evil-motion-state-map "gj" 'evil-next-line)
(define-key evil-motion-state-map "gk" 'evil-previous-line)
(define-key evil-motion-state-map "j" 'evil-next-visual-line)
(define-key evil-motion-state-map "k" 'evil-previous-visual-line)

(define-key global-map (kbd "C-c d") 'zx-misc/insert-time-string)
(define-key global-map (kbd "C-c D") 'zx-misc/insert-time-string-for-git)
(define-key global-map (kbd "C-x y") 'yas-expand)

(spacemacs/set-leader-keys "aa" 'appt-add)
(spacemacs/set-leader-keys "wo" 'delete-other-windows)
(spacemacs/set-leader-keys "obs" 'bookmark-set)
(spacemacs/set-leader-keys "obj" 'bookmark-jump)
(spacemacs/set-leader-keys "xe" 'eval-last-sexp)
(spacemacs/set-leader-keys "tt" 'spacemacs/toggle-transparency)
(spacemacs/set-leader-keys "qr" 'spacemacs/restart-emacs)
(spacemacs/set-leader-keys "qR" 'spacemacs/restart-emacs-resume-layouts)


(spacemacs/set-leader-keys "cl" 'zx-misc/clean)
(spacemacs/set-leader-keys "fet" 'zx-misc/Temp.org)
(spacemacs/set-leader-keys "fer" 'zx-misc/Research.org)
;; Program
;; (spacemacs/set-leader-keys "ofb" 'zx-misc/foobar)
;; (spacemacs/set-leader-keys "opp" 'zx-misc/PotPlayer)
