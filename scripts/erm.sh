#!/usr/bin/env bash

H=$HOME/.zsh_history

selected_command=`cat $H | sed 's/^.*;//' | fzf` 

bash -c "$selected_command"
