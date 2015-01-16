(use-package clojure-mode
  :ensure clojure-mode
  :idle)

(use-package cider
  :ensure cider
  :idle)

(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode-enable)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'enable-common-lang)

(provide 'my-clojure)
