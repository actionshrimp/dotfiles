(evil-define-key 'visual evil-surround-mode-map "s" 'evil-substitute)
(evil-define-key 'visual evil-surround-mode-map "S" 'evil-surround-region)

(define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

(define-key company-active-map (kbd "C-w") 'evil-delete-backward-word)
(define-key isearch-mode-map (kbd "C-w") 'isearch-exit)
(dolist (m (list minibuffer-local-map))
  (define-key m (kbd "C-w") 'backward-kill-word))
