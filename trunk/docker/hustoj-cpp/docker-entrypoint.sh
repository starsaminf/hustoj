#!/bin/bash
DIRECTORY="/home/judge/mysql"
if [ ! -d $DIRECTORY ]; then
	mv  /var/lib/mysql /home/judge/mysql
else
	rm -R /var/lib/mysql
fi
ln -s $DIRECTORY /var/lib/mysql

chown -R mysql:mysql /home/judge/mysql

service mysql start
/usr/bin/judged
php5-fpm
service nginx start

/bin/bash  
exit 0 


