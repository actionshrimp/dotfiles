(setq evil-want-C-u-scroll t)
(setq evil-want-C-w-in-emacs-state t)
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

    (evil-set-initial-state 'flycheck-error-list-mode 'normal)
    (evil-set-initial-state 'git-commit-mode 'insert)
    (evil-set-initial-state 'shell-mode 'emacs)
    (evil-set-initial-state 'eshell-mode 'emacs)
    (evil-set-initial-state 'esup-mode 'emacs)
    (evil-set-initial-state 'diff-mode 'emacs)
    (evil-set-initial-state 'term-mode 'emacs)
    (evil-set-initial-state 'multi-term-mode 'emacs)

    (define-key evil-visual-state-map (kbd ",c") 'comment-region)
    (evil-define-key 'normal global-map
      "]b" 'my-next-user-buffer
      "[b" 'my-previous-user-buffer)

    (use-package evil-paredit
      :ensure evil-paredit
      :commands evil-paredit-mode
      :init (add-hook 'paredit-mode-hook 'evil-paredit-mode)
      :config (progn
                (evil-define-key 'normal paredit-mode-map
                  ",<" 'paredit-backward-slurp-sexp
                  ",>" 'paredit-forward-slurp-sexp
                  ",S" 'paredit-splice-sexp
                  ",W" 'paredit-wrap-sexp
                  ",w(" 'paredit-wrap-round
                  ",w[" 'paredit-wrap-square
                  ",w{" 'paredit-wrap-curly)
                (evil-define-key 'visual paredit-mode-map
                  ",W" 'paredit-wrap-round
                  ",w(" 'paredit-wrap-round
                  ",w[" 'paredit-wrap-square
                  ",w{" 'paredit-wrap-curly)))
    ))

(use-package evil-jumper
  :ensure evil-jumper
  :init
  ;; C-i and C-o don't work unless we load it again like this ...
  (require 'evil-jumper))


(provide 'my-evil)
