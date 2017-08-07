;;; packages.el --- fix-muscle-memory layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Dave Aitken <dave@murdock.home>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Code:

(defconst fix-muscle-memory-packages
  '(fix-muscle-memory))

(defun fix-muscle-memory/init-fix-muscle-memory ()
  (require 'fix-muscle-memory)
  (setq-default abbrev-mode t))

;;; packages.el ends here
