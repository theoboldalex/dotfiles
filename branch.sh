#!/usr/bin/env bash

branch=`git branch -a | sed 's/^[^a-z]*//' | fzf`

if echo "$branch" | grep 'remotes/*/'; then
    git switch -c `echo "$branch" | sed 's/remotes\/origin\///'` --track "$branch"
else
    git switch "$branch"
fi
