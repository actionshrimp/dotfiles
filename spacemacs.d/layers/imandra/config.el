(defvar imandra-cli-file-path "imandra-repl-dev") ;; script running `docker run -it --rm ..` or symlink to imandra-service
;; (defvar imandra-syntax "reason")

(defvar imandra-prompt-regexp "^#\s-")

(defvar imandra-buffer-name "*Imandra*")

(defun imandra-repl-eval-string (string &optional mode)
  (interactive)
  (with-current-buffer imandra-buffer-name
    ;; Insert it at the end of the utop buffer
    (goto-char (point-max))
    (insert string)
    (insert imandra-phrase-terminator)
    ;; Send input to utop now, telling it to automatically add the
    ;; phrase terminator
    (comint-send-input)))

(defun imandra-repl-eval (start end &optional mode)
  "Eval the given region in utop."
  ;; Select the text of the region
  (imandra-repl-eval-string (buffer-substring-no-properties start end) mode))

(defun imandra-repl-eval-region (start end)
  "Eval the current region in utop."
  (interactive "r")
  (imandra-repl-eval start end :multi))

(defun imandra-repl--ml ()
  (interactive)
  (let* ((imandra-repl-program imandra-cli-file-path))

    (apply 'make-comint-in-buffer "Imandra" imandra-buffer-name
           imandra-repl-program nil "-raw"
           '("-require" "imandra-prelude"))

    (with-current-buffer imandra-buffer-name
      (imandra-repl-mode)
      (setq-local imandra-phrase-terminator ";;"))

    (pop-to-buffer-same-window imandra-buffer-name)))

(defun imandra-repl--re ()
  (interactive)
  (let* ((imandra-repl-program imandra-cli-file-path))

    (apply 'make-comint-in-buffer "Imandra" imandra-buffer-name
           imandra-repl-program nil "-raw"
           '("-reason" "-require" "imandra-prelude"))

    (with-current-buffer imandra-buffer-name
      (imandra-repl-mode)
      (setq-local imandra-phrase-terminator ";"))

    (pop-to-buffer-same-window imandra-buffer-name)))

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

;; (add-hook 'tuareg-mode-hook
;;           (lambda ()
;;             (when (string-match "\\.iml\\'" buffer-file-name)
;;               (setq-local merlin-buffer-flags "-reader imandra -package imandra-prelude -open Imandra_prelude"))))

;; (add-hook 'reason-mode-hook
;;           (lambda ()
;;             ;; Currently doesnt quite work - something else seems to be interfering with merlin-buffer-flags (refmt?)
;;             (when (string-match "\\.ire\\'" buffer-file-name)
;;               (setq-local merlin-buffer-flags "-reader imandra-reason -package imandra-prelude -open Imandra_prelude"))))

(defun imandra--opam-config-var (var)
  (with-temp-buffer
    (if (eq (call-process-shell-command
             (concat "opam config var " var) nil (current-buffer) nil) 0)
        (replace-regexp-in-string "\n$" "" (buffer-string))
      (progn
        (message "merlin-command: opam config failed (%S)"
                 (buffer-string))
        '()))))

(add-hook 'tuareg-mode-hook
          (lambda ()
            (when (string-match "\\.iml\\'" buffer-file-name)
              (setq-local merlin-configuration-function
                          (lambda ()
                            (progn
                              (let* ((bin-path (imandra--opam-config-var "bin"))
                                     (lib-path (imandra--opam-config-var "lib"))
                                     (stublibs-path (imandra--opam-config-var "stublibs"))
                                     (env (list (concat "PATH=" bin-path)
                                                (concat "CAML_LD_LIBRARY_PATH="
                                                        stublibs-path ":"
                                                        (concat lib-path "/ocaml/stublibs") ":"
                                                        (concat lib-path "/ocaml"))))
                                     (command (concat bin-path "/imandra-merlin")))
                                (list
                                 (cons 'name "imandra")
                                 (cons 'env env)
                                 (cons 'command command)))))))))
