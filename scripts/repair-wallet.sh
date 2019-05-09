#!/bin/bash

/bin/systemctl stop navcoin

echo "sleeping for 10s..."
echo
sleep 10s

/bin/systemctl start navcoin-repair

echo "DONE"
echo

exit 0
