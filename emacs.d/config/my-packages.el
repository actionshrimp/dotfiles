(use-package rainbow-delimiters
  :ensure rainbow-delimiters
  :idle
  :commands rainbow-delimiters-mode-enable)

(use-package paredit
  :ensure paredit
  :commands paredit-mode
  :idle)

(use-package flycheck
  :ensure flycheck
  :commands global-flycheck-mode)

;Requires installation of editorconfig-core!
(use-package editorconfig
  :ensure editorconfig
  :idle)

(use-package hippie-exp
  :ensure hippie-exp
  :idle)

(use-package column-marker
  :ensure column-marker
  :idle)

(provide 'my-packages)
