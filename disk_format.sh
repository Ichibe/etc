#!/bin/sh

disks=("/dev/sdc" "dev/sdd" "/dev/sde" "/dev/sdf" "/dev/sdg")
for i in ${array[@]}
do
  sudo fdisk [${i}]
  sudo mkfs.xfs [${i}]1
done

