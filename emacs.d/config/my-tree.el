(use-package dirtree
  :ensure dirtree
  :idle
  :config

  (progn
    (evil-define-key 'normal global-map (kbd "<f2>") 'toggle-tree)
    (evil-define-key 'emacs global-map (kbd "<f2>") 'toggle-tree)
    (evil-define-key 'normal dirtree-mode-map (kbd "<f2>") 'toggle-tree)
    (evil-define-key 'normal dirtree-mode-map (kbd "q") 'toggle-tree)
    (evil-define-key 'normal dirtree-mode-map (kbd "<f5>") 'tree-mode-reflesh)
    ))

(defun tree-in-project-root ()
  (interactive)
  (dirtree (projectile-project-root) t))

(defun toggle-tree ()
  (interactive)
  (let ((killed nil))
    (save-selected-window
      (dolist (window (window-list))
        (select-window window)
        (if (string-equal "*dirtree*" (buffer-name))
            (progn
              (kill-buffer-and-window)
              (setq killed t)))))
    (unless killed
      (tree-in-project-root))))

(provide 'my-tree)
