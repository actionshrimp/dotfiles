(setq sql-connection-alist
      '(("social-v1"
         (sql-product
          (quote postgres))
         (sql-user "social")
         (sql-server "localhost")
         (sql-database "social")
         (sql-port 5436))
        ("social-local"
         (sql-product
          (quote postgres))
         (sql-user "social")
         (sql-server "localhost")
         (sql-database "social")
         (sql-port 5432))
        ("social-beta1"
         (sql-product
          (quote postgres))
         (sql-user "social")
         (sql-server "localhost")
         (sql-database "social")
         (sql-port 5437))
        ("social-beta2"
         (sql-product
          (quote postgres))
         (sql-user "social")
         (sql-server "localhost")
         (sql-database "social")
         (sql-port 5438))
        ("social-beta3"
         (sql-product
          (quote postgres))
         (sql-user "social")
         (sql-server "localhost")
         (sql-database "social")
         (sql-port 5439))))

(setq-default sql-product 'postgres)
(setq sql-database "social")
(setq sql-server "localhost")
(setq sql-user "social")
