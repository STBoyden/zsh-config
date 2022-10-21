#!/usr/bin/env bash

git clone https://github.com/ohmyzsh/ohmyzsh/ oh-my-zsh

ln -s $(pwd)/oh-my-zsh $HOME/.oh-my-zsh
ln -s $(pwd)/zshrc $HOME/.zshrc
