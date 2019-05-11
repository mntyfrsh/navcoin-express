#!/bin/bash

log=/home/odroid/navdroid/express/log/update-ui.log
touch $log
chmod 777 $log

now=$(date +"%m-%d-%Y %T")
echo "${now} - restart ui" >> $log

/usr/bin/sudo /bin/systemctl restart navcoin-express
/usr/bin/sudo /bin/systemctl restart navcoin-angular

exit 0
