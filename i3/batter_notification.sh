#!/bin/bash
#upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|to\ full|percentage"
DISCHARGING="discharging"
PASSWORD=$1
PERCENTAGE=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "percentage")
STATE=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state")
STATE=`echo $STATE | sed s/'state: '//`
set -- $PERCENTAGE
VALUE=$2
VALUE=${VALUE%\%*}
VALUE=${VALUE%.*}
if [ $VALUE -le 20 ] && [ "$STATE" == "$DISCHARGING" ]
then
VARS=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|time|percentage")
set -- $VARS
notify-send "Battery Alert" "Your battery is low!"
fi
if [ $VALUE -le 5 ] && [ "$STATE" == "$DISCHARGING" ]
then
				exec systemctl sleep
# exec gnome-screensaver-command -l & echo $password | sudo -s pm-suspend
fi
