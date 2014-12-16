;; Disable toolbars and splash screens.
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; Disable the menu bar in console emacs.
(menu-bar-mode -1)
(setq inhibit-startup-message t)

(defvar my-auto-save-folder "~/.emacs.d/.saves/"
  "Directory used for Emacs backups.")

(setq backup-directory-alist `(("." . ,my-auto-save-folder)))
(setq auto-save-file-name-transforms `((".*" ,my-auto-save-folder t)))
(setq create-lockfiles nil)

(setq require-final-newline t)
(setq-default indent-tabs-mode nil)

(define-key minibuffer-local-map (kbd "C-w") 'backward-kill-word)

(setq initial-frame-alist '((fullscreen . maximized)))

(provide 'my-core)
