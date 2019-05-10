#!/bin/bash

# this script has been deprecated since we now start via systemd

/usr/bin/sudo /bin/systemctl stop navcoin
/usr/bin/sudo /bin/systemctl stop navcoin-repair

sleep 10

/usr/bin/sudo /bin/systemctl start navcoin
/usr/bin/sudo /bin/systemctl start navcoin-express
/usr/bin/sudo /bin/systemctl start navcoin-angular


echo "DONE"
echo
