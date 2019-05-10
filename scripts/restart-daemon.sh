#!/bin/bash

/usr/bin/sudo /bin/systemctl stop navcoin

sleep 10

/usr/bin/sudo /bin/systemctl start navcoin

exit 0
