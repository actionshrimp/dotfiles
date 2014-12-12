(setq whitespace-style '(face tabs trailing space-before-tab newline indentation empty space-after-tab tab-mark newline-mark))

(setq whitespace-display-mappings
      '((space-mark 32 [183] [46])
        (newline-mark 10 [172 10])
        (tab-mark 9 [8250 9])))

(defun enable-common-lang ()
  (progn
    (whitespace-mode)
    ))


;(defun enable-common-lang ()
;  (progn

(provide 'common-lang)
