(use-package paredit
  :ensure paredit
  :commands paredit-mode
  :config (progn
            (dolist (state '(normal insert))
              (evil-define-key state paredit-mode-map
                (kbd "M-L") 'paredit-backward-barf-sexp
                (kbd "M-H") 'paredit-backward-slurp-sexp
                (kbd "M-l") 'paredit-forward-slurp-sexp
                (kbd "M-h") 'paredit-forward-barf-sexp
                (kbd "M-k") 'paredit-splice-sexp
                (kbd "M-j") '(lambda () (interactive) (save-excursion
                                (forward-char 2) (backward-sexp)
                                (paredit-wrap-sexp)))
                (kbd "M-]") '(lambda () (interactive) (save-excursion
                                (forward-char 2) (backward-sexp)
                                (paredit-wrap-square)))
                (kbd "M-J") 'paredit-join-sexps))
            )
)

(provide 'my-paredit)
