#!/bin/bash

#
# Build navcoin-angular package
#
# Do not run this script from /tmp unless you are root because
# the package is written to a directory directly above the
# current directory
#

VERSION="1.0.0"

## Set architecture
dpkg -l | grep -i odroid > /dev/null 2>&1
ODROID=$?
if [ $ODROID -eq 0 ]; then
        ARCH="armhf"
else
        ARCH=`uname -m`
fi

echo "Architecture: $ARCH" >> debian_files/DEBIAN/control


# compile node modules
npm i

# create temp directory
mkdir -p ../ne-build/debian/DEBIAN
mkdir -p ../ne-build/debian/opt/navcoin-express
mkdir -p ../ne-build/debian/etc/systemd/system
mkdir -p ../ne-build/debian/etc/logrotate.d
mkdir -p ../ne-build/debian/etc/sudoers.d

# copy files
cp -p debian_files/DEBIAN/* ../ne-build/debian/DEBIAN/
cp -p debian_files/etc/systemd/system/* ../ne-build/debian/etc/systemd/system/
cp -p debian_files/etc/logrotate.d/* ../ne-build/debian/etc/logrotate.d/
cp -p debian_files/etc/sudoers.d/* ../ne-build/debian/etc/sudoers.d/
cp -pr `pwd`/. ../ne-build/debian/opt/navcoin-express/
rm -rf ../ne-build/debian/opt/navcoin-express/.git*

# build package
cd ../ne-build/
# compute md5sum
find . -type f ! -regex '.*.hg.*' ! -regex '.*?debian-binary.*' ! -regex '.*?DEBIAN.*' -printf '%P ' | xargs md5sum > debian/DEBIAN/md5sums
dpkg --build debian
mv debian.deb ../navcoin-express_${VERSION}-1_$ARCH.deb
cd ..
rm -rf ne-build

echo
echo "Package is ready at `pwd`/navcoin-express_${VERSION}-1_$ARCH.deb"
echo
echo "Install using: dpkg -i navcoin-express_${VERSION}-1_$ARCH.deb"
echo
