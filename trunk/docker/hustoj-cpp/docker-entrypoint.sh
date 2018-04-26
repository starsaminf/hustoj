#!/bin/bash
DIRECTORY="/home/judge/mysql"
if [ ! -d $DIRECTORY ]; then
	mv  /var/lib/mysql /home/judge/mysql
else
	rm -R /var/lib/mysql
fi
ln -s $DIRECTORY /var/lib/mysql

chown -R mysql:mysql /home/judge/mysql

cd /home/judge/src/core/
chmod +x install.sh
./install.sh
service mysql start
/etc/init.d/judged start
/usr/bin/judged
php5-fpm
service nginx start

/bin/bash  
exit 0 


