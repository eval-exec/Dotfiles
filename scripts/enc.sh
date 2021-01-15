#! /bin/bash
set -e
MAXCOUNT=999
if [[ $# != 0  ]]; then
    re='^[0-9]+$'
    if ! [[ $1 =~ $re  ]] ; then
        echo "error: Not a number" >&2; exit 1
    fi
    MAXCOUNT=$1
fi
count=1

out='"'

while [ "$count" -le $MAXCOUNT ]; do
    r=$(($RANDOM % 26))
    let "r+=97"
    rr=$(printf \\$(printf '%03o' $r))
    out+=$rr
    xx=$(($RANDOM % 2))
    if [[ $xx -eq 0 ]] ;then
	    ((xx += 1))
	    out+=$(($RANDOM % 8 + 2))
    fi

    ((count += 1))
done
out+='"'

echo $out
