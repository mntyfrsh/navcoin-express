#!/bin/bash

log=/home/odroid/navdroid/express/log/reboot.log
touch $log
chmod 777 $log

now=$(date +"%m-%d-%Y %T")

echo "${now} - rebooting" >> $log

sudo /sbin/shutdown -r now >> $log

echo "script finished" >> $log
