#!/bin/bash
date=`date +%m-%d-%H%M%S`

mkdir -p $date

for i in {1..200}
do
	ab -q -n 50 -c 5 -B 192.168.110.$i -g $date/$i.tsv http://10.200.0.253/ > /dev/null 2>&1 &
done
echo fin
