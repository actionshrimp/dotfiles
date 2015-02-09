(setq company-selection-wrap-around t)

(defun company-kill-word ()
  (interactive)
  (company-abort)
  (backward-kill-word 1))

(use-package company
  :ensure company
  :diminish company-mode
  :idle
  :config (progn

            (global-company-mode)
            (evil-define-key 'insert global-map
              (kbd "C-n") 'company-complete-common)

            (define-key company-active-map (kbd "C-n") 'company-select-next)
            (define-key company-active-map (kbd "<esc>") 'company-abort)
            (define-key company-active-map (kbd "C-p") 'company-select-previous)
            (define-key company-active-map (kbd "<tab>") 'company-complete-common)


            (define-key company-active-map (kbd "C-w") 'company-kill-word)
            ))

(provide 'my-autocomplete)
