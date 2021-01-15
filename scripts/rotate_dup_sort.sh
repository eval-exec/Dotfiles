#!/bin/bash
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


array=(1)
while [ "$count" -le $MAXCOUNT ]; do
    r=$(od -An -N2 -d < /dev/urandom)
    r=$((r%10+${array[-1]}))
    array+=($r)
    ((count+= 1 ))
done

r=$(od -An -N2 -d < /dev/urandom)
r=$((r%$count))
out=(${array[@]:$r} ${array[@]:0:$r})
put='['
for value in "${out[@]}"
do
    put+=$value
        put+=','
done
put=${put::-1}
put+=']'
printf $put"\n"
r=$(od -An -N2 -d < /dev/urandom)
r=$((r%$count))
echo $r
