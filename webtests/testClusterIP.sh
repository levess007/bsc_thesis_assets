#!/bin/bash

min=1
max=253
sleepd=0.1
target="10.10.0.1"

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --min) min="$2"; shift ;;
        --max) max="$2"; shift ;;
        --sleep) sleepd="$2"; shift ;;
        --target) target="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

if [ $min -gt $max ]
then
	temp=$min
	min=$max
	max=$temp
fi

if [ $max -gt 253 ]
then
	echo "Allowed MAX value is 253."
	exit
fi

#echo -e "SOURCE_IP\tSERVING_NODE\tPOD_IP\tHTTP_REQUEST_IP\tHTTP_REQUEST_PORT\tPOD_HOSTNAME"
for (( ip=$min ; ip<=$max; ip++ ))
do
#	echo -e -n "192.168.110.$ip\n"
	#curl --silent --interface 192.168.110.$ip --no-keepalive -H "Connection: close" $target --local-port 44444
	#curl --silent --interface 192.168.110.$ip --no-keepalive -H "Connection: close"  --connect-timeout 4 --local-port 44444 $target
	curl --silent --interface 192.168.110.$ip --no-keepalive -H "Connection: close"  $target
	sleep $sleepd
done
