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

(use-package web-mode
  :ensure web-mode)
(add-hook 'web-mode-hook 'enable-common-lang)

;Requires installation of editorconfig-core!
(use-package editorconfig
  :ensure editorconfig
  :idle)

(use-package hippie-exp
  :ensure hippie-exp
  :idle)

(provide 'my-packages)
