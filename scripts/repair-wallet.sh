#!/bin/bash

/usr/bin/sudo /bin/systemctl stop navcoin

echo "sleeping for 10s..."
echo
sleep 10s

/usr/bin/sudo /bin/systemctl start navcoin-repair

echo "DONE"
echo

exit 0
