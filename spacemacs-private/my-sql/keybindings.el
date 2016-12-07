(spacemacs/set-leader-keys-for-major-mode 'sql-mode
  "sc" 'sql-connect
  "ee" 'sql-send-paragraph
  "er" 'sql-send-region)

(evil-define-key 'normal sql-interactive-mode-map ";" 'evil-repeat-find-char)
(evil-define-key 'visual sql-interactive-mode-map ";" 'evil-repeat-find-char)
