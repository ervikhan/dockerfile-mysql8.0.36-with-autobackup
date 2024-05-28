#!/bin/sh

#AUTO START SERVICE WHEN CONTAINER IS RUNNING
service mysql start
service cron start

#CREATE USER MYSQL
mysql -u root -e "CREATE USER 'EXAMPLE_USER'@'%' IDENTIFIED BY 'EXAMPLE_PASSWD'; GRANT ALL PRIVILEGES ON *.* TO 'EXAMPLE_USER'@'%'; FLUSH PRIVILEGES;"

#RUN SHELL
/bin/bash
