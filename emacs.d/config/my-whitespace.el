(defun enable-whitespace ()
  (progn
    (whitespace-mode)
    (set-face-attribute 'whitespace-newline nil :foreground "blue" :weight 'normal)
    (set-face-attribute 'whitespace-tab nil :foreground "blue" :background "black")
    ))

(setq next-line-add-newlines nil)
(setq scroll-conservatively 1000000)
(provide 'my-whitespace)
