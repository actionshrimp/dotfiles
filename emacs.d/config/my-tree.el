(defun tree-in-project-root ()
  (interactive)
  (dirtree (projectile-project-root) nil))

(use-package dirtree
  :ensure dirtree
  :idle
  :config

  (progn
    (evil-define-key 'normal global-map (kbd "<f2>") 'tree-in-project-root)
    (evil-define-key 'emacs global-map (kbd "<f2>") 'tree-in-project-root)
    (evil-define-key 'normal dirtree-mode-map (kbd "<f2>") 'kill-buffer-and-window))
  )

(provide 'my-tree)
