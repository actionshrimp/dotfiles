;; In order to work properly, we need to load evil-leader-mode before we load
;; evil-mode.
(use-package evil-leader
  :commands (evil-leader-mode global-evil-leader-mode)
  :ensure evil-leader
  :demand evil-leader
  :init
  (progn
    (evil-leader/set-leader ",")
    (global-evil-leader-mode t)))

;; Here's what we've all been waiting for.
;; Recreate Vim inside Emacs.
(use-package evil
  :ensure evil
  :config
  (progn
    (evil-mode 1)
    (setq evil-want-C-u-scroll t)
    (setq evil-want-C-w-in-emacs-state t)
    (setq evil-search-module        'isearch)
    (setq evil-magic                'very-magic)
    (setq evil-emacs-state-cursor   '("#dfaf8f" box))
    (setq evil-normal-state-cursor  '("#f8f893" box))
    (setq evil-insert-state-cursor  '("#f8f893" box))
    (setq evil-replace-state-cursor '("#cc9393" box))
    (setq evil-want-fine-undo t)
    (setq evil-want-change-word-to-end t)

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
    (evil-set-initial-state 'esup-mode 'emacs)
    (evil-set-initial-state 'diff-mode 'emacs)
    (evil-set-initial-state 'term-mode 'emacs)
    (evil-set-initial-state 'multi-term-mode 'emacs)

    (use-package key-chord
      :ensure key-chord
      :diminish key-chord-mode
      :config
      (progn
        (key-chord-mode 1)))

    (define-key evil-insert-state-map (kbd "RET") 'evil-ret-and-indent)

    (use-package evil-paredit
      :ensure evil-paredit
      :commands evil-paredit-mode
      :init (add-hook 'paredit-mode-hook 'evil-paredit-mode)
      :config (progn
                (evil-define-key 'normal paredit-mode-map
                  ",<" 'paredit-backward-slurp-sexp
                  ",>" 'paredit-forward-slurp-sexp
                  ",S" 'paredit-splice-sexp
                  ",w" 'paredit-wrap-sexp)))
    ))

(use-package evil-jumper
  :ensure evil-jumper
  :init
  ;; C-i and C-o don't work unless we load it again like this ...
  (require 'evil-jumper))



(provide 'my-evil)
