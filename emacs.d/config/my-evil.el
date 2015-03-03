(setq evil-want-C-u-scroll t)
(setq evil-search-module        'isearch)
(setq evil-magic                'very-magic)
(setq evil-emacs-state-cursor   '("#dfaf8f" box))
(setq evil-normal-state-cursor  '("#f8f893" box))
(setq evil-insert-state-cursor  '("#f8f893" box))
(setq evil-replace-state-cursor '("#cc9393" box))
(setq evil-want-change-word-to-end t)

(use-package evil
  :ensure evil
  :config (progn
    (evil-mode 1)
    (evil-ex-define-cmd "W" 'save-buffer)

    (evil-set-initial-state 'flycheck-error-list-mode 'normal)
    (evil-set-initial-state 'git-commit-mode 'insert)
    (evil-set-initial-state 'shell-mode 'emacs)
    (evil-set-initial-state 'eshell-mode 'emacs)
    (evil-set-initial-state 'erc-mode 'emacs)
    (evil-set-initial-state 'esup-mode 'emacs)
    (evil-set-initial-state 'diff-mode 'emacs)
    (evil-set-initial-state 'term-mode 'emacs)
    (evil-set-initial-state 'multi-term-mode 'emacs)
    (evil-set-initial-state 'help-mode 'emacs)

    (evil-define-key 'visual global-map
      (kbd ",c") 'comment-or-uncomment-region)
    (evil-define-key 'normal global-map
      (kbd ",c") '(lambda ()
                    (interactive)
                    (comment-or-uncomment-region
                     (line-beginning-position) (line-end-position))))

    (evil-define-key 'normal global-map
      "]b" 'my-next-user-buffer
      "[b" 'my-previous-user-buffer)

    (evil-define-key 'emacs global-map (kbd "C-w") 'backward-kill-word)
    (evil-define-key 'normal global-map (kbd "C-h") 'evil-window-left)
    (evil-define-key 'normal global-map (kbd "C-j") 'evil-window-down)
    (evil-define-key 'normal global-map (kbd "C-k") 'evil-window-up)
    (evil-define-key 'normal global-map (kbd "C-l") 'evil-window-right)
    (evil-define-key 'emacs global-map (kbd "C-h") 'evil-window-left)
    (evil-define-key 'emacs global-map (kbd "C-j") 'evil-window-down)
    (evil-define-key 'emacs global-map (kbd "C-k") 'evil-window-up)
    (evil-define-key 'emacs global-map (kbd "C-l") 'evil-window-right)
    (evil-define-key 'insert global-map (kbd "C-x C-l")
      (make-hippie-expand-function '(try-expand-line-all-buffers)))
    ))

(use-package evil-matchit
  :ensure evil-matchit
  :commands evilmi-jump-items
  :init
  (progn
    (setq global-evil-matchit-mode t)
    (define-key evil-normal-state-map "%" 'evilmi-jump-items)))

(use-package evil-surround
  :ensure evil-surround
  :config
  (progn
    (global-evil-surround-mode 1)))

(use-package evil-paredit
  :ensure evil-paredit
  :commands evil-paredit-mode
  :init (add-hook 'paredit-mode-hook 'evil-paredit-mode))

(use-package evil-jumper
  :ensure evil-jumper
  :init
  ;; C-i and C-o don't work unless we load it again like this ...
  (require 'evil-jumper))

(provide 'my-evil)
