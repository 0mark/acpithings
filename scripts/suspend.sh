#!/bin/sh

function susprep {
    for A in $(ls /media/); do pumount $A; done;
    netcfg -a
    sync
}

function suspres {
    echo resume
}

susprep
if [ "$1" == "disk" ]; then
        echo -n disk >/sys/power/state
else
        echo -n mem >/sys/power/state
fi
suspres
