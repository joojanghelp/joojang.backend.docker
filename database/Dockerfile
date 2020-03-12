FROM ubuntu:latest
LABEL maintainer="psmever <psmever@gmail.com>"

EXPOSE 3306

ENV DEBIAN_FRONTEND noninteractive
# ENV LC_ALL=ko_KR.UTF-8

ARG OS_LOCALE

ENV TZ=Asia/Seoul

RUN mkdir /root/mysql
COPY ./config/mysql_init.sh /root/mysql/mysql_init.sh

RUN chmod +x /root/mysql/mysql_init.sh

COPY ./config/start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

RUN apt-get -y update
RUN apt-get -y upgrade

RUN apt-get install -y \
    apt-utils \
    language-pack-ko \
    tzdata \
    net-tools \
    curl \
    vim \
    iputils-ping \
    unzip

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN locale-gen ko_KR.UTF-8
RUN localedef -f UTF-8 -i ko_KR ko_KR.UTF-8

RUN dpkg-reconfigure locales
RUN update-locale LANG=ko_KR.UTF-8 LC_MESSAGES=POSIX

RUN apt-get install -y software-properties-common

RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8

RUN add-apt-repository "deb [arch=amd64,arm64,ppc64el] http://mariadb.mirror.liquidtelecom.com/repo/10.4/ubuntu $(lsb_release -cs) main"

RUN apt-get -y update
RUN apt-get -y upgrade

RUN apt-get -y install mariadb-server mariadb-client

RUN sed -i 's/127.0.0.1/*/g' /etc/mysql/my.cnf
RUN sed -i -e '/\[mysqld\]/ a lower_case_table_names = 1' /etc/mysql/my.cnf

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*