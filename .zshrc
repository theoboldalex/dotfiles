# zmodload zsh/zprof

# Path to your oh-my-zsh installation.
if [[ $OSTYPE == "darwin"* ]]; then
    export ZSH="/Users/$USER/.oh-my-zsh"
else
    export ZSH="/home/$USER/.oh-my-zsh"
fi

ZSH_THEME="mnml"

plugins=(
    git
    zsh-autosuggestions
    )

source $ZSH/oh-my-zsh.sh

alias vi="nvim"
alias zshrc="nvim $HOME/.zshrc"
alias srczsh="source $HOME/.zshrc"
alias hg="history | rg -i"
alias b="branch.sh"
alias z="zesh.sh"

if [[ $OSTYPE == "darwin"* ]]; then
    alias sed="gsed"
    alias cat="bat"
elif [[ $OSTYPE == "linux"* ]]; then
    alias cat="batcat"
fi

alias d="docker"
alias dc="docker-compose"
alias c="composer"
alias a="php artisan"
alias scrum="./scrum.sh"

alias python="python3"
alias pip="pip3"

export EDITOR="nvim"
export PATH="$HOME/.config/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH=$PATH:~/.local/bin

if [ -f $HOME/.config/zsh/repoalias ]; then
    source $HOME/.config/zsh/repoalias
else
    print "404: ~/.config/zsh/repoalias not found."
fi

# zprof
