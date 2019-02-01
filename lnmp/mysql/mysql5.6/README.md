#####           for mysql5.6
## docker pull mysql:5.6   这是拉取的官方镜像mysql5.6
## DATADIR /data/mysql/data
## MYSQL_ROOT_PASSWORD is mandatory
## docker build -t mysql5.6:v1.1 .
## docker run -d --name mysql5.6 -p 3306:3306 --mount src=/data/mysql5.6,dst=/data/mysql/data -e MYSQL_ROOT_PASSWORD=1234 
##   mysql5.6:v1.1
## 查看mysqld启动的日志
### docker exec -it CONTAINERID/CONTAINERNAME tail -f /var/log/mysql/error.log
