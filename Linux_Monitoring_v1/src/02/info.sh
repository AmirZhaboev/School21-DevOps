#!/bin/bash

HOSTNAME=$(hostname)
TIMEZONE=$(timedatectl | awk '/Time zone/ {print $3, $4, $5}')
USER=$(whoami)
OS=$(cat /etc/issue | awk '{print $1, $2, $3}')
DATE=$(date +"%d %b %Y %T")
UPTIME=$(uptime -p)
UPTIME_SEC=$(cat /proc/uptime | awk '{print $1}')
IP=$(ip -4 a s enp0s3 | awk '/inet/ {print $2}')
MASK=$(ifconfig enp0s3 | awk '/netmask/ {print $4}')
GATEWAY=$(ip r | awk '/default/ {print $3}')
RAM_TOTAL=$(free -m | awk '/Mem:/ {printf "%.3f GB", $2/1024}')
RAM_USED=$(free -m | awk '/Mem:/ {printf "%.3f GB", $3/1024}')
RAM_FREE=$(free -m | awk '/Mem:/ {printf "%.3f GB", $4/1024}')
SPACE_ROOT=$(df / | awk 'NR==2 {printf "%.2f MB", $2/1024}')
SPACE_ROOT_USED=$(df / | awk 'NR==2 {printf "%.2f MB", $3/1024}')
SPACE_ROOT_FREE=$(df / | awk 'NR==2 {printf "%.2f MB", $4/1024}')

echo "HOSTNAME" "$HOSTNAME"
echo "TIMEZONE" "$TIMEZONE"
echo "USER" "$USER"
echo "OS" "$OS"
echo "DATE" "$DATE"
echo "UPTIME" "$UPTIME"
echo "UPTIME_SEC" "$UPTIME_SEC"
echo "IP" "$IP"
echo "MASK" "$MASK"
echo "GATEWAY" "$GATEWAY"
echo "RAM_TOTAL" "$RAM_TOTAL"
echo "RAM_USED" "$RAM_USED"
echo "RAM_FREE" "$RAM_FREE"
echo "SPACE_ROOT" "$SPACE_ROOT"
echo "SPACE_ROOT_USED" "$SPACE_ROOT_USED"
echo "SPACE_ROOT_FREE" "$SPACE_ROOT_FREE"