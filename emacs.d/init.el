(add-to-list 'load-path (concat user-emacs-directory "config"))
(add-to-list 'load-path (concat user-emacs-directory "config" "/languages"))

(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file) (load custom-file))

(require 'package)
(package-initialize)
(setq package-enable-at-startup nil)
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

(require 'use-package)
(require 'my-core)
(require 'my-theme)

(require 'my-functions)
(require 'my-evil)
(require 'my-neotree)
(require 'my-magit)
(require 'my-whitespace)
(require 'my-helm)
(require 'my-autocomplete)
(require 'my-packages)

(require 'my-common-lang)

(require 'my-elisp)
(require 'my-javascript)
(require 'my-ruby)
(require 'my-sass)
