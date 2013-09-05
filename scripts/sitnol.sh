#!/bin/sh

uids="$(cat /etc/passwd | egrep ":x:[0-9]{4,}" | cut -d ":" -f 3 | tr "\n" " ")"
#pids="$(ps U "${uids:0:-1}" -o pid | tr "\n" " ")"
pids="$(ps U "${uids:0:-1}" | egrep -v "(ssh)|(PID TTY)" | cut -d " " -f 1 | tr "\n" " ")"

if [ "$1" == "close" ]; then
    for p in a $pids; do
        if [[ "$p" =~ ^[0-9]+$ ]]; then
            logger "Stopping $p"
            kill -STOP $p
        fi
    done
else
    for p in a $pids; do
        if [[ "$p" =~ ^[0-9]+$ ]]; then
            logger "Starting $p"
            kill -CONT $p
        fi
    done
fi
