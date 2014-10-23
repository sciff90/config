#! /bin/sh
#
# test.sh
# Copyright (C) 2014 gareth <gareth@GDS-Desktop>
#
# Distributed under terms of the MIT license.
#


#Define Project Name
name=DEM-Particle-Class
#define project directory
if [ "$HOSTNAME" = gsciffer-lx1 ]; then
    dir=/home/gds403/PhD/code/dem/c++/particle_example
    printf '%s\n' "On GDS-UoN"
else
    dir=/home/gareth/Dropbox/University/Phd/DEM/Code/c++/particle_example
    printf '%s\n' "On GDS-Desktop"
fi


#open new tmux session with window named vim
tmux new-session -s $name -n vim -d
#cd to dir
tmux send-keys -t $name 'cd '$dir C-m
#open vim
tmux send-keys -t $name 'vim' C-m
#split window vertically
tmux split-window -h -t $name
tmux select-layout -t $name main-vertical
#cd to dir
tmux send-keys -t $name:1.2 'cd '$dir C-m
tmux send-keys -t $name:1.2 'clear' C-m
#make new window git
tmux new-window -n git -t $name
#cd to dir
tmux send-keys -t $name:2 'cd '$dir C-m
tmux send-keys -t $name:2 'clear' C-m
tmux send-keys -t $name:2 'git status' C-m
#make new window test
tmux new-window -n ssh -t $name
#put focus on vim window
tmux select-window -t $name:1
#attatch to new session
tmux -2 attach -t $name
