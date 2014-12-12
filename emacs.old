;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Version check.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (< emacs-major-version 24)
  (error "This setup requires Emacs v24, or higher. You have: v%d" emacs-major-version))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Packaging setup.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(package-initialize)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

(defvar my-packages '(evil 
					  evil-leader evil-tabs evil-paredit surround
					  elscreen ace-jump-mode
					  helm helm-descbinds
					  key-chord
					  recentf smart-mode-line
					  rainbow-delimiters highlight
					  paredit smartparens
					  clojure-mode clojure-cheatsheet
					  nrepl-eval-sexp-fu ac-nrepl color-theme-solarized
					  projectile helm-projectile
					  smart-mode-line-powerline-theme flycheck neotree
					  grizzl js3-mode
					  )
  "A list of packages to check for and install at launch.")

(defun my-missing-packages ()
  (let (missing-packages)
    (dolist (package my-packages (reverse missing-packages))
      (or (package-installed-p package)
	  (push package missing-packages)))))

(defun ensure-my-packages ()
  (let ((missing (my-missing-packages)))
    (when missing
      ;; Check for new packages (package versions)
      (package-refresh-contents)
      ;; Install the missing packages
      (mapc (lambda (package)
	      (when (not (package-installed-p package))
		(package-install package)))
	    missing)
      ;; Close the compilation log.
      (let ((compile-window (get-buffer-window "*Compile-Log*")))
	(if compile-window
	    (delete-window compile-window))))))

(ensure-my-packages)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Early requirements.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'auto-complete)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Basic Vim Emulation.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(evil-mode t)
(global-evil-tabs-mode 1)

(evil-ex-define-cmd "Exp[lore]" 'dired-jump)
(evil-ex-define-cmd "color[scheme]" 'customize-themes)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Nice-to-haves...
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-auto-complete-mode t)
(global-surround-mode t)

(helm-mode t)
(helm-descbinds-mode t)
(recentf-mode t)

(if after-init-time
    (sml/setup)
  (add-hook 'after-init-hook 'sml/setup))

(evil-define-key 'normal global-map
  "\C-p" 'helm-projectile
  "q:" 'helm-complex-command-history
  "\\\\w" 'evil-ace-jump-word-mode
  ",<" 'paredit-forward-barf-sexp
  ",>" 'paredit-forward-slurp-sexp
  ",S" 'paredit-splice-sexp
  ",w" 'paredit-wrap-sexp)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Filetype-style hooks.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun standard-lisp-modes ()
  (require 'nrepl-eval-sexp-fu)
  (rainbow-delimiters-mode t)
  (require 'evil-paredit)
  (paredit-mode t)
  (evil-paredit-mode t)
  (local-set-key (kbd "RET") 'newline-and-indent))

;;; Emacs Lisp
(add-hook 'emacs-lisp-mode-hook
	  '(lambda ()
	     (standard-lisp-modes)))

(evil-define-key 'normal emacs-lisp-mode-map
  "\M-q" 'paredit-reindent-defun
  "\C-c\C-c" 'eval-defun
  "K" '(lambda ()
	 (interactive)
	 (describe-function (symbol-at-point))))

;;; Clojure
(add-hook 'clojure-mode-hook
	  '(lambda ()
	     (standard-lisp-modes)

	     (mapc '(lambda (char)
		      (modify-syntax-entry char "w" clojure-mode-syntax-table))
		   '(?- ?_ ?/ ?< ?> ?: ?' ?.))
	     
	     (require 'ac-nrepl)
	     (add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
	     (add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
	     (add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
	     (add-to-list 'ac-modes 'nrepl-mode)))

(evil-define-key 'normal clojure-mode-map
  "\M-q" 'paredit-reindent-defun
  "gK" 'nrepl-src
  "K"  'ac-nrepl-popup-doc)

(load-theme 'solarized-dark t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#e4e4e4" "#d70000" "#5f8700" "#af8700" "#0087ff" "#af005f" "#00afaf" "#808080"])
 '(auto-save-file-name-transforms (quote (("([^/])*$" "~/.backups/emacs/autosave/\\1" t))))
 '(background-color "#ffffd7")
 '(background-mode light)
 '(backup-directory-alist (quote ((".*" . "~/.backups/emacs/backups/"))))
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(cursor-color "#626262")
 '(custom-safe-themes
   (quote
	("cdc7555f0b34ed32eb510be295b6b967526dd8060e5d04ff0dce719af789f8e5" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" default)))
 '(evil-mode t)
 '(evil-paredit-mode t t)
 '(evil-want-C-u-scroll t)
 '(fci-rule-color "#073642")
 '(flycheck-checkers
   (quote
	(javascript-jscs ada-gnat asciidoc c/c++-clang c/c++-gcc c/c++-cppcheck cfengine chef-foodcritic coffee coffee-coffeelint coq css-csslint d-dmd elixir emacs-lisp emacs-lisp-checkdoc erlang eruby-erubis fortran-gfortran go-gofmt go-golint go-vet go-build go-test go-errcheck haml handlebars haskell-ghc haskell-hlint html-tidy javascript-jshint json-jsonlint less lua make perl perl-perlcritic php php-phpmd php-phpcs puppet-parser puppet-lint python-flake8 python-pylint racket rpm-rpmlint rst rst-sphinx ruby-rubocop ruby-rubylint ruby ruby-jruby rust sass scala scala-scalastyle scss sh-bash sh-posix-dash sh-posix-bash sh-zsh sh-shellcheck slim tex-chktex tex-lacheck texinfo verilog-verilator xml-xmlstarlet xml-xmllint yaml-jsyaml yaml-ruby)))
 '(foreground-color "#626262")
 '(fringe-mode (quote (5 . 0)) nil (fringe))
 '(global-flycheck-mode t nil (flycheck))
 '(global-linum-mode t)
 '(global-whitespace-mode t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
	(solarized-color-blend it "#002b36" 0.25)
	(quote
	 ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
	(("#073642" . 0)
	 ("#546E00" . 20)
	 ("#00736F" . 30)
	 ("#00629D" . 50)
	 ("#7B6000" . 60)
	 ("#8B2C02" . 70)
	 ("#93115C" . 85)
	 ("#073642" . 100))))
 '(hl-bg-colors
   (quote
	("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
	("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(js3-global-externs (quote ("module" "exports" "require")))
 '(js3-mode-show-parse-errors nil)
 '(js3-mode-show-strict-warnings nil)
 '(linum-format "%3d ")
 '(magit-diff-use-overlays nil)
 '(nlinum-format "%d")
 '(projectile-completion-system (quote grizzl))
 '(projectile-global-mode t)
 '(show-trailing-whitespace t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(speedbar-default-position (quote left))
 '(speedbar-verbosity-level 0)
 '(sr-speedbar-right-side nil)
 '(tab-width 4)
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
	((20 . "#dc322f")
	 (40 . "#ff7f00")
	 (60 . "#ffbf00")
	 (80 . "#b58900")
	 (100 . "#ffff00")
	 (120 . "#ffff00")
	 (140 . "#ffff00")
	 (160 . "#ffff00")
	 (180 . "#859900")
	 (200 . "#aaff55")
	 (220 . "#7fff7f")
	 (240 . "#55ffaa")
	 (260 . "#2affd4")
	 (280 . "#2aa198")
	 (300 . "#00ffff")
	 (320 . "#00ffff")
	 (340 . "#00ffff")
	 (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
	(unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(whitespace-style
   (quote
	(face tabs trailing space-before-tab newline indentation empty space-after-tab tab-mark newline-mark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-selection ((t (:background "blue" :foreground "white" :underline "blue"))))
 '(linum ((t (:background "black" :foreground "brightgreen"))))
 '(whitespace-newline ((t (:foreground "brightgreen" :weight normal))))
 '(whitespace-tab ((t (:background "black" :foreground "brightcyan")))))

(setq whitespace-display-mappings
      '((space-mark 32 [183] [46])
        (newline-mark 10 [172 10])
        (tab-mark 9 [8250 9])))

(flycheck-def-config-file-var flycheck-jscs javascript-jscs ".jscs.json"
 :safe #'stringp)

(flycheck-define-checker javascript-jscs
   "A JavaScript code style checker.
See URL `https://github.com/mdevils/node-jscs'."
	:command ("jscs" "--reporter" "checkstyle"
			  (config-file "--config" flycheck-jscs)
			  source)
	:error-parser flycheck-parse-checkstyle
	:modes (js-mode js2-mode js3-mode)
	:next-checkers (javascript-jshint))

(add-to-list 'flycheck-checkers 'javascript-jscs)

(add-hook 'find-file-hook
		  (lambda ()
			(setq default-directory command-line-default-directory)))

(add-hook 'neotree-mode-hook
            (lambda ()
			(define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
			(define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
			(define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
			(define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
			(define-key evil-normal-state-local-map (kbd "a") 'neotree-create-node)))

(global-set-key [f2] 'neotree-toggle)
