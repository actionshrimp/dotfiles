(setq whitespace-style '(face tabs trailing newline tab-mark newline-mark))

(setq whitespace-display-mappings
      '((newline-mark 10 [172 10])
        (tab-mark 9 [8250 9])))

(defun enable-common-lang ()
  (progn
    (whitespace-mode)))

(provide 'my-common-lang)
