#!/usr/bin/env bash
set -eu 
turbo=1
if [[ $# == 1 && $1 == on ]];then
	turbo=0
fi

printf "Carpe diem. Seize the day, boys. Make your lives extraordinary. \n\t\t\t\t\t - Dead Poets Society\n\n"

echo $turbo | sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo 
