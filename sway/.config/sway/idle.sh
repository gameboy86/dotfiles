#!/bin/bash
swayidle -w \
  timeout 600 'swaylock -f -c 000000' \
  timeout 900 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
  timeout 1800 'systemctl suspend' \
  before-sleep 'swaylock -f -c 000000'
