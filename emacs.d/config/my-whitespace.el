(defun enable-whitespace ()
  (progn
    (whitespace-mode)
    (set-face-attribute 'whitespace-newline nil :foreground "blue" :weight 'normal)
    (set-face-attribute 'whitespace-tab nil :foreground "blue" :background "black")
    ))

(provide 'my-whitespace)
