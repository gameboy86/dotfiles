#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#Set your native resolution IF it does not exist in xrandr
#More info in the script
#run $HOME/.xmonad/scripts/set-screen-resolution-in-virtualbox.sh


(sleep 2; run $HOME/.config/polybar/launch.sh) &


#cursor active at boot
xsetroot -cursor_name left_ptr &


#Some ways to set your wallpaper besides variety or nitrogen
# feh --bg-fill /usr/share/backgrounds/archlinux/arch-wallpaper.jpg &
# feh --bg-fill /usr/share/backgrounds/arcolinux/arco-wallpaper.jpg &

#starting utility applications at boot time
# run variety &
run nm-applet &
run pamac-tray &
run xfce4-power-manager &
# run volumeicon &
numlockx on &
blueberry-tray &
# picom --config $HOME/.xmonad/scripts/picom.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &

setxkbmap -option ctrl:nocaps -layout pl
