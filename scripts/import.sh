#!/bin/bash
echo
echo "IMPORTING wallet.dat"
echo

log=/opt/navcoin-express/log/import-wallet.log
touch $log
chmod 777 $log

now=$(date +"%m-%d-%Y %T")
echo "${now} - importing wallet" >> $log

time=$(date +"%s")

FILE=$1

# backup old wallet.dat file
mv /home/odroid/.navcoin4/wallet.dat /home/odroid/.navcoin4/${time}_wallet.dat

/bin/cp $FILE /home/odroid/.navcoin4/wallet.dat
/usr/bin/sudo /bin/chmod 600 /home/odroid/.navcoin4/wallet.dat

/usr/bin/sudo /bin/systemctl stop navcoin
/usr/bin/sudo /bin/systemctl stop navcoin-repair

echo "sleeping for 10s..."
echo
sleep 10s

/usr/bin/sudo /bin/systemctl start navcoin-repair

echo "DONE"
echo

exit 0
