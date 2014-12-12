(use-package color-theme-solarized
  :ensure color-theme-solarized
  :defer t)

(use-package rainbow-delimiters
  :ensure rainbow-delimiters
  :idle
  :commands rainbow-delimiters-mode-enable)

(use-package paredit
  :ensure paredit
  :commands paredit-mode
  :idle) 

(provide 'my-packages)
