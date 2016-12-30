#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
ln -s ${BASEDIR}/vimrc ~/.vimrc

# zsh
ln -s ${BASEDIR}/zshrc ~/.zshrc

# bash
ln -s ${BASEDIR}/bashrc ~/.bashrc

# git
ln -s ${BASEDIR}/gitconfig ~/.gitconfig

# stylish-haskell
ln -s ${BASEDIR}/stylish-haskell.yaml ~/.stylish-haskell.yaml

# tmux
ln -s ${BASEDIR}/tmux.conf ~/.tmux.conf
