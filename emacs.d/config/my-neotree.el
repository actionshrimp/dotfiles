(use-package neotree
  :ensure neotree
  :idle)

(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "a") 'neotree-create-node)
            (define-key evil-normal-state-local-map (kbd "r") 'neotree-rename-node)
            (define-key evil-normal-state-local-map (kbd "d") 'neotree-delete-node)
            ))

(global-set-key (kbd "<f2>") 'neotree-toggle)

(provide 'my-neotree)
