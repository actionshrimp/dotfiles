(setq-default sql-product 'mysql)
(setq-default sql-password "password")
(setq-default sql-server "127.0.0.1")
(setq-default sql-user "username")
(setq-default sql-port 3306)

(with-eval-after-load "sql"
  (sql-set-product-feature 'mysql :prompt-regexp "^\\(MariaDB\\|MySQL\\) \\[[_a-zA-Z()]*\\]> ")
  (setq sql-mysql-options (list "--protocol=tcp"))
  (setq sql-mysql-login-params (append sql-mysql-login-params '(port))))

;; Example connection config. Encrypted db config is loaded in
;; spacemacs/user-config as it requires some init to be performed first on OSX
;; (not sure what exactly, perhaps exec-path-from-shell?)

;; (setq sql-connection-alist
;;  '(("db-name"
;;      (sql-product 'postgres)
;;      (sql-user "user")
;;      (sql-password "") ;;takes from ~/.pgpass
;;      (sql-server "localhost")
;;      (sql-database "dbname")
;;      (sql-port 5432))
;;    ))

;; (setq sql-connection-alist
;;  '(("db-name"
;;      (sql-product 'mysql)
;;      (sql-user "user")
;;      (sql-password "")
;;      (sql-server "localhost")
;;      (sql-database "dbname")
;;      (sql-port 3306))
;;    ))
;;(with-eval-after-load "sql"
;;  (setq sql-mysql-login-params (append sql-mysql-login-params '(port))))


;;(setq-default sql-product 'postgres)
;;(setq-default sql-database "user")
;;(setq-default sql-password "")
;;(setq-default sql-server "localhost")
;;(setq-default sql-user "dbname")
