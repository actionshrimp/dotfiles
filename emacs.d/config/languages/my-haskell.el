(use-package haskell-mode
  :ensure haskell-mode
  :idle)

(add-hook 'haskell-mode-hook 'enable-common-lang)
(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
(provide 'my-haskell)
