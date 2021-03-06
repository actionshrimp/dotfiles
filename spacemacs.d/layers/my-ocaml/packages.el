;;; packages.el --- my-ocaml layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Dave Aitken <dave@murdock.local>
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
;; added to `my-ocaml-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `my-ocaml/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `my-ocaml/pre-init-PACKAGE' and/or
;;   `my-ocaml/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst my-ocaml-packages
  '(tuareg)
  "The list of Lisp packages required by the my-ocaml layer.

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

(defun my-reload-dir-locals-for-current-buffer ()
  "reload dir locals for the current buffer"
  (let ((enable-local-variables :all))
    (hack-dir-local-variables-non-file-buffer)))

(defun my-ocaml/post-init-tuareg ()
  (progn
    (when (and (file-exists-p "/usr/local/bin/ocamlformat")
               (file-directory-p "~/.opam/default/share/emacs/site-lisp"))

      (add-to-list 'load-path "~/.opam/default/share/emacs/site-lisp")
      (require 'ocamlformat)


      ;;stop syntax error popup
      (setq ocamlformat-show-errors nil)

      (add-hook 'tuareg-mode-hook
                (lambda ()
                  (when ocaml-auto-ocamlformat
                    (add-hook 'before-save-hook 'ocamlformat-before-save nil t)))))

      (spacemacs|add-toggle ocamlformat
        :documentation "Toggle automatic ocamlformat on save."
        :status ocaml-auto-ocamlformat
        :on (progn
              (setq ocaml-auto-ocamlformat t)
              (add-hook 'before-save-hook 'ocamlformat-before-save nil t))
        :off (progn
               (setq ocaml-auto-ocamlformat nil)
               (remove-hook 'before-save-hook 'ocamlformat-before-save t)))

      (spacemacs/set-leader-keys-for-major-mode 'tuareg-mode
        "b=" 'ocamlformat
        "t=" 'spacemacs/toggle-ocamlformat)

    (defvar last-buffer-name nil)

    (defun reload-vars-for-tuareg ()
      (when (not (equal (buffer-name) last-buffer-name))
        (setq last-buffer-name (buffer-name))

        (when (member major-mode '(tuareg-mode))
          (hack-local-variables-apply))))

    (add-hook 'post-command-hook 'reload-vars-for-tuareg)

    (defun tuareg-run-imandra ()
      (interactive)
      (minibuffer-with-setup-hook
          (lambda ()
            (kill-whole-line)
            (insert "/usr/local/bin/imandra-emacs"))

        (call-interactively #'tuareg-run-ocaml)))

    (defun utop-jbuilder ()
      (interactive)
      (minibuffer-with-setup-hook
          (lambda ()
            (kill-whole-line)
            (insert "jbuilder utop . -- -emacs"))

        (call-interactively #'utop)))

    (spacemacs/set-leader-keys-for-major-mode 'tuareg-mode
      "er" 'tuareg-eval-region
      "ep" 'tuareg-eval-phrase
      "eb" 'tuareg-eval-buffer
      "sco" 'tuareg-run-ocaml
      "sci" 'tuareg-run-imandra
      "scj" 'utop-jbuilder
      )))

;;; packages.el ends here
