#!/bin/bash

log=/home/odroid/navdroid/express/log/update-ui.log
touch $log
chmod 777 $log

now=$(date +"%m-%d-%Y %T")
echo "${now} - restart ui" >> $log

systemctl stop navcoin-express
systemctl stop navcoin-angular

systemctl start navcoin-express
systemctl start navcoin-angular
