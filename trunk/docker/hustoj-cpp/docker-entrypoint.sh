#!/bin/bash
DIRECTORY="/home/judge/mysql"
if [ ! -d $DIRECTORY ]; then
	mv  /var/lib/mysql /home/judge/mysql
else
	rm -R /var/lib/mysql
fi
ln -s $DIRECTORY /var/lib/mysql

chown -R mysql:mysql /home/judge/mysql

cd /home/judge/src/core/judged
make
chmod +x judged
cp judged /usr/bin
cd ../judge_client
make
chmod +x judge_client
cp judge_client /usr/bin

service mysql start
/usr/bin/judged
php5-fpm
service nginx start

/bin/bash  
exit 0 


