#!/bin/bash

#
# Build navcoin-angular package
#
# Do not run this script from /tmp unless you are root because
# the package is written to a directory directly above the
# current directory
#

VERSION="1.0.0"
ARCH=`uname -a | awk '{ print $13}'`

# compile node modules
npm i

# create temp directory
mkdir -p ../ne-build/debian/DEBIAN
mkdir -p ../ne-build/debian/opt/navcoin-express
mkdir -p ../ne-build/debian/etc/systemd/system

# copy files
cp -p debian_files/DEBIAN/* ../ne-build/debian/DEBIAN/
cp -p debian_files/etc/systemd/system/* ../ne-build/debian/etc/systemd/system/
cp -pr `pwd`/. ../ne-build/debian/opt/navcoin-express/

# build package
cd ../ne-build/
dpkg --build debian
mv debian.deb ../navcoin-express_${VERSION}_$ARCH.deb
cd ..
rm -rf ne-build

echo
echo "Package is ready at `pwd`/navcoin-express_${VERSION}_$ARCH.deb"
echo
echo "Install using: dpkg -i navcoin-express_${VERSION}_$ARCH.deb"
echo
