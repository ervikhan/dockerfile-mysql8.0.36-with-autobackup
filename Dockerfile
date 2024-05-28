ARG IMAGE_NAME=ubuntu
ARG IMAGE_TAG=18.04

FROM ${IMAGE_NAME}:${IMAGE_TAG}

MAINTAINER ervikhan <m.ervikhan@gmail.com>
LABEL service="mysql5.7,automysqlbackup,crontab"
LABEL base_os="Ubuntu18.04"

#SET DATE
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install -y tzdata && apt clean all
ENV TZ="Asia/Jakarta"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN date

#INSTALL MYSQL 5.7
RUN apt update
RUN apt install -y mysql-server && apt clean all

#INSTALL AUTOMYSQLBACKUP
RUN DEBIAN_FRONTEND=noninteractive apt install -y automysqlbackup && apt clean all

#OVERWRITE debian.cnf
COPY ./debian.cnf /etc/mysql/
RUN chmod 600 /etc/mysql/debian.cnf

#INSTALL CRONTAB
RUN apt install cron -y && apt clean all

COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD ["./start.sh"]
