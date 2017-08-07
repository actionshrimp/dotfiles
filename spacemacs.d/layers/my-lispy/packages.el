(defconst my-lispy-packages
  '(lispy
    (evil-lispy :location (recipe :fetcher github
                                  :repo "sp3ctum/evil-lispy"
                                  :branch "master"))))

(defun my-lispy/init-lispy ()
  (use-package lispy
    :defer t
    :config (spacemacs|diminish lispy-mode "" "")))

(defun my-lispy/init-evil-lispy ()
  (use-package evil-lispy
    :defer t
    :init (progn (add-hook 'emacs-lisp-mode-hook #'evil-lispy-mode)
                 (add-hook 'clojure-mode-hook #'evil-lispy-mode)
                 (evil-lispy-layer-configure-colorization))
    :commands (evil-lispy-mode)
    :config (progn
              (spacemacs|diminish evil-lispy-mode " Ⓛ" " L")

              (when (configuration-layer/package-usedp 'cider)

                ;; todo better mechanism of loading cider
                (require 'cider)
                ;; show eval results in a cider overlay, next to point
                (add-to-list 'lispy-compat 'cider)
                (setq lispy-eval-display-style 'overlay)))))

;; todo yanking marked stuff is broken

(defun evil-lispy-layer-configure-colorization ()
  ;; this will be displayed in the modeline
  (let ((mode-color "light sea green"))

    (defface spacemacs-lispy-face
      `((t :inherit 'mode-line
           :background ,mode-color))
      "lispy state face."
      :group 'spacemacs)

    (setq evil-lispy-state-cursor '(mode-color box))

    (setq evil-lispy-state-cursor
          (list (when dotspacemacs-colorize-cursor-according-to-state mode-color)
                'box))))
