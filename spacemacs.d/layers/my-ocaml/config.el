;; Noop to stop tuareg-abbrev-hook error popping up when hitting escape
;; (defun tuareg-abbrev-hook ()
;;   ())

(defvar my-ocaml/format-on-save nil)

(spacemacs|add-toggle my-ocaml/ocamlformat-on-save
  :documentation "Toggle ocamlformat"
  :status my-ocaml/format-on-save
  :on (progn (setq my-ocaml/format-on-save t))
  :off (progn (setq my-ocaml/format-on-save nil)))
