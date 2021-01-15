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

insert=0;
while [ "$count" -le $MAXCOUNT ]; do
    #    out+=$(($RANDOM  ))
    r=$(od -An -N2 -d < /dev/urandom)
    r=$((r%10))
    ((insert += $r))
    ((insert +=1))
    out+=$insert
    if [[ $count -ne $MAXCOUNT ]]; then
        out+=","
    else
        out+="]"
    fi

    ((count += 1))
done

echo $out
r=$(od -An -N2 -d < /dev/urandom)
r=$((r%$count))
echo $r
