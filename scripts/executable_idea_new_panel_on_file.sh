#!/usr/bin/env bash
filepath=$1
set -Eevxu pipefail
gitbase=$(git rev-parse --show-toplevel)
if [[ -z ${gitbase} ]] ;then
   echo "have no gitbase"
   exit
fi
project_name=$(basename gitbase)
dirname_name=$(dirname filepath)


if [[ ! $(tmux has-session -t ${project_name}) ]];then
	  tmux new-session -s ${project_name} -d
fi

tmux list-window -t ${project_name}
tmux new-window -c $(dirname filepath) -n $(dirname filepath)
