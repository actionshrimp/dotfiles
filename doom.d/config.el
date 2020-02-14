;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Dave Aitken"
      user-mail-address "dave.aitken@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "monospace" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-one)

;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/org/")

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

(map! :v "s" #'evil-surround-region)
(map! :n "[ l" #'flycheck-previous-error)
(map! :n "] l" #'flycheck-next-error)
(map! :leader (:prefix-map ("g" . "git") "s" #'magit-status))
(map! :leader "s c" #'evil-ex-nohighlight)

(map! :leader (:prefix-map ("m" . "major") "g g" #'+lookup/definition))
(map! :leader :mode #'merlin-mode-map (:prefix-map ("m" . "major") "h t" #'merlin-type-enclosing))

(map! :n "R" #'evil-multiedit-match-all)
(map! :v "R" #'evil-multiedit-match-all)
(map! :n "M-n" #'evil-multiedit-match-and-next)
(map! :v "M-n" #'evil-multiedit-match-and-next)
(map! :n "M-p" #'evil-multiedit-match-and-prev)
(map! :v "M-p" #'evil-multiedit-match-and-prev)

(setq company-idle-delay nil)
(setq flycheck-check-syntax-automatically '(save idle-buffer-switch mode-enabled))
(setq safe-local-variable-values
      '((refmt-command . esy)
        (merlin-command . esy)))

(setq refmt-show-errors nil)

(use-package evil-nerd-commenter
  :config
  (map! :leader (:prefix-map ("c" . "code") "l" #'evilnc-comment-or-uncomment-lines)))

(map! :leader "/" #'+default/search-project)

(map! :leader "SPC" #'counsel-M-x)
(map! :leader "ry" #'counsel-yank-pop)
