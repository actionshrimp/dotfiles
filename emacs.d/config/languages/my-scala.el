(use-package ensime
  :ensure ensime
  :mode ("\\.scala$" . scala-mode)
  :commands (ensime-mode ensime-scala-mode-hook)
  :config (progn
            (add-hook 'scala-mode-hook 'enable-common-lang)))

(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(provide 'my-scala)
