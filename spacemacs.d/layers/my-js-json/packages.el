;;; packages.el --- my-js-json layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Dave Aitken <dave@murdock.home>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `my-js-json-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `my-js-json/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `my-js-json/pre-init-PACKAGE' and/or
;;   `my-js-json/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst my-js-json-packages
  '(flycheck)
  "The list of Lisp packages required by the my-js-json layer.
Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun my/flycheck-parse-flow (output checker buffer)
  (let ((json-array-type 'list))
    (let ((o (json-read-from-string output)))
      (mapcar #'(lambda (errp)
                  (let ((err (cadr (assoc 'message errp)))
                        (err2 (cadr (cdr (assoc 'message errp)))))
                    (flycheck-error-new
                     :line (cdr (assoc 'line err))
                     :column (cdr (assoc 'start err))
                     :level 'error
                     :message (concat (cdr (assoc 'descr err)) ". " (cdr (assoc 'descr err2)))
                     :filename (f-relative
                                (cdr (assoc 'path err))
                                (f-dirname (file-truename
                                            (buffer-file-name))))
                     :buffer buffer
                     :checker checker)))
              (cdr (assoc 'errors o))))))

(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/.bin/eslint"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-my-eslint-executable eslint))))

(defun my/use-flow-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/.bin/flow"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-flow-executable eslint))))

(defun my-js-json/post-init-flycheck ()
  ;; (defun my/flycheck-filter-eslint-errors (errors)
  ;;   (seq-do (lambda (err)
  ;;             ;; Parse error ID from the error message
  ;;             (setf (flycheck-error-message err)
  ;;                   (replace-regexp-in-string
  ;;                    (rx " ("
  ;;                        (group (one-or-more (not (any ")"))))
  ;;                        ")" string-end)
  ;;                    (lambda (s)
  ;;                      (setf (flycheck-error-id err)
  ;;                            (match-string 1 s))
  ;;                      "")
  ;;                    (flycheck-error-message err))))
  ;;           (flycheck-sanitize-errors errors))
  ;;   errors)

  (flycheck-define-checker javascript-flow
    "Javascript type checking using Flow."
    :command ("flow" "--json" source-original)
    :error-parser my/flycheck-parse-flow
    :modes js2-mode
    :next-checkers ((error . javascript-my-eslint)))


  (flycheck-define-checker javascript-my-eslint
    "A Javascript syntax and style checkefor r using eslint.

See URL `https://github.com/eslint/eslint'."
    :command ("eslint" "--format=checkstyle"
              (option-list "--rulesdir" flycheck-eslint-rules-directories)
              "--stdin" "--stdin-filename" source-original)
    :standard-input t
    :error-parser flycheck-parse-checkstyle
    ;;:error-filter my/flycheck-filter-eslint-errors
    :modes (js-mode js-jsx-mode js2-mode js2-jsx-mode js3-mode rjsx-mode)
    :next-checkers ((warning . javascript-jscs)))

  (add-to-list 'flycheck-disabled-checkers 'javascript-eslint)

  (add-to-list 'flycheck-checkers 'javascript-flow)
  (add-to-list 'flycheck-checkers 'javascript-my-eslint)
  (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)
  (add-hook 'flycheck-mode-hook #'my/use-flow-from-node-modules))

;; (defun my-js-json/init-json-mode ()
;;   (add-hook 'json-mode-hook
;;             (lambda ()
;;               (make-local-variable 'js-indent-level)
;;         for       (setq js-indent-level 2))))

;;; packages.el ends here
