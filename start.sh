#!/bin/bash
y=1

LIBDIRLIST=$LIBDIRLIST
CALIBRE_COMMAND="calibre-server --enable-auth --userdb /srv/calibre/users.sqlite"
read -a arr <<< $LIBDIRLIST

if [ ! -z "$arr" ] ; then
	for x in ${!arr[@]}
	do
		if [ $((x % 2)) == 0 ] ; then
			INDEX=$((x+1))
			calibredb add ${arr[x]}/* --library-path ${arr[$INDEX]}
			CALIBRE_COMMAND+=" ${arr[$INDEX]}"
		fi
	done
fi

while [ $y -le 2 ]
do
	if lsof -Pi :8080 -sTCP:LISTEN -t >/dev/null ; then
		sleep 30
	else
	    $CALIBRE_COMMAND
	    sleep 30
	fi
done