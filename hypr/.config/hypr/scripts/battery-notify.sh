#!/bin/bash

BATTERY_PATH="/sys/class/power_supply/BAT0"
LOW_BATTERY=20
CRITICAL_BATTERY=5

# State file to prevent spam notifications
STATE_FILE="/tmp/battery_notify_state"

# Function to check if we should notify
should_notify() {
    local level=$1
    local current_state="${CAPACITY}_${STATUS}_${level}"
    
    # Read previous state
    if [[ -f "$STATE_FILE" ]]; then
        local prev_state=$(cat "$STATE_FILE")
        [[ "$prev_state" != "$current_state" ]] && return 0
    else
        return 0
    fi
    return 1
}

# Function to update state
update_state() {
    local level=$1
    echo "${CAPACITY}_${STATUS}_${level}" > "$STATE_FILE"
}

while true; do
    # Exit if battery doesn't exist
    [[ ! -f "$BATTERY_PATH/capacity" ]] && exit 1
    
    CAPACITY=$(cat "$BATTERY_PATH/capacity")
    STATUS=$(cat "$BATTERY_PATH/status")
    
    # Clear state when charging starts
    if [[ "$STATUS" == "Charging" && -f "$STATE_FILE" ]]; then
        rm "$STATE_FILE"
    fi
    
    # Only check when not charging
    if [[ "$STATUS" != "Charging" ]]; then
        if [[ $CAPACITY -le $CRITICAL_BATTERY ]] && should_notify "critical"; then
            notify-send -u critical -t 0 -a "󰂃 Critical Battery!"
                
            update_state "critical"
            
        elif [[ $CAPACITY -le $LOW_BATTERY && $CAPACITY -gt $CRITICAL_BATTERY ]] && should_notify "low"; then
            notify-send -u normal -t 8000 -a "󰂃 Low Battery"
            update_state "low"
        fi
    fi
    
    # Check every 60 seconds (efficient for battery monitoring)
    sleep 60
done
