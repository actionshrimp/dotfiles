(use-package grizzl
  :ensure grizzl
  :idle)

(defun evil-grizzl ()
  (evil-define-key evil-insert-state-local-map (kbd "\C-w")))

(use-package projectile
  :ensure projectile
  :idle
  (progn
    (add-hook 'grizzl-mode-hook 'evil-grizzl))
  :config
  (progn
    (evil-define-key 'normal global-map "\C-p" 'projectile-find-file)
    (setq projectile-completion-system 'grizzl)
    ))

(provide 'my-projectile)
