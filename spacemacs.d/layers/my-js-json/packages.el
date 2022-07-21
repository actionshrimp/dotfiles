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
  '()
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

;; (defun my-js-json/init-json-mode ()
;;   (add-hook 'json-mode-hook
;;             (lambda ()
;;               (make-local-variable 'js-indent-level)
;;         for       (setq js-indent-level 2))))

(defun maybe-use-prettier ()
  "Enable prettier-js-mode if an rc file is located."
  (if (or (locate-dominating-file default-directory ".prettierrc")
          (locate-dominating-file default-directory "prettier.config.js"))
      (prettier-js-mode +1)))


(add-hook 'typescript-mode-hook 'maybe-use-prettier)
(add-hook 'typescript-tsx-mode-hook 'maybe-use-prettier)
(add-hook 'js2-mode-hook 'maybe-use-prettier)
(add-hook 'js2-jsx-mode-hook 'maybe-use-prettier)
(add-hook 'js-mode-hook 'maybe-use-prettier)
(add-hook 'js-jsx-mode-hook 'maybe-use-prettier)
