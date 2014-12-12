;; Disable toolbars and splash screens.
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; Disable the menu bar in console emacs.
(unless (display-graphic-p) (menu-bar-mode -1))

(setq require-final-newline t)
(setq-default indent-tabs-mode nil)

(defvar my-auto-save-folder "~/.emacs.d/.saves/"
  "Directory used for Emacs backups.")

(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))
(setq auto-save-file-name-transforms
      `((".*" ,my-auto-save-folder t)))

(load-theme 'solarized-dark t)
(provide 'my-core)
