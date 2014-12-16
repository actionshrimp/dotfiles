(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode-enable)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'enable-common-lang)

(use-package slime
  :ensure slime
  :idle)

(use-package elisp-slime-nav
  :ensure elisp-slime-nav
  :commands my-jump-to-elisp-docs
  :diminish elisp-slime-nav-mode
  :idle
  :init
  (progn
    (defun my-lisp-hook ()
      (progn
        (elisp-slime-nav-mode)
        (turn-on-eldoc-mode)))
    (add-hook 'emacs-lisp-mode-hook 'my-lisp-hook)
    (add-hook 'lisp-interaction-mode-hook 'my-lisp-hook)
    (add-hook 'ielm-mode-hook 'my-lisp-hook)
    (defun my-jump-to-elisp-docs (sym-name)
      "Jump to a pane and do elisp-slime-nav-describe-elisp-thing-at-point"
      (interactive (list (elisp-slime-nav--read-symbol-at-point)))
      (help-xref-interned (intern sym-name))
      (switch-to-buffer-other-window "*Help*" t)))
  :config
  (progn
    (evil-define-key 'normal emacs-lisp-mode-map (kbd "K")
      'my-jump-to-elisp-docs)))

(provide 'my-elisp)

