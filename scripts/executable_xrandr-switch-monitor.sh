set -e
aoc=auto
xps=auto
if [[ $# = 0 ]];then
	xrandr --output eDP-1-1 --auto --output DP-1-3 --off
	exit
fi

if [[ $# -ne 1 ]];then
	echo "expect one param"
	exit
fi

if [[ $1 = "all" ]]; then
	xrandr --output eDP-1-1 --primary --auto --left-of DP-1-3  --output DP-1-3 --auto
	exit
fi
if [[ $1 -eq 0 ]]; then
	aoc=off
else
	xps=off 
fi
eval xrandr --output eDP-1-1 --${xps} --output DP-1-3 --${aoc}

