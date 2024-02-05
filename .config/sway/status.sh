volume=$(pactl get-sink-volume 0 | awk '{ print $5}')
date=$(date +'%Y-%m-%d %H:%M:%S ')
battery=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | awk '{print $2}')
brightness=$(light)
wifi=$(nmcli connection show | grep -E "(wifi|ethernet)" | awk '{print $1}')

echo 🔊 $volume \| ☀️ $brightness \| 🔋 $battery \| 🌐 $wifi \| 📆 $date
