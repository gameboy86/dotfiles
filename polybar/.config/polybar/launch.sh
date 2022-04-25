#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar

polybar -q main -c "$DIR"/configs/float/config.ini &
polybar -q main-external-dp3 -c "$DIR"/configs/float/config.ini & 
polybar -q main-external-hdmi1 -c "$DIR"/configs/float/config.ini & 
