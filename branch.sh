#!/usr/bin/env bash

if [[ `git rev-parse --is-inside-work-tree` != 'true' ]]; then
    exit
fi

branch=`git branch -a | sed 's/^[^a-z]*//' | fzf`

if echo "$branch" | grep 'remotes/*/'; then
    git switch -c `echo "$branch" | sed 's/remotes\/origin\///'` --track "$branch"
else
    git switch "$branch"
fi
