N=100
if [[ $# -eq 1 ]];then
    N=$1
fi
for n in $(seq $N) ;
do
    if [[ $(($RANDOM % 3 )) -eq 0 ]];then
        echo $n
    fi
done

