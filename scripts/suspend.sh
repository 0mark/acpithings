#!/bin/sh

function susprep {
    which nvidia-disable.sh &> /dev/null && nvidia-disable.sh
    for A in $(ls /media/); do pumount $A; done;
    killall ssh
    netcfg -a
    sync
}

function suspres {
    killall -s SIGHUP srandrd
    echo resume
}

susprep
if [ "$1" == "disk" ]; then
        echo -n disk >/sys/power/state
else
        echo -n mem >/sys/power/state
fi
suspres
