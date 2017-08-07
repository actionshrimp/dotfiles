(dolist (m '(clojure-mode clojurec-mode clojurescript-mode clojurex-mode))
  (spacemacs/set-leader-keys-for-major-mode m
    "ep" 'cider-pprint-eval-last-sexp))
