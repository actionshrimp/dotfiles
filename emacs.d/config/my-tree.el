;; (use-package dirtree
;;   :ensure dirtree
;;   :idle
;;   :config

;;   (progn
;;     (evil-define-key 'normal global-map (kbd "<f2>") 'toggle-tree)
;;     (evil-define-key 'emacs global-map (kbd "<f2>") 'toggle-tree)
;;     (evil-define-key 'normal dirtree-mode-map (kbd "<f2>") 'toggle-tree)
;;     (evil-define-key 'normal dirtree-mode-map (kbd "q") 'toggle-tree)
;;     (evil-define-key 'normal dirtree-mode-map (kbd "<f5>") 'tree-mode-reflesh)
;;     ))



(use-package neotree
  :ensure neotree
  :idle
  :config (progn
            (evil-define-key 'insert global-map (kbd "<f2>") 'toggle-tree)
            (evil-define-key 'normal global-map (kbd "<f2>") 'toggle-tree)
            (evil-define-key 'emacs global-map (kbd "<f2>") 'toggle-tree)
            (evil-define-key 'normal neotree-mode-map (kbd "<f2>") 'neotree-hide)
            (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
            (evil-define-key 'normal neotree-mode-map (kbd "R") 'neotree-refresh)
            (evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)
            (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
            (evil-define-key 'normal neotree-mode-map (kbd "m") 'neotree-menu)
            )
  )

(defun neo-buffer--copy-node ()
  "Copy current node as another path."
  (interactive)
  (let* ((current-path (neo-buffer--get-filename-current-line))
         (buffer (find-buffer-visiting current-path))
         to-path
         msg)
    (unless (null current-path)
      (setq msg (format "Copy [%s] to: " (neo-path--file-short-name current-path)))
      (setq to-path (read-file-name msg (file-name-directory current-path)))
      (if buffer
          (with-current-buffer buffer
            (set-visited-file-name to-path nil t)))
      (copy-file current-path to-path)
      (neo-buffer--refresh t)
      (message "Copy successful."))))

(defun neotree-copy-node ()
  "Copy current node."
  (interactive)
  (neo-buffer--copy-node))

(defun tree-in-project-root ()
  (interactive)
  (neotree-dir (projectile-project-root)))

(defun toggle-tree ()
  (interactive)
  (let ((killed nil))
    (dolist (window (window-list))
      (select-window window)
      (if (string-equal " *NeoTree*" (buffer-name))
          (progn
            (kill-buffer-and-window)
            (setq killed t))))
    (unless killed
      (tree-in-project-root))))

(defun neotree-copy-node)

(defun neotree-menu (arg)
  (interactive (list (read-key "[a]dd / [m]ove / [d]elete / [c]opy? ")))
  (let ((current-path (neo-buffer--get-filename-current-line)))
    (pcase (char-to-string arg)
      ("a" (call-interactively 'neotree-create-node))
      ("m" (neotree-rename-node))
      ("d" (neotree-delete-node))
      ("c" (neotree-copy-node))
      )
    )
  )

(provide 'my-tree)
