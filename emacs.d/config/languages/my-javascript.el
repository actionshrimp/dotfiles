(setq js3-global-externs '("module" "exports" "require" "process" "__dirname"))
(setq js3-mode-show-parse-errors nil)
(setq js3-mode-show-strict-warnings nil)

(use-package js3-mode
  :ensure js3-mode
  :idle)

(flycheck-def-config-file-var flycheck-jscs javascript-jscs ".jscs.json"
   :safe #'stringp)

(flycheck-define-checker javascript-jscs
     "A JavaScript code style checker.
See URL `https://github.com/mdevils/node-jscs'."
     :command ("jscs" "--reporter" "checkstyle"
                 (config-file "--config" flycheck-jscs)
                   source)
     :error-parser flycheck-parse-checkstyle
     :modes (js-mode js2-mode js3-mode)
     :next-checkers (javascript-jshint))

(defun check-javascript ()
  (setq flycheck-checkers '(javascript-jscs javascript-jshint))
  (flycheck-mode))

(add-hook 'js3-mode-hook 'enable-common-lang)
(add-hook 'js3-mode-hook 'check-javascript)

(provide 'my-javascript)
