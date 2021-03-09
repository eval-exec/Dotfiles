#! /bin/bash
set -e
MAXCOUNT=3000
if [[ $# != 0  ]]; then
    re='^[0-9]+$'
    if ! [[ $1 =~ $re  ]] ; then
        echo "error: Not a number" >&2; exit 1
    fi
    MAXCOUNT=$1
fi

countm=3
if [[ $# == 2  ]]; then
    re='^[0-9]+$'
    if ! [[ $1 =~ $re  ]] ; then
        echo "error: Not a number" >&2; exit 1
    fi
    countm=$2
fi

row=1
echo -n "["
while [ $row -le $MAXCOUNT ]; do
    echo -n [

        count=1


    while [ "$count" -le $countm ]; do
        #    out+=$(($RANDOM  ))
        r=$(od -An -N2 -d < /dev/urandom)
        r=$((r% 3 ))
        if [[ $r -eq 0 ]];then
            echo -n 1
        else
            echo -n 0
        fi
        if [[ $count -ne $countm ]]; then
            echo -n ,
        else
            echo -n ]
        fi

        ((count += 1))
    done

    if [[ $row -ne $MAXCOUNT ]]; then
        echo -n ,
    else
        echo -n ]
    fi

    ((row+= 1))

done
echo 
