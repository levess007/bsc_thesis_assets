#!/bin/ash

VIP=$1
RIP=$2
MASK=$3

arptables -F
arptables -A INPUT -d $VIP -j DROP
arptables -A OUTPUT -s $VIP -j mangle --mangle-ip-s $RIP

ip link add dummy1 type dummy
ip a add $VIP/$MASK dev dummy1
