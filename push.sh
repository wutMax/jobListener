#!/bin/bash

function push {
    if [ "$1" = "-h" ]; then
        echo " Sends a request to the pushover.net server"
        echo "Takes two positionnal arguments the title and the body of the push notification"
        return  
    fi

    CDIR="${XDG_CONFIG_HOME:-$HOME/.config}/push"
    mkdir -p "$CDIR"
    [ ! -f "$CDIR/token" -o ! -f "$CDIR/user_id" ] && \
        { echo "Auth tokens must be supplied."; return 1; }

    curl -s -F "token="$(<"$CDIR/token") \
    -F "user="$(<"$CDIR/user_id") \
    -F "title=$1" \
    -F "message=$2" https://api.pushover.net/1/messages.json >/dev/null
}
