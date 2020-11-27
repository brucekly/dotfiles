#!/usr/bin/env bash

# Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# (Neo)Vim
if [ ! -f "$HOME/.vimrc" ]; then
    echo "source ~/dotfiles/vim/config.vim" > ~/.vimrc
fi
if [ ! -f "$HOME/.config/nvim/init.vim" ]; then
    mkdir -p ~/.config/nvim
    echo "source ~/dotfiles/vim/config.vim" > ~/.config/nvim/init.vim
fi

# Zsh
if [ ! -f "$HOME/.zshrc" ]; then
    echo "source ~/dotfiles/config.zsh" > ~/.zshrc
fi

# Git
if [ ! -f "$HOME/.gitconfig" ]; then
    mv gitconfig.local ~/.gitconfig
fi
ln -sf gitignore ~/.gitignore
