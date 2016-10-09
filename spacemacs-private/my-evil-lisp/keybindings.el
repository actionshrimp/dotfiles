(define-key evil-lisp-state-map (kbd "{") (evil-lisp-state-enter-command paredit-wrap-curly))
(define-key evil-lisp-state-map (kbd "}") (evil-lisp-state-enter-command paredit-wrap-curly))
(define-key evil-lisp-state-map (kbd "[") (evil-lisp-state-enter-command paredit-wrap-square))
(define-key evil-lisp-state-map (kbd "]") (evil-lisp-state-enter-command paredit-wrap-square))
(define-key evil-lisp-state-map (kbd "W") (evil-lisp-state-enter-command paredit-splice-sexp))
(define-key evil-lisp-state-map (kbd "k") (evil-lisp-state-enter-command sp-backward-up-sexp))
(define-key evil-lisp-state-map (kbd "h") (evil-lisp-state-enter-command sp-backward-sexp))
(define-key evil-lisp-state-map (kbd "j") (evil-lisp-state-enter-command sp-down-sexp))
(define-key evil-lisp-state-map (kbd "l") (evil-lisp-state-enter-command sp-next-sexp))

(define-key evil-lisp-state-map (kbd "x") 'evil-lisp-state-sp-kill-sexp)

(define-key evil-lisp-state-map (kbd "C") 'evil-sp-change-line)

(define-key evil-lisp-state-map (kbd "A") '(lambda ()
                                             (interactive)
                                             (evil-lisp-state-sp-end-of-sexp)
                                             (evil-lisp-state-evil-insert-state)))
