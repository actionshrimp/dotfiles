(add-to-list 'load-path "~/.emacs.d/structured-haskell-mode/elisp")

(defun haskell-process-completions-at-point ()
  "A company-mode-compatible complete-at-point function."
  (interactive)
  (destructuring-bind (start . end) (bounds-of-thing-at-point 'symbol)
    (let ((completions
           (haskell-process-get-repl-completions (haskell-process)
                                                 (symbol-name (symbol-at-point)))))
      (list start end completions))))


(setq haskell-process-type 'cabal-repl
      haskell-process-path-cabal "~/.cabal/bin/cabal"
      flycheck-haskell-hlint-executable "~/.cabal/bin/hlint"
      )

(defun haskell-mode-setup ()
  (enable-common-lang)
  (flycheck-haskell-configure)
  (turn-on-haskell-indentation)
  (structured-haskell-mode)
  )

(use-package flycheck-haskell
  :ensure flycheck-haskell
  :idle
  :config (flycheck-haskell-setup))

(use-package haskell-mode
  :ensure haskell-mode
  :mode ("\\.l?hs$" . haskell-mode)
  :config (progn
            (require 'shm)
            (add-hook 'haskell-mode-hook 'haskell-mode-setup)
            (evil-define-key 'normal haskell-mode-map
              (kbd ",t") 'haskell-process-do-type
              (kbd ",i") 'haskell-process-do-info
              (kbd ",;") 'haskell-process-load-file
              (kbd "C-c ;") 'haskell-interactive-switch)

            (dolist (state '(insert normal))
              (evil-define-key state haskell-mode-map
                (kbd "M-l") '(lambda () (interactive)
                               (evil-insert-state)
                               (shm/goto-parent-end))
                (kbd "M-h") '(lambda () (interactive)
                               (evil-insert-state)
                               (shm/goto-parent))
                (kbd "M-j") '(lambda () (interactive)
                               (evil-insert-state)
                               (shm/newline-indent))
                (kbd "M-k") '(lambda () (interactive)
                               (evil-insert-state)
                               (shm/delete-indentation))
                )

              (evil-set-initial-state 'haskell-interactive-mode 'emacs))
            (evil-define-key 'emacs haskell-interactive-mode-map
              (kbd "<RET>") 'haskell-interactive-mode-return
              (kbd "C-c ;") 'haskell-interactive-switch-back
              (kbd "<up>") 'haskell-interactive-mode-history-previous
              (kbd "<down>") 'haskell-interactive-mode-history-next
              (kbd "C-c C-c") 'haskell-interactive-mode-prompt-next
              )
            ))


(provide 'my-haskell)
