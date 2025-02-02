-- master

CREATE DATABASE abcd;
CREATE USER 'replica_user'@'%' IDENTIFIED BY '1234';
GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';
FLUSH PRIVILEGES;
SHOW MASTER STATUS;

-- slave

CREATE DATABASE abcd;
CHANGE REPLICATION SOURCE TO
SOURCE_HOST='mysql-one',
SOURCE_USER='replica_user',
SOURCE_PORT=3306,
SOURCE_PASSWORD='1234',
SOURCE_LOG_FILE='mysql-bin.000003',
SOURCE_LOG_POS=1020;
START SLAVE;
SHOW SLAVE STATUS;
