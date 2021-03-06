#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

dir="$HOME/.config/rofi/"
rofi_command="rofi -theme $dir/powermenu.rasi"

uptime=$(uptime -p | sed -e 's/up //g')

# Options
shutdown=""
reboot="敏"
lock=""
suspend="鈴"
logout=""

# Variable passed to rofi
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -p "$uptime" -dmenu -selected-row 0)"
case $chosen in
$shutdown)
  systemctl poweroff
  ;;
$reboot)
  systemctl reboot
  ;;
$lock)
  betterlockscreen -l
  ;;
$suspend)
  ans="yes"
  if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
    mpc -q pause
    amixer set Master mute
    betterlockscreen -l
    systemctl suspend
  elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
    exit 0
  else
    msg
  fi
  ;;
$logout)
  if [[ "$DESKTOP_SESSION" == "Openbox" ]]; then
    openbox --exit
  elif [[ "$DESKTOP_SESSION" == "bspwm" ]]; then
    bspc quit
  elif [[ "$DESKTOP_SESSION" == "i3" ]]; then
    i3-msg exit
  fi
  ;;
esac
