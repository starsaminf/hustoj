#!/bin/bash
DIRECTORY="/home/judge/data/mysql"
if [ ! -d $DIRECTORY ]; then
	mv  /var/lib/mysql /data
else
	rm -R /var/lib/mysql
fi
ln -s $DIRECTORY /var/lib/mysql

chmod 775 -R /data/data 
chgrp -R www-data /data/data
chmod 770 -R /data/upload 
chgrp -R www-data /data/upload
chmod 770 -R /data/judge.conf 
chgrp -R www-data /data/judge.conf
chmod 770 -R /data/db_info.inc.php
chgrp -R www-data /data/db_info.inc.php

#chown -R mysql:mysql /var/lib/mysql 
chown -R mysql:mysql /data/mysql/

service mysql start
/usr/bin/judged
php5-fpm
service nginx start

/bin/bash  
exit 0 


