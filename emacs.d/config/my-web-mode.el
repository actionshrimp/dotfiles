(use-package web-mode
  :ensure web-mode)
(add-hook 'web-mode-hook 'enable-common-lang)

(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))

(provide 'my-web-mode)
