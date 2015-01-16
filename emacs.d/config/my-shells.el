(defadvice term-sentinel (around my-advice-term-sentinel (proc msg))
  (if (memq (process-status proc) '(signal exit))
      (let ((buffer (process-buffer proc)))
        ad-do-it
        (kill-buffer buffer))
    ad-do-it))
(ad-activate 'term-sentinel)

(defvar my-term-shell "/bin/zsh")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

;(defun my-term-use-utf8 ()
;  (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
;(add-hook 'term-exec-hook 'my-term-use-utf8)

(defun my-term-hook ()
  (goto-address-mode))
(add-hook 'term-mode-hook 'my-term-hook)

(provide 'my-shells)
