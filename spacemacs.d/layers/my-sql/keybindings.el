(spacemacs/set-leader-keys-for-major-mode 'sql-mode
  "sc" 'sql-connect
  "ee" 'sql-send-paragraph
  "er" 'sql-send-region)

(evil-define-key 'normal sql-interactive-mode-map ";" 'evil-repeat-find-char)
(evil-define-key 'visual sql-interactive-mode-map ";" 'evil-repeat-find-char)

;; (evil-define-key 'normal sql-interactive-mode-map (kbd "C-h") 'evil-window-left)
;; (evil-define-key 'normal sql-interactive-mode-map (kbd "C-j") 'evil-window-down)
;; (evil-define-key 'normal sql-interactive-mode-map (kbd "C-k") 'evil-window-up)
;; (evil-define-key 'normal sql-interactive-mode-map (kbd "C-l") 'evil-window-right)
