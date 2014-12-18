(use-package solarized-theme
    :ensure solarized-theme
    :demand
    :config (load-theme 'solarized-dark))

(setq s-base00    "#657b83"
      s-base01    "#586e75"
      s-base02    "#073642"
      s-base03    "#002b36"
      s-base0     "#839496"
      s-base1     "#93a1a1"
      s-base2     "#eee8d5"
      s-base3     "#fdf6e3"
      s-yellow    "#b58900"
      s-orange    "#cb4b16"
      s-red       "#dc322f"
      s-magenta   "#d33682"
      s-violet    "#6c71c4"
      s-blue      "#268bd2"
      s-cyan      "#2aa198"
      s-green     "#859900")

(set-default-font "Ubuntu Mono 15")
(add-to-list 'default-frame-alist
             '(font . "Ubuntu Mono 15"))

(provide 'my-theme)
