#!/bin/bash

function push {
    if [ "$1" = "-h" ]; then
    echo " Sends a request to the pushover.net server"
    echo "Takes two positionnal arguments the title and the body of the push notification"
        return  
    fi

    #requires COSTUMISATION
    curl -s -F "token=TOKENNUMBER" \
    -F "user=USERID" \
    -F "title=$1" \
    -F "message=$2" https://api.pushover.net/1/messages.json >/dev/null
}
