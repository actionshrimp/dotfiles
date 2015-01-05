;(setq js3-global-externs '("module" "exports" "require" "process" "__dirname"))
(setq js3-mode-show-parse-errors nil)
(setq js3-mode-show-strict-warnings nil)

(use-package js3-mode
  :ensure js3-mode
  :idle)

(flycheck-def-config-file-var flycheck-jscs javascript-jscs ".jscs.json"
   :safe #'stringp)

(flycheck-define-checker javascript-jscs
     "A JavaScript code style checker"
     :command ("jscs" "--reporter" "checkstyle"
                 (config-file "--config" flycheck-jscs)
                   source)
     :error-parser flycheck-parse-checkstyle
     :modes (js-mode js2-mode js3-mode)
     :next-checkers (javascript-jshint))

(add-hook 'js3-mode-hook 'enable-common-lang)
(add-hook 'js-mode-hook 'enable-common-lang)

(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

(flycheck-define-checker jsx-jsxhint
  "A JSX syntax and style checker based on JSXHint."

  :command ("jsxhint" source)
  :error-patterns
  ((error line-start (1+ nonl) ": line " line ", col " column ", " (message) line-end))
  :modes (web-mode))

(add-hook 'web-mode-hook
          (lambda ()
            (when (equal web-mode-content-type "jsx")
              ;; enable flycheck
              (flycheck-select-checker 'jsxhint-checker))))


(provide 'my-javascript)
