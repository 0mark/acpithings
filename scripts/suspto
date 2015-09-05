#!/bin/sh

function susprep {
    logger -t suspend "sleeping down"
    for A in $(ls /media/); do pumount $A; done;
    netcfg -a
    sync
}

function suspres {
    logger -t suspend "waking up"
    netcfg-auto
    logger -t suspend "woken up"
}

susprep
if [ "$1" == "disk" ]; then
        echo -n disk >/sys/power/state
else
        echo -n mem >/sys/power/state
fi
suspres
