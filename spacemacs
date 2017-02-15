;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;;(auto-completion :variables
     ;;                 auto-completion-return-key-behavior 'complete
     ;;                 auto-completion-tab-key-behaviour 'cycle
     ;;                 auto-completion-complete-with-key-sequence nil
     ;;                 auto-completion-complete-with-key-sequence-delay 0.5)
     my-evil
     auto-completion
     helm
     emacs-lisp
     git
     markdown
     org
     (shell :variables shell-default-height 30 shell-default-position 'bottom)
     syntax-checking
     (version-control :variables
                      version-control-diff-tool 'diff-hl)
     clojure
     (haskell :variables
              haskell-enable-ghci-ng-support t
              haskell-completion-backend 'intero)
     javascript
     shell-scripts
     html
     sql
     elm
     yaml
     purescript
     ruby
     idris
     ;;fix-muscle-memory
     my-clojure
     my-evil-lisp
     my-sql
     ;;my-js-json
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(editorconfig)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.

  (setq-default
   exec-path-from-shell-check-startup-files nil
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed.
   dotspacemacs-startup-banner nil
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(solarized-dark
                         solarized-light
                         spacemacs-light
                         spacemacs-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Fira Mono"
                               :size 12
                               :weight thin
                               :width normal
                               :powerline-scale 1.0)

   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to miminimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state t
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup 'all

   psci/arguments '("src/*.purs" "src/**/*.purs" "bower_components/purescript-*/src/**/*.purs")
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
  It is called immediately after `dotspacemacs/init'.  You are free to put any
  user code."
  ;;(global-linum-mode)
  (add-to-list 'exec-path "~/.cabal/bin/")
  (add-hook 'js2-mode-hook 'js2-mode-hide-warnings-and-errors)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
  This function is called at the very end of Spacemacs initialization after
  layers configuration. You are free to put any user code."
  (define-globalized-minor-mode global-fci-mode fci-mode
    (lambda ()
      (setq fci-rule-color "#073642")
      (setq fci-rule-width 4)
      (fci-mode 1)))
  (global-fci-mode)

  (when (eq system-type 'darwin)
    (setq mac-command-modifier 'meta)
    (setq mac-option-modifier nil))

  (spacemacs/set-leader-keys-for-major-mode 'purescript-mode
    "ma" 'psc-ide-load-all
    "mq" 'psc-ide-server-quit)

  (spacemacs/set-leader-keys "gg" 'magit-dispatch-popup)
  (spacemacs/set-leader-keys "gL" 'magit-log-buffer-file)

  (spacemacs/set-leader-keys "w SPC" 'ace-window)
  (spacemacs/set-leader-keys "j SPC" 'evil-avy-goto-char)

  (evil-ex-define-cmd "W" "write")
  (evil-ex-define-cmd "Q" "q")

  (global-unset-key (kbd "M-c"))
  (setq neo-vc-integration nil)
  ;;(global-flycheck-mode)

  (unless (server-running-p)
    (server-start))

  (setq haskell-process-wrapper-function
        (lambda (args)
          (append args (list "--with-ghc" "ghci-ng"))))

  (spacemacs/set-leader-keys-for-major-mode 'haskell-mode
    "mht"  'ghc-show-type)

  (setq cider-pprint-fn 'fipp)

  (setq evil-magic 'very-magic)
  (setq evil-move-beyond-eol t)

  (evil-add-hjkl-bindings flycheck-errors-mode-map 'emacs
    (kbd "C-w C-w") 'other-window)

  ;;(setq x-select-enable-clipboard nil)

  (setq backup-directory-alist `(("." . "~/.backups/emacs/backup")))
  (setq backup-by-copying t)
  (setq auto-save-file-name-transforms `((".*" "~/.backups/emacs/auto-save" t)))
  (setq create-lockfiles nil)
  (setq helm-ag-use-temp-buffer t))

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#657b83"])
 '(cider-prompt-for-symbol nil)
 '(cider-prompt-save-file-on-load t t)
 '(cider-repl-pop-to-buffer-on-connect nil t)
 '(clean-aindent-mode t)
 '(cljr-sort-comparator
   (lambda
     (s1 s2)
     (cl-flet*
         ((extract-segments
           (s)
           (s-split "\\." s))
          (shared-segments
           (s)
           (->>
            (extract-segments
             (cljr--extract-sexp-content s))
            (mapcar*
             (function string=)
             (extract-segments
              (clojure-find-ns)))
            (seq-take-while
             (function identity)))))
       (let
           ((shared-length-s1
             (length
              (shared-segments s1)))
            (shared-length-s2
             (length
              (shared-segments s2))))
         (if
             (/= shared-length-s1 shared-length-s2)
             (> shared-length-s1 shared-length-s2)
           (cljr--string-natural-comparator s1 s2))))))
 '(clojure-align-binding-forms
   (quote
    ("let" "when-let" "when-some" "if-let" "if-some" "binding" "loop" "doseq" "for" "with-open" "with-local-vars" "with-redefs")))
 '(clojure-defun-indents nil)
 '(compilation-message-face (quote default))
 '(css-indent-offset 2)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(editorconfig-mode t)
 '(evil-search-module (quote evil-search))
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#073642")
 '(fix-muscle-memory-problem-words
   (quote
    (("iamge" . "image")
     ("offlein" . "offline")
     ("seperate" . "separate"))))
 '(fix-muscle-memory-use-emoji t)
 '(flycheck-check-syntax-automatically (quote (save mode-enabled)))
 '(flycheck-checkers
   (quote
    (elm ada-gnat asciidoc c/c++-clang c/c++-gcc c/c++-cppcheck cfengine chef-foodcritic coffee coffee-coffeelint coq css-csslint d-dmd emacs-lisp emacs-lisp-checkdoc erlang eruby-erubis fortran-gfortran go-gofmt go-golint go-vet go-build go-test go-errcheck go-unconvert groovy haml handlebars haskell-stack-ghc haskell-ghc haskell-hlint html-tidy jade javascript-eslint javascript-jshint javascript-gjslint javascript-jscs javascript-standard json-jsonlint json-python-json less lua-luacheck lua perl perl-perlcritic php php-phpmd php-phpcs processing puppet-parser puppet-lint python-flake8 python-pylint python-pycompile r-lintr racket rpm-rpmlint markdown-mdl rst-sphinx rst ruby-rubocop ruby-rubylint ruby ruby-jruby rust-cargo rust sass scala scala-scalastyle scss-lint scss sh-bash sh-posix-dash sh-posix-bash sh-zsh sh-shellcheck slim sql-sqlint tex-chktex tex-lacheck texinfo typescript-tslint verilog-verilator xml-xmlstarlet xml-xmllint yaml-jsyaml yaml-ruby psc)))
 '(flycheck-display-errors-function (quote flycheck-pos-tip-error-messages))
 '(flycheck-emacs-lisp-load-path (quote inherit))
 '(flycheck-global-modes
   (quote
    (haskell-mode json-mode js2-mode coffee-mode sh-mode web-mode slim-mode scss-mode sass-mode pug-mode less-mode haml-mode yaml-mode purescript-mode enh-ruby-mode ruby-mode)))
 '(flycheck-pos-tip-mode nil)
 '(flycheck-pos-tip-timeout 1)
 '(flycheck-standard-error-navigation nil)
 '(global-flycheck-mode t)
 '(global-whitespace-mode nil)
 '(haskell-hoogle-command "stack hoogle")
 '(haskell-process-suggest-hoogle-imports t)
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
 '(indent-tabs-mode nil)
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(magit-merge-arguments (quote ("--no-ff")))
 '(magit-rebase-arguments (quote ("--autostash")))
 '(neo-auto-indent-point t t)
 '(nrepl-log-messages nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
    (packed auto-complete alert simple-httpd json-snatcher json-reformat haml-mode web-completion-data dash-functional ghc edn multiple-cursors paredit peg queue markdown-mode inflections bind-key tern iedit bind-map highlight request projectile skewer-mode magit-popup git-commit purescript-mode inf-ruby pcre2el idris-mode prop-menu erc-yt erc-view-log erc-terminal-notifier erc-social-graph erc-image erc-hl-nicks cider clojure-mode hydra js2-mode xterm-color web-beautify spaceline rake persp-mode paradox spinner neotree helm-make git-timemachine flycheck-pos-tip evil-mc emmet-mode elm-mode dumb-jump smartparens helm helm-core haskell-mode flycheck yasnippet magit with-editor company dash zenburn-theme yaml-mode ws-butler window-numbering which-key web-mode volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit sql-indent spacemacs-theme solarized-theme smeargle slim-mode shell-pop scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe restart-emacs rbenv rainbow-delimiters quelpa pug-mode psci psc-ide powerline pos-tip popwin orgit org-projectile org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file multi-term move-text monokai-theme mmm-mode minitest markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode linum-relative link-hint less-css-mode json-mode js2-refactor js-doc intero insert-shebang info+ indent-guide ido-vertical-mode hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-purpose helm-projectile helm-mode-manager helm-hoogle helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haskell-snippets google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md flycheck-haskell flycheck-elm flx-ido fix-muscle-memory fish-mode fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-smartparens evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eshell-z eshell-prompt-extras esh-help elisp-slime-nav diff-hl define-word company-web company-tern company-statistics company-shell company-ghci company-ghc company-cabal column-enforce-mode coffee-mode cmm-mode clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu chruby bundler auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(projectile-use-git-grep t)
 '(psc-ide-add-import-on-completion t t)
 '(psc-ide-rebuild-on-save nil t)
 '(ring-bell-function (quote ignore))
 '(safe-local-variable-values
   (quote
    ((eval define-clojure-indent
           (lazy-seq 0)
           (match 1)
           (try+ 0)
           (pdoseq 2))
     (eval define-clojure-indent
           (lazy-seq 0)
           (match 1)
           (try+ 0))
     (eval define-clojure-indent
           (lazy-seq 0)
           (match 1)
           (try+ 0)
           (deftype
               (quote defun)))
     (eval define-clojure-indent
           (mlet 1)
           (lazy-seq 0)
           (match 1)
           (try+ 0)
           (deftype
               (quote defun)))
     (cider-boot-parameters . "cider repl -s wait")
     (js-indent-level . 2)
     (js2-basic-offset . 2)
     (eval define-clojure-indent
           (mlet 1)
           (lazy-seq 0)
           (match 1)
           (try+ 0))
     (cider-refresh-after-fn . "bounce.core/start!")
     (cider-refresh-before-fn . "bounce.core/stop!")
     (cider-cljs-lein-repl . "(user/cljs-repl)")
     (cider-cljs-repl . "(user/cljs-repl user/foo-system)")
     (css-indent-offset . 2)
     (eval define-clojure-indent
           (assoc 1)
           (dissoc 1)
           (lazy-seq 0)
           (db-transaction 1)
           (GET
            (quote defun))
           (DELETE
            (quote defun))
           (PUT
            (quote defun))
           (POST
            (quote defun))
           (ANY
            (quote defun))
           (context
            (quote defun))
           (routes
            (quote defun))
           (facts
            (quote defun))
           (fact
            (quote defun))
           (try+ 0)
           (doto-let 1)
           (match
            (quote defun))
           (mlet 1)
           (deftype
               (quote defun)))
     (cider-refresh-after-fn . "yoyo/start!")
     (cider-refresh-before-fn . "yoyo/stop!"))))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(solarized-distinct-doc-face t)
 '(solarized-use-variable-pitch nil)
 '(sp-highlight-pair-overlay nil)
 '(tab-always-indent (quote complete))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(vc-follow-symlinks nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(whitespace-style
   (quote
    (face tabs trailing space-before-tab newline indentation empty space-after-tab tab-mark newline-mark)))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-deprecated-face ((t (:background "dark slate gray" :slant italic))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(sp-pair-overlay-face ((t (:inherit nil))))
 '(whitespace-empty ((t (:foreground "#073642" :inverse-video t))))
 '(whitespace-newline ((t (:foreground "dark slate gray")))))
)
