# Path to your oh-my-zsh installation.
if [[ $OS_TYPE == "darwin" ]]; then
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
alias sed="gsed"
alias cat="batcat"
alias hg="history | rg -i"
alias b="branch.sh"
alias z="zesh.sh"

alias d="docker"
alias dc="docker-compose"
alias c="composer"
alias a="php artisan"

alias python="python3"
alias pip="pip3"

export PATH="$HOME/.config/bin:$PATH"

if [ -f $HOME/.config/zsh/repoalias ]; then
    source $HOME/.config/zsh/repoalias
else
    print "404: ~/.config/zsh/repoalias not found."
fi

export PATH="/home/theoboldalex/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/theoboldalex/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
