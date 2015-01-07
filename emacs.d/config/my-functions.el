(defun my-next-user-buffer ()
  "Switch to the next user buffer.
 (buffer name does not start with “*”.)"
  (interactive)
  (let (original-buffer (buffer-name))
    (next-buffer)
    (let ((i 0))
      (while (and (or (string-equal "*" (substring (buffer-name) 0 1))
                      (string-equal "ERC" mode-name))
                  (< i 20))
        (setq i (1+ i)) (next-buffer))
      (if (= i 20) (switch-to-buffer original-buffer)))))

(defun my-previous-user-buffer ()
  "Switch to the previous user buffer.
 (buffer name does not start with “*”.)"
  (interactive)
  (let (original-buffer (buffer-name))
    (previous-buffer)
    (let ((i 0))
      (while (and (or (string-equal "*" (substring (buffer-name) 0 1))
                      (string-equal "ERC" mode-name))
                  (< i 20))
        (setq i (1+ i)) (previous-buffer))
      (if (= i 20) (switch-to-buffer original-buffer)))))

(provide 'my-functions)
