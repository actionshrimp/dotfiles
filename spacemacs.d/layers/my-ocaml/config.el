;; Noop to stop tuareg-abbrev-hook error popping up when hitting escape
(defun tuareg-abbrev-hook ()
  ())

(add-hook 'tuareg-mode-hook
          (lambda ()
            (setq-local comment-style 'indent)))
