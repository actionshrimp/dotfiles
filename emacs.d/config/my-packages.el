(use-package projectile
  :diminish projectile-mode
  :ensure projectile
  :config (projectile-global-mode))

(use-package rainbow-delimiters
  :ensure rainbow-delimiters
  :commands rainbow-delimiters-mode-enable)

(use-package paredit
  :ensure paredit
  :commands paredit-mode)

(use-package flycheck
  :diminish flycheck-mode
  :ensure flycheck
  :commands global-flycheck-mode)

;Requires installation of editorconfig-core!
(use-package editorconfig
  :ensure editorconfig
  :idle)

(use-package hippie-exp
  :ensure hippie-exp
  :commands (make-hippie-expand-function))

(use-package column-marker
  :ensure column-marker
  :idle)

(after 'undo-tree (diminish 'undo-tree-mode))

(provide 'my-packages)
