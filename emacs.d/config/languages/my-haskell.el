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
  )

(use-package flycheck-haskell
  :ensure flycheck-haskell
  :idle
  :config (flycheck-haskell-setup))

(use-package haskell-mode
  :ensure haskell-mode
  :mode ("\\.l?hs$" . haskell-mode)
  :config (progn
            (add-hook 'haskell-mode-hook 'haskell-mode-setup)
            (evil-define-key 'normal haskell-mode-map
              (kbd ",t") 'haskell-process-do-type
              (kbd ",i") 'haskell-process-do-info
              (kbd ",;") 'haskell-process-load-file
              (kbd "C-c ;") 'haskell-interactive-switch)

            (evil-set-initial-state 'haskell-interactive-mode 'emacs)

            (evil-define-key 'emacs haskell-interactive-mode-map
              (kbd "<RET>") 'haskell-interactive-mode-return
              (kbd "C-c ;") 'haskell-interactive-switch-back
              (kbd "<up>") 'haskell-interactive-mode-history-previous
              (kbd "<down>") 'haskell-interactive-mode-history-next
              (kbd "C-c C-c") 'haskell-interactive-mode-prompt-next
              )
            ))


(provide 'my-haskell)
