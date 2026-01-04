#!/bin/bash

LOCK_TIMEOUT=${LOCK_TIMEOUT:-60}
DPMS_TIMEOUT=${DPMS_TIMEOUT:-90}
SUSPEND_TIMEOUT=${SUSPEND_TIMEOUT:-180}
DPMS_DELAY=5
LOGFILE="/tmp/idle.log"

log() {
  echo "$(date '+%F %T') - $1" >> "$LOGFILE"
}

log "Starting swayidle: lock=${LOCK_TIMEOUT}s, dpms=${DPMS_TIMEOUT}s, suspend=${SUSPEND_TIMEOUT}s"

swayidle -w \
  timeout "$LOCK_TIMEOUT" "pgrep swaylock > /dev/null || swaylock -f -c 000000" \
  timeout "$SUSPEND_TIMEOUT" 'systemctl suspend' \
  timeout "$DPMS_TIMEOUT" 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' \
  before-sleep "pgrep swaylock > /dev/null || swaylock -f -c 000000"
