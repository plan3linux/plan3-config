#!/bin/bash

# Initial window list
prev_windows=$(wmctrl -l)
snd=$HOME/.local/share/win

while true; do
    # Check the current list of windows
    current_windows=$(wmctrl -l)

    # Check for new windows (open)
    if [[ "$current_windows" > "$prev_windows" ]]; then
        mpv --no-video $snd/open.wav &
    fi

    # Check for closed windows
    if [[ "$prev_windows" > "$current_windows" ]]; then
        mpv --no-video $snd/close.wav &
    fi

    # Update previous window list
    prev_windows="$current_windows"

    # Sleep to prevent too high CPU usage
    sleep 0.2
done

