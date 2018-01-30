;; Example config. Encrypted db config is loaded in spacemacs/user-config as it requires
;; some init to be performed first on OSX (not sure what exactly, perhaps exec-path-from-shell?)

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
