;;; packages.el --- my-evil layer packages file for Spacemacs.
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
;; added to `my-evil-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `my-evil/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `my-evil/pre-init-PACKAGE' and/or
;;   `my-evil/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst my-evil-packages
  '(evil-multiedit)
  "The list of Lisp packages required by the my-evil layer.

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


(require 'hippie-exp)
(require 'cl-lib)

(defun my-try-expand-line-all-buffers (old)
    "Try to complete the current line, searching all other buffers.
The argument OLD has to be nil the first call of this function, and t
for subsequent calls (for further possible completions of the same
string).  It returns t if a new completion is found, nil otherwise."
    (my-he--all-buffers
     old
     (lambda () (he-line-beg (and (get-buffer-process (current-buffer))
                                  comint-use-prompt-regexp
                                  comint-prompt-regexp)))
     (lambda (string)
       (he-line-search string
                       (and (get-buffer-process (current-buffer))
                            comint-use-prompt-regexp
                            comint-prompt-regexp)
                       nil))))

(defun my-he--all-buffers (old beg-function search-function)
  (let ((expansion ())
        (buf (current-buffer))
        (only-buffers hippie-expand-only-buffers)
        (ignore-buffers hippie-expand-ignore-buffers)
        (orig-case-fold-search case-fold-search))
    (if (not old)
        (progn
          (he-init-string (funcall beg-function) (point))
          (setq he-search-bufs (buffer-list))
          (setq he-searched-n-bufs 0)
          (set-marker he-search-loc 1 (car he-search-bufs))))

    (if (not (equal he-search-string ""))
        (while (and he-search-bufs
                    (not expansion)
                    (or (not hippie-expand-max-buffers)
                        (< he-searched-n-bufs hippie-expand-max-buffers)))
          (set-buffer (car he-search-bufs))
          (if (if only-buffers
                  (he-buffer-member only-buffers)
                (not (he-buffer-member ignore-buffers)))
              (save-excursion
                (save-restriction
                  (if hippie-expand-no-restriction
                      (widen))
                  (goto-char he-search-loc)
                  (setq expansion
                        (let ((case-fold-search orig-case-fold-search))
                          (funcall search-function he-search-string)))
                  (set-marker he-search-loc (point))
                  (if (not expansion)
                      (progn
                        (setq he-search-bufs (cdr he-search-bufs))
                        (setq he-searched-n-bufs (1+ he-searched-n-bufs))
                        (set-marker he-search-loc 1 (car he-search-bufs))))))
            (setq he-search-bufs (cdr he-search-bufs))
            (set-marker he-search-loc 1 (car he-search-bufs)))))

    (set-buffer buf)
    (if (not expansion)
        (progn
          (if old (he-reset-string))
          ())
      (progn
        expansion
        ))))

(defun get-hippie-expand-lines ()
  (let (completions-list candidate)
    (setq candidate (my-try-expand-line-all-buffers nil))
    (if candidate
        (progn
          (push candidate completions-list)
          (while (progn
                   (setq candidate (my-try-expand-line-all-buffers t))
                   (if candidate
                       (push candidate completions-list)
                     nil))))
      nil)
    completions-list))

(defun company-hippie-line (command &optional arg &rest ignored)
  (interactive (list 'interactive))

  (cl-case command
    (interactive (company-begin-backend 'company-hippie-line))
    (prefix (and (company-grab-symbol)
                 (not (looking-at "[:word:]"))
                 (let (p1 p2)
                   (save-excursion
                     (end-of-line)
                     (setq p2 (point))
                     (back-to-indentation)
                     (setq p1 (point)))
                   (buffer-substring-no-properties p1 p2))))
        (candidates (get-hippie-expand-lines))))

;;; packages.el ends here

(defun my-evil/init-evil-multiedit ()
  (use-package evil-multiedit))
