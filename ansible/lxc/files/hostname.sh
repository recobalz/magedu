#!/bin/bash
Ip=`ifconfig |grep "Bcast" |awk {'print $2'} |cut -d: -f2`
HostName=`grep $Ip /etc/hosts |awk {'print $2'}`
hostname $HostName
echo -e "NETWORK=yes\nHOSTNAME=$HostName"