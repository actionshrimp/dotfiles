;;; packages.el --- evil-lisp-bindings layer packages file for Spacemacs.
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
;; added to `evil-lisp-bindings-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `evil-lisp-bindings/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `evil-lisp-bindings/pre-init-PACKAGE' and/or
;;   `evil-lisp-bindings/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst my-evil-lisp-packages
  '(evil-smartparens)
  ;;parinfer

  "The list of Lisp packages required by the evil-lisp-bindings layer.

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

(defun my-evil-lisp/init-evil-smartparens ()
  (add-hook 'emacs-lisp-mode-hook #'evil-smartparens-mode)
  (when (configuration-layer/package-usedp 'clojure-mode)
    (add-hook 'clojure-mode-hook #'evil-smartparens-mode)
    (add-hook 'clojurescript-mode-hook #'evil-smartparens-mode)
    (add-hook 'clojurec-mode-hook #'evil-smartparens-mode)
    (add-hook 'clojurex-mode-hook #'evil-smartparens-mode)))

;;(defun my-evil-lisp/init-evil-cleverparens ()
;;  ;;(add-hook 'emacs-lisp-mode-hook #'evil-cleverparens-mode)
;;  (when (configuration-layer/package-usedp 'clojure-mode) 
;;    (add-hook 'clojure-mode-hook #'evil-cleverparens-mode)
;;    (add-hook 'clojurescript-mode-hook #'evil-cleverparens-mode)
;;    (add-hook 'clojurec-mode-hook #'evil-cleverparens-mode)
;;    (add-hook 'clojurex-mode-hook #'evil-cleverparens-mode)))

;;(defun my-evil-lisp/init-parinfer ()
;;  (use-package parinfer
;;    :init
;;    (progn
;;      (setq-default parinfer-lighters '(" infer" . " (infer)"))
;;      (setq-default parinfer-extensions
;;                    '(defaults
;;                       pretty-parens
;;                       evil
;;                       ;; lispy
;;                       smart-tab
;;                       smart-yank
;;      (add-hook 'clojure-mode-hook #'parinfer-mode)
;;      (add-hook 'clojurescript-mode-hook #'parinfer-mode)
;;      (add-hook 'clojurec-mode-hook #'parinfer-mode)
;;      (add-hook 'clojurex-mode-hook #'parinfer-mode)
;;      (add-hook 'racket-mode-hook #'parinfer-mode)
;;      (add-hook 'scheme-mode-hook #'parinfer-mode)
;;      (add-hook 'emacs-lisp-mode-hook #'parinfer-mode))))

;;; packages.el ends here
