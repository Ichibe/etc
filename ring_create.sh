#!/bin/bash

CMD=swift-ring-builder

ports=(6202 6201 6200)
servers=("172.30.100.105" "172.30.100.107")
disks=("dv01" "dv02" "dv03" "dv04" "dv05")

create_ring(){
$CMD $1 create 10 3 1
for server in ${servers[@]}
do
  for disk in ${disks[@]}
  do
     $CMD $1 add r1z1-${server}:$2/${disk} 1
  done
done

$CMD $1 rebalance
}


create_ring "account.builder" 6202
create_ring "container.builder" 6201
create_ring "object.builder" 6200
