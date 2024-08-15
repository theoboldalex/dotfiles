# Path to your oh-my-zsh installation.
export ZSH="/Users/$USER/.oh-my-zsh"

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
alias cat="bat"
alias hg="history | rg -i"
alias b="branch.sh"

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

