(add-to-list 'load-path (concat user-emacs-directory "config"))
(add-to-list 'load-path (concat user-emacs-directory "config" "/languages"))

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(setq package-enable-at-startup nil)
(package-initialize)
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

(setq custom-file (concat user-emacs-directory "custom.el"))

(require 'use-package)
(require 'my-env)
(require 'my-core)
(require 'my-packages)
(when (file-exists-p custom-file) (load custom-file))
(require 'my-theme)

(require 'my-functions)
(require 'my-evil)
(require 'my-magit)
(require 'my-whitespace)
(require 'my-helm)
(require 'my-tree)
(require 'my-autocomplete)
(require 'my-shells)

(require 'my-common-lang)

(require 'my-elisp)
(require 'my-javascript)
(require 'my-ruby)
(require 'my-sass)
(require 'my-scala)
(require 'my-clojure)

(require 'my-erc)
