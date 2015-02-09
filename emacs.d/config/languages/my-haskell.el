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

(use-package haskell-mode
  :ensure haskell-mode
  :mode ("\\.l?hs$" . haskell-mode)
  :config (progn
            (defun on-haskell-mode ()
              (enable-common-lang)
              (turn-on-haskell-simple-indent)
              (flycheck-haskell-setup)
              ;(flycheck-select-checker 'haskell-ghc)
              )
            (add-hook 'haskell-mode-hook 'on-haskell-mode)
            (evil-define-key 'normal haskell-mode-map
              (kbd ",t") 'haskell-process-do-type
              (kbd ",i") 'haskell-process-do-info
              (kbd ",;") 'haskell-interactive-switch
              )

            (evil-set-initial-state 'haskell-interactive-mode 'emacs)
            (evil-define-key 'emacs haskell-interactive-mode-map
              (kbd "<RET>") 'haskell-interactive-mode-return)
            ))

(provide 'my-haskell)
