# Path to your oh-my-zsh installation.
export ZSH="/Users/$USER/.oh-my-zsh"

ZSH_THEME="lambda"

plugins=(
    git
    zsh-autosuggestions
    )

source $ZSH/oh-my-zsh.sh

alias cf="cd $HOME/.config"
alias vi="nvim"
alias zshrc="nvim $HOME/.zshrc"
alias vimrc="cd $HOME/.config/nvim/ && nvim ."
alias srczsh="source $HOME/.zshrc"
alias sed="gsed"
alias cat="bat"
alias todo="cd $HOME/notes/ && nvim todo.md"
alias notes="cd $HOME/notes && nvim ."
alias dot="cd $HOME/dotfiles && nvim ."

alias d="docker"
alias dc="docker-compose"
alias c="composer"
alias a="php artisan"
alias phpdoc="phpdoc.sh"

alias python="python3"
alias pip="pip3"

export PATH="$HOME/.config/bin:$PATH"

# load shortcuts to repos
if [ -f $HOME/.config/zsh/repoalias ]; then
    source $HOME/.config/zsh/repoalias
else
    print "404: ~/.config/zsh/repoalias not found."
fi

