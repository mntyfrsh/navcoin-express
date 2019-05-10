#!/bin/bash

# Disabled and to be updated with alternate process

log=/home/odroid/navdroid/express/log/update-ui.log
touch $log
chmod 777 $log

now=$(date +"%m-%d-%Y %T")
echo "${now} - update ui" >> $log

exit 0
