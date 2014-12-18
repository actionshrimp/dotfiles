(use-package rvm
  :ensure rvm
  :config (rvm-use-default))

(add-hook 'ruby-mode-hook 'enable-common-lang)

(provide 'my-ruby)
