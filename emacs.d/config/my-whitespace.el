(defun enable-whitespace ()
  (progn
    (whitespace-mode)
    (set-face-attribute 'whitespace-tab nil :foreground s-base01 :background s-base02 :bold nil)
    ))

(setq next-line-add-newlines nil)
(setq scroll-conservatively 1000000)

(add-hook 'whitespace-mode-hook (lambda () (diminish 'whitespace-mode)))
(provide 'my-whitespace)
