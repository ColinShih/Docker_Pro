#!/bin/sh
mkdir -p /data/mysql/data
chown -R mysql:mysql /data/mysql
echo "Initializing database.."
mysqld --initialize-insecure --datadir=/data/mysql/data --user=mysql
sleep 5
echo "Starting mysql.."
mysqld_safe --user=mysql &
sleep 5
if [ -z "$MYSQL_ROOT_PASSWORD" ];then
   echo "Pls input value MYSQL_ROOT_PASSWORD, container exit.."
   exit 1
else
   echo "Setting root password.."
   mysqladmin -uroot password $MYSQL_ROOT_PASSWORD
   mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES on *.* to 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION"
   echo "Setting password done.."
   sleep 3
   mysqladmin -uroot -p$MYSQL_ROOT_PASSWORD -S /data/mysql/mysql.sock shutdown
#killall mysqld
#sleep 5
   mysqld_safe --user=mysql
fi
