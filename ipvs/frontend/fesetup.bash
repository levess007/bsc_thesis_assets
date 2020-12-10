#!/bin/bash

VIP=10.201.0.1
MASK=24

echo `hostname`

ip link add dummy1 type dummy
ip a add $VIP/$MASK dev dummy1

ipvsadm -A -t $VIP:80 -s mh
for i in {248..253}
do
	ipvsadm -a -t 10.201.0.1:80 -r 10.200.0.$i
done  
