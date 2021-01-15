#! /bin/bash
set -e
MAXCOUNT=200
if [[ $# != 0  ]]; then
    re='^[0-9]+$'
    if ! [[ $1 =~ $re  ]] ; then
        echo "error: Not a number" >&2; exit 1
    fi
    MAXCOUNT=$1
fi
count=1

value=0;
while [ "$count" -le $MAXCOUNT ]; do
    number[$count]=$RANDOM

    if [[ $count -eq 1 ]]; then
	    echo -n "[-1,0,"
    fi

    value=$(($RANDOM % 2 + value))
    printf $value
    if [[ $count -ne $MAXCOUNT ]]; then
        printf ","
    else
        printf "]\n"
    fi

    _=$((count += 1))
done

