#!/usr/bin/env bash

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ZSH
rm $HOME/.zshrc
ln -s $DOTFILES/.zshrc $HOME/.zshrc

# OH MY ZSH
rm $HOME/.oh-my-zsh/themes/mnml.zsh-theme
ln -s $DOTFILES/oh-my-zsh/themes/mnml.zsh-theme $HOME/.oh-my-zsh/themes/mnml.zsh-theme

# ALACRITTY
rm -rf $HOME/.config/alacritty
ln -s $DOTFILES/alacritty $HOME/.config/alacritty

# TMUX
rm -rf $HOME/.config/tmux
ln -s $DOTFILES/tmux $HOME/.config/tmux

# NVIM
rm -rf $HOME/.config/nvim
ln -s $DOTFILES/nvim $HOME/.config/nvim

# IDEAVIM
rm $HOME/.ideavimrc
ln -s $DOTFILES/.ideavimrc $HOME/.ideavimrc

# SCRIPTS
rm -rf $HOME/.config/bin
ln -s $DOTFILES/scripts $HOME/.config/bin
