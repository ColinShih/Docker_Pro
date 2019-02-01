FROM mysql:5.6

MAINTAINER ColinShih <szl_colin@163.com>

ENV MYSQL_ALLOW_EMPTY_PASSWORD yes

COPY mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
COPY mysql_init.sh /root/mysql_init.sh

RUN chmod +x /root/mysql_init.sh && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

EXPOSE 3306

ENTRYPOINT ["/root/mysql_init.sh"]
