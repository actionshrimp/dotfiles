;(setq js3-global-externs '("module" "exports" "require" "process" "__dirname"))
(setq js3-mode-show-parse-errors nil)
(setq js3-mode-show-strict-warnings nil)

(use-package js3-mode
  :ensure js3-mode
  :commands (js3-mode)
  :config (progn
            (add-hook 'js3-mode-hook 'enable-common-lang)
            ;(add-hook 'js-mode-hook 'enable-common-lang)

            )
  )

(flycheck-def-config-file-var flycheck-jscs javascript-jscs ".jscs.json" :safe #'stringp)

(flycheck-define-checker javascript-jscs
     "A JavaScript code style checker"
     :command ("jscs" "--reporter" "checkstyle"
                 (config-file "--config" flycheck-jscs)
                   source)
     :error-parser (lambda (output checker buffer)
                     (let ((error-list (flycheck-parse-checkstyle output checker buffer))
                           (value))
                        (dolist (err error-list value)
                          (setf (flycheck-error-level err) 'warning)
                          (setq value (cons err value)))))
     :modes (js-mode js2-mode js3-mode)
     :next-checkers (javascript-jshint))

(add-to-list 'flycheck-checkers 'javascript-jscs)


(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.es6$" . js3-mode))

(flycheck-define-checker jsx-jsxhint
  "A JSX syntax and style checker based on JSXHint."
  :command ("jsxhint" (config-file "--config" flycheck-jshintrc) source)
  :error-patterns
  ((error line-start (1+ nonl) ": line " line ", col " column ", " (message) line-end))
  :modes (web-mode))

(add-hook 'web-mode-hook
          (lambda ()
            (when (equal web-mode-content-type "jsx")
              ;; enable flycheck
              (flycheck-select-checker 'jsx-jsxhint))))


(add-to-list 'auto-mode-alist
             '("\\.json$" . (lambda ()
                              (js3-mode)
                              (flycheck-disable-checker 'javascript-jscs))))

(add-to-list 'company-dabbrev-code-modes 'js3-mode)

(provide 'my-javascript)
