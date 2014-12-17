(use-package helm
  :ensure helm
  :idle
  :config (progn
            (define-key helm-map (kbd "C-w") 'backward-kill-word)
            ))

(use-package helm-projectile
  :ensure helm-projectile
  :idle
  :config (progn
            (setq projectile-completion-system 'helm)
            (helm-projectile-on)
            (projectile-global-mode)))

(set-face-attribute 'helm-selection nil :foreground (theme-color 'base2) :background (theme-color 'base02))
(set-face-attribute 'helm-source-header nil :foreground (theme-color 'yellow) :background (theme-color 'base02))

(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-M-x-fuzzy-match t)

(evil-define-key 'normal global-map (kbd "C-p") 'helm-projectile)
(define-key shell-mode-map (kbd "C-p") 'helm-projectile)

(evil-define-key 'normal global-map (kbd "C-f") 'helm-projectile-grep)

(provide 'my-helm)
