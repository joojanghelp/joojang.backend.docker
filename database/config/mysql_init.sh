#!/bin/sh

exec /usr/bin/mysqld_safe --datadir=/var/lib/mysql &

mysql -uroot mysql -e "create user 'dbdev'@'localhost' identified by '1111'"
mysql -uroot mysql -e "create user 'dbdev'@'%' identified by '1111'"

mysql -uroot mysql -e "grant all privileges on *.* to 'dbdev'@'localhost'"
mysql -uroot mysql -e "grant all privileges on *.* to 'dbdev'@'%'"
mysql -uroot mysql -e "flush privileges"