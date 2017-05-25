#!/bin/sh

sudo apt-get update
sudo apt-get install curl gcc memcached rsync sqlite3 xfsprogs \
                     git-core libffi-dev python-setuptools \
                     liberasurecode-dev libssl-dev
sudo apt-get install python-coverage python-dev python-nose \
                     python-xattr python-eventlet \
                     python-greenlet python-pastedeploy \
                     python-netifaces python-pip python-dnspython \
                     python-mock
sudo apt-get install python-swiftclient

sudo useradd swift
sudo mkdir /etc/swift /var/run/swift /var/cache/swift /var/log/swift
sudo chown -R swift:swift /etc/swift /var/run/swift /var/cache/swift /var/log/swift
sudo chmod 777 -R /var/log/swift

disks=("/dev/sdc" "dev/sdd" "/dev/sde" "/dev/sdf" "/dev/sdg")
for i in ${array[@]}
do
  sudo fdisk [${i}]
  sudo mkfs.xfs [${i}]1
done

