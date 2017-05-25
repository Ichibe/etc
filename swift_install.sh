#!/bin/sh

set -e

sudo apt-get update
sudo apt-get install -y curl gcc memcached rsync sqlite3 xfsprogs \
                     git-core libffi-dev python-setuptools \
                     liberasurecode-dev libssl-dev
sudo apt-get install -y python-coverage python-dev python-nose \
                     python-xattr python-eventlet \
                     python-greenlet python-pastedeploy \
                     python-netifaces python-pip python-dnspython \
                     python-mock
sudo apt-get install -y python-swiftclient

sudo apt-get install -y yasm autoconf libtool

sudo useradd swift
sudo mkdir /etc/swift /var/run/swift /var/cache/swift /var/log/swift
sudo chown -R swift:swift /etc/swift /var/run/swift /var/cache/swift /var/log/swift
sudo chmod 777 -R /var/log/swift

 git clone https://github.com/openstack/liberasurecode.git
git clone https://github.com/01org/isa-l.git

cd liberasurecode
git checkout 1.4.0
./autogen.sh
./configure
make && sudo make install
cd -

cd isa-l
./autogen.sh
./configure --prefix=/usr --libdir=/usr/lib
make && sudo make install
sudo -

sudo ldconfig

sudo pip install --upgrade pip

git clone https://github.com/openstack/swift.git
cd swift
git checkout 2.13.0
sudo pip install -r requirements.txt
sudo python setup.py install

