#!/bin/sh
ARCH=$(uname -a);
PCPU=$(cat /proc/cpuinfo | grep "physical id" | sort | uniq | wc -l);
VCPU=$(cat /proc/cpuinfo | grep "^processor" | wc -l);
TOT_RAM=$(free -m | awk '/Mem/{print $2}');
USED_RAM=$(free -m | awk '/Mem/{print $3}');
FREE_DISK=
UDISK_PER=
UCPU_PER=
LAST_BOOT=$(who -b | sed 's/system boot //');
echo "last boot : $LAST_BOOT"
if [ $(lsblk | grep lvm | wc -l) > 0 ]; then
	LVM="yes";
else
	LVM="no";
fi
echo "lvm : $LVM"
CONNECTIONS=$(ss | wc -l);
echo "tcp connections : $CONNECTIONS"
USERS=
IPV4=$(ip address | grep 'inet ' | grep -v 'inet 127' | awk '{print $2}');
echo "ipv4 : $IPV4"
MAC=$(ip link show | awk '/link\/ether/{print $2}');
echo "MAC : $MAC"
SUDO=
