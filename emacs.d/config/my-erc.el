;; Example ~/.erc-local.el file:

;; NB: The irc. is missing
;; (setq erc-autojoin-channels-alist
;;       '(("freenode.net" "#emacs" "#clojure")
;;         ("another.com" "#channel-a" "#channel-b")
;;         ))

;; (setq erc-nickserv-passwords
;;       '((freenode (("actual-nick" . "PASSWORD")))))

;; (erc :server "irc.freenode.net" :port 6667 :nick "nickname")
;; For an SSL irc server:
;; (erc-tls :server "irc.xxx.com" :port 6697 :nick "nickname")

(defun erc-connect ()
  (interactive)
  (if (file-exists-p "~/.erc-local.el")
    (load-file "~/.erc-local.el")
    (print "Could not find ~/.erc-local.el")))

(defun helm-erc-buffer-list ()
      (mapcar 'buffer-name (erc-buffer-list)))

(defvar helm-source-erc-channel-list
  '((name . "ERC Channels")
    (volatile)
    (delayed)
    (candidates-process . helm-erc-buffer-list)
    (action . helm-switch-to-buffer)))

(defun helm-erc ()
  "Use helm to select an active ERC buffer.
  Replaces erc-iswitchb, which doesn't work for me."
  (interactive)
  (helm :sources '(helm-source-erc-channel-list)
        :buffer "*helm-erc-channels*"))

(evil-define-key 'normal global-map (kbd "C-c i") 'helm-erc)
(evil-define-key 'emacs global-map (kbd "C-c i") 'helm-erc)

(setq erc-prompt-for-nickserv-password nil)
(erc-notifications-mode 1)
(erc-services-mode 1)
(provide 'my-erc)
