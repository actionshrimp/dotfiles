(use-package haskell-mode
  :ensure haskell-mode
  :mode ("\\.l?hs$" . haskell-mode)
  :config (progn
            (add-hook 'haskell-mode-hook 'enable-common-lang)
            (add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)))

(use-package flycheck-haskell
  :ensure flycheck-haskell
  :mode ("\\.l?hs$" . haskell-mode)
  :config (progn
            (add-hook 'flycheck-mode-hook #'flycheck-haskell-setup)))

(provide 'my-haskell)
