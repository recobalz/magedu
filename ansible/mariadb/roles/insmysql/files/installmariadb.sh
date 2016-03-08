#!/bin/bash
tar -xf /root/mariadb-5.5.36-linux-x86_64.tar.gz -C /usr/local
cd /usr/local
ln -sv mariadb-5.5.36-linux-x86_64 mysql
mkdir -pv /mydata/{data,binlogs,relaylogs}
useradd -r mysql
chown -R mysql.mysql /mydata/
cd /usr/local/mysql
chown -R root.mysql ./*
mkdir /etc/mysql
cp /root/my.cnf /etc/mysql/my.cnf
cp /usr/local/mysql/support-files/mysql.server /etc/rc.d/mysqld
chmod +x /etc/rc.d/init.d/mysqld
chkconfig --add mysqld
scripts/mysql_install_db --datadir=/mydata/data/ --user=mysql
service mysqld start
