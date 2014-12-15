(use-package helm
  :ensure helm
  :idle
  :config (progn
            (define-key helm-map (kbd "C-w") 'backward-kill-word)
            ))

(use-package helm-projectile
  :ensure helm-projectile
  :idle)

(set-face-attribute 'helm-selection nil :foreground "black" :background "blue" :underline t)

(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-M-x-fuzzy-match t)

(evil-define-key 'normal global-map (kbd "C-p") 'helm-projectile-find-file)
(evil-define-key 'normal global-map (kbd "C-f") 'helm-projectile-grep)

(provide 'my-helm)
