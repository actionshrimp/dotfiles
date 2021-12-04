(defun helm-projectile-search-other-project ()
  (interactive)
  (let ((orig projectile-switch-project-action))
    (setq projectile-switch-project-action 'spacemacs/helm-project-smart-do-search)
    (helm-projectile-switch-project)
    (setq  projectile-switch-project-action orig)))

(defun helm-projectile-find-files-other-project ()
  (interactive)
  (let ((orig projectile-switch-project-action))
    (setq projectile-switch-project-action 'helm-projectile)
    (helm-projectile-switch-project)
    (setq  projectile-switch-project-action orig)))

(spacemacs/set-leader-keys
  "P/" 'helm-projectile-search-other-project
  "Pf" 'helm-projectile-find-files-other-project
  "Pp" 'helm-projectile-find-files-other-project)
