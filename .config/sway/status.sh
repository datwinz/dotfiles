volume=$(pactl get-sink-volume 0 | awk '{ print $5}')
date=$(date +'%Y-%m-%d %H:%M:%S ')
battery=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | awk '{print $2}')

echo 🔊 $volume \| 🔋 $battery \| 📆 $date
