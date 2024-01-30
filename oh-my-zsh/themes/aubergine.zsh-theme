PROMPT_DEFAULT_END=❯

PROMPT_SUCCESS_COLOR=$fg[green]
PROMPT_FAILURE_COLOR=$fg[red]
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "

PROMPT='%(0?.%{$PROMPT_SUCCESS_COLOR%}.%{$PROMPT_FAILURE_COLOR%})%{$PROMPT_DEFAULT_END%}%{$FX[no-bold]%}%{$FX[reset]%} %~/ $(git_prompt_info)%{$reset_color%}'
