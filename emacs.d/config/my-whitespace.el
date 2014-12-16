(defun enable-whitespace ()
  (progn
    (whitespace-mode)
    (set-face-attribute 'whitespace-newline nil :foreground (theme-color 'base01))
    (set-face-attribute 'whitespace-tab nil :foreground "inherit" :background "#053542")
    ))

(setq next-line-add-newlines nil)
(setq scroll-conservatively 1000000)
(provide 'my-whitespace)
