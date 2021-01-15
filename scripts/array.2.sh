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
count=1

out="["

while [ "$count" -le $MAXCOUNT ]; do
#    out+=$(($RANDOM  ))
r=$(od -An -N2 -d < /dev/urandom)
r=$((r%110+1))
out+=$r
    if [[ $count -ne $MAXCOUNT ]]; then
        out+=","
    else
        out+="]"
    fi

    ((count += 1))
done

echo $out
