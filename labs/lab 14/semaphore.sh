#!/bin/bash

if  [ $# -ne 3 ]; then
     echo "Usage: $0 <wait_time> <work_time> <process_id>"
     exit 1
fi

WAIT=$1
WORK=$2
ID=$3
LOCKFILE="semaphore.lock"

while true; do
    if [ -f "$LOCKFILE" ]; then
        echo "Процесс $ID: Ресурс занят. Ожидается $WAIT сек..." >&2
	sleep $WAIT
    else
	touch "$LOCKFILE"
	echo "Процесс $ID: Ресурс захвачен. Работа $WORK сек..." >&2
	sleep $WORK
	rm -f "$LOCKFILE"
	echo "Процесс $ID: Ресурс освобожден" >&2
	sleep $WAIT
    fi
done
