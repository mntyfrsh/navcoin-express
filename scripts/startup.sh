#!/bin/bash

sudo /bin/systemctl stop navcoin
sudo /bin/systemctl stop navcoin-repair

sleep 10

sudo /bin/systemctl start navcoin
sudo /bin/systemctl start navcoin-express
sudo /bin/systemctl start navcoin-angular


echo "DONE"
echo
