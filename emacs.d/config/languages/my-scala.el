(use-package ensime
  :ensure ensime
  :idle)

(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(provide 'my-scala)
