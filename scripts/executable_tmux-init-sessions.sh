#!/usr/bin/env bash
set -euxo pipefail
tmux new-session -d -s Algorithm 
tmux new-window -d -n Algorithm -t Algorithm

tmux new-session -d -s Eigenphi
tmux new-window -d -n Eigenphi -t Eigenphi

tmux new-session -d -s CS_15445 
tmux new-window -d -n Eigenphi -t CS_15445 

tmux new-session -d -s Temp
tmux new-window -d -n Temp -t Temp
