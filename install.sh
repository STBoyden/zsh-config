#!/usr/bin/env bash

if [[ ! -d ./oh-my-zsh ]]; then
  git clone https://github.com/ohmyzsh/ohmyzsh/ oh-my-zsh
fi

if [[ ! -d $HOME/.oh-my-zsh ]]; then
  ln -s $(pwd)/oh-my-zsh $HOME/.oh-my-zsh
fi

if [[ -f $HOME/.zshrc ]]; then
  mv $HOME/.zshrc $HOME/.zshrc.backup
fi

if [[ -f $HOME/.bashrc ]]; then
  mv $HOME/.bashrc $HOME/.bashrc.backup
fi

ln -s $(pwd)/zshrc $HOME/.zshrc
ln -s $(pwd)/bashrc $HOME/.bashrc
