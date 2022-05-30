DROP USER IF EXISTS 'admin'@'localhost';

CREATE USER 'admin'@'localhost'
IDENTIFIED BY '123456789';

GRANT 
SELECT,UPDATE,DELETE,INSERT 
ON Blog_Olivier.* TO 'admin'@'localhost';

FLUSH privileges;