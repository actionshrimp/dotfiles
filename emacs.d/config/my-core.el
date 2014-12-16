;; Disable toolbars and splash screens.
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; Disable the menu bar in console emacs.
(unless (display-graphic-p) (menu-bar-mode -1))

(defvar my-auto-save-folder "~/.emacs.d/.saves/"
  "Directory used for Emacs backups.")

(setq backup-directory-alist `(("." . ,my-auto-save-folder)))
(setq auto-save-file-name-transforms `((".*" ,my-auto-save-folder t)))
(setq create-lockfiles nil)

(setq require-final-newline t)
(setq-default indent-tabs-mode nil)

(define-key minibuffer-local-map (kbd "C-w") 'backward-kill-word)

(use-package color-theme-solarized
  :ensure color-theme-solarized
  :defer t)

(load-theme 'solarized-dark t)
(set-default-font "Ubuntu Mono 16")
(provide 'my-core)
