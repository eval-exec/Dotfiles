#! /bin/sh
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


while [ "$count" -le $MAXCOUNT ]; do
    number[$count]=$RANDOM

    if [[ $count -eq 1 ]]; then
        printf "["
    fi

    printf $(($(expr $RANDOM % 2)))
    if [[ $count -ne $MAXCOUNT ]]; then
        printf ","
    else
        printf "]\n"
    fi

    let "count += 1"
done

