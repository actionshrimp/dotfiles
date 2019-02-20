(defvar imandra-cli-file-path "imandra-repl-dev") ;; script running `docker run -it --rm ..` or symlink to imandra-service
(defvar imandra-syntax "ocaml")

(defvar imandra-prompt-regexp "^#\s-")


(defun imandra ()
  (interactive)
  (let* ((imandra-program imandra-cli-file-path)
         (buffer-name "*Imandra*"))

    ;; (pop-to-buffer-same-window buffer-name)

    ;; (unless (comint-check-proc buffer-name)
    ;;   (apply 'make-comint-in-buffer "Imandra" buffer-name
    ;;          imandra-program nil nil "-raw"
    ;;          (if (string= imandra-syntax "reason") '("-reason") '()))
    ;;   (imandra-repl-mode))

    (apply 'make-comint-in-buffer "Imandra" buffer-name
           imandra-program nil "-raw"
           (append (if (string= imandra-syntax "reason") '("-reason") '())
                   '("-require" "imandra-prelude")))

    (with-current-buffer buffer-name
      (imandra-repl-mode))

    (pop-to-buffer-same-window buffer-name)))

(define-derived-mode imandra-repl-mode comint-mode "Imandra Repl"
  "Major mode for `imandra-repl`" nil "Imandra Repl"
  ;; (require 'tuareg)
  ;; (tuareg-install-font-lock)
  (setq comint-prompt-regexp imandra-prompt-regexp)
  (set (make-local-variable 'comint-input-sender-no-newline) t)
  (set (make-local-variable 'comint-input-sender) 'comint-simple-send)
  (set (make-local-variable 'comint-get-old-input) 'comint-get-old-input-default)
  (set (make-local-variable 'comint-process-echoes) t)
  (set (make-local-variable 'comint-prompt-read-only) t)
  ;; (set (make-local-variable 'font-lock-defaults) '(tuareg-font-lock-keywords t))
  (set (make-local-variable 'comint-eol-on-send) t))

(define-key imandra-repl-mode-map (kbd "C-c C-l") #'comint-clear-buffer)

(add-to-list 'auto-mode-alist '("\\.iml\\'" . tuareg-mode))
(add-to-list 'auto-mode-alist '("\\.ire\\'" . reason-mode))

(add-hook 'tuareg-mode-hook
          (lambda ()
            (when (string-match "\\.iml\\'" buffer-file-name)
              (setq-local merlin-buffer-flags "-reader imandra -package imandra-prelude -open Imandra_prelude"))))

(add-hook 'reason-mode-hook
          (lambda ()
            ;; Currently doesnt quite work - something else seems to be interfering with merlin-buffer-flags (refmt?)
            (when (string-match "\\.ire\\'" buffer-file-name)
              (setq-local merlin-buffer-flags "-reader imandra-reason -package imandra-prelude -open Imandra_prelude"))))
