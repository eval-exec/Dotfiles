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


echo -n \"
while [ "$count" -le $MAXCOUNT ]; do
    if [[ $(($RANDOM % 5)) -eq 0 ]];then
        echo -n $(($RANDOM % 2 + 1 ))
    else
        echo -n $(($RANDOM % 9 + 1 ))
    fi
    ((count += 1))
done
echo  \"

