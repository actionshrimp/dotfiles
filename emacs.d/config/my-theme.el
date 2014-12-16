(use-package color-theme-solarized
  :ensure color-theme-solarized
  :defer t)

(set-default-font "Ubuntu Mono for VimPowerline 14")
(setq-default tab-width 4)

(load-theme 'solarized-dark t)
(defun theme-color (name)
  (nth 1 (assoc name solarized-colors)))

(provide 'my-theme)
