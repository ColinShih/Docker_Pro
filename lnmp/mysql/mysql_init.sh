#!/bin/sh
mkdir -p /data/mysql/data
touch /data/mysql/mysql_3306.err
chown -R mysql:mysql /data/mysql
echo "Initializing database.."
mysql_install_db --datadir=/data/mysql/data --user=mysql > /dev/null
echo "Starting mysql.."
mysqld_safe --user=mysql &
sleep 5
if [ ! -z "$MYSQL_ROOT_PASSWORD" ];then
   echo "Setting root password.."
   mysqladmin -uroot password $MYSQL_ROOT_PASSWORD
   mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES on *.* to 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION"
   mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "DROP DATABASE test"
   echo "Setting password done.."
fi
sleep 3
mysqladmin -uroot -p$MYSQL_ROOT_PASSWORD -S /data/mysql/mysql.sock shutdown
#killall mysqld
#sleep 5
mysqld_safe --defaults-file=/etc/my.cnf --user=mysql
