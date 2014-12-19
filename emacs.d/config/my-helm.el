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

(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-M-x-fuzzy-match t)

(evil-define-key 'normal global-map (kbd "C-p") 'helm-projectile)
(evil-define-key 'emacs global-map (kbd "C-p") 'helm-projectile)

(evil-define-key 'normal global-map (kbd "C-f") 'helm-projectile-grep)

(provide 'my-helm)
