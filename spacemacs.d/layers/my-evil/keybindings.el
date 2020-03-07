;;(define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
(define-key evil-insert-state-map (kbd "DEL") 'evil-delete-backward-char)
(define-key evil-insert-state-map (kbd "C-w") 'evil-delete-backward-word)


;; (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
;; (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
;; (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
;; (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

;;(define-key company-active-map (kbd "C-w") 'evil-delete-backward-word)
(define-key isearch-mode-map (kbd "C-w") 'isearch-exit)
(dolist (m (list minibuffer-local-map))
  (define-key m (kbd "C-w") 'backward-kill-word))

(evil-ex-define-cmd "W" "write")
(evil-ex-define-cmd "Q" "q")

(spacemacs/set-leader-keys "w SPC" 'ace-window)

(add-hook 'helm-after-initialize-hook
          (lambda ()
            (dolist (m (list helm-map
                             helm-grep-map))
              (define-key m (kbd "C-w") 'backward-kill-word))))

(define-key evil-insert-state-map (kbd "C-x C-l") 'company-hippie-line)

(define-key evil-normal-state-map (kbd "R") 'evil-multiedit-match-all)
(define-key evil-normal-state-map (kbd "M-n") 'evil-multiedit-match-and-next)
(define-key evil-normal-state-map (kbd "M-p") 'evil-multiedit-match-and-prev)

(define-key evil-visual-state-map (kbd "R") 'evil-multiedit-match-all)
(define-key evil-visual-state-map (kbd "M-n") 'evil-multiedit-match-and-next)
(define-key evil-visual-state-map (kbd "M-p") 'evil-multiedit-match-and-prev)
