(use-package helm
  :ensure helm
  :commands (helm-M-x helm-projectile helm-buffers-list)
  :config (progn
            (setq helm-M-x-fuzzy-match t)
            (helm-projectile-on)
            (define-key helm-map (kbd "C-w") 'backward-kill-word)))

(use-package helm-ag
  :ensure helm-ag
  :commands (helm-ag helm-projectile-ag))

(use-package helm-projectile
  :ensure helm-projectile
  :commands (helm-projectile-on)
  :config (progn
            (setq projectile-completion-system 'helm)
            (helm-projectile-on)))

(global-set-key (kbd "M-x") 'helm-M-x)
(after 'evil
  (evil-define-key 'normal global-map (kbd "C-p") 'helm-projectile)
  (evil-define-key 'emacs global-map (kbd "C-p") 'helm-projectile)
  (evil-define-key 'normal global-map (kbd "C-c b") 'helm-buffers-list)
  (evil-define-key 'emacs global-map (kbd "C-c b") 'helm-buffers-list))

(provide 'my-helm)
