#!/bin/bash
source $(dirname $0)/config.sh
XPOS=$((1030 + $XOFFSET))
WIDTH="170"
LINES="7"

essid=$(iwconfig wlan0 | sed -n "1p" | awk -F '"' '{print $2}')
mode=$(iwconfig wlan0 | sed -n "1p" | awk -F " " '{print $3}')
freq=$(iwconfig wlan0 | sed -n "2p" | awk -F " " '{print $2}' | cut -d":" -f2)
ap=$(iwconfig wlan0 | sed -n "2p" | awk -F " " '{print $6}')
mac=$(macchanger -s wlan0 | sed -n "1p" | awk -F " " '{print $3}')
qual=$(iwconfig wlan0 | sed -n "6p" | awk -F " " '{print $2}' | cut -d"=" -f2)
lvl=$(iwconfig wlan0 | sed -n "6p" | awk -F " " '{print $4}' | cut -d"=" -f2)
rate=$(iwconfig wlan0 | sed -n "3p" | awk -F "=" '{print $2}' | cut -d" " -f1)
inet=$(ip addr show wlan0 | sed -n "3p" | awk -F " " '{print $2}')
broadcast=$(ip addr show wlan0 | sed -n "3p" | awk -F " " '{print $4}')

(echo " ^fg($white)Network"; echo " ^fg($highlight)$essid"; echo " Freq: ^fg($highlight)$freq GHz ^fg() Band: ^fg($highlight)$mode"; echo " Down: ^fg($highlight)$rate MB/s  ^fg() Quality: ^fg($highlight)$qual"; echo " IP: ^fg($highlight)$inet"; echo " Broadcast: ^fg($highlight)$broadcast"; echo " AP: ^fg($highlight)$ap"; echo " MAC: ^fg($highlight)$mac";  echo " "; sleep 10) | dzen2 -fg $foreground -bg $background -fn $FONT -x $XPOS -y $YPOS -w $WIDTH -l $LINES -e 'onstart=uncollapse,hide;button1=exit;button3=exit'

