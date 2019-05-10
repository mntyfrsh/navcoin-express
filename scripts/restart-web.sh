#!/bin/bash

log=/home/odroid/navdroid/express/log/update-ui.log
touch $log
chmod 777 $log

now=$(date +"%m-%d-%Y %T")
echo "${now} - restart ui" >> $log

/usr/bin/sudo /bin/systemctl stop navcoin-express
/usr/bin/sudo /bin/systemctl stop navcoin-angular

sleep 5

/usr/bin/sudo /bin/systemctl start navcoin-express
/usr/bin/sudo /bin/systemctl start navcoin-angular
