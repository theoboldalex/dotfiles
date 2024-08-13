#!/usr/bin/env bash

if [[ `ps -p $$ | awk '{print $4}' | tail -n1` = 'bash' ]]; then
    H=$HOME/.bash_history
else
    H=$HOME/.zsh_history
fi

selected_command=`cat $H | sed 's/^.*;//' | fzf` 

bash -c "$selected_command"
