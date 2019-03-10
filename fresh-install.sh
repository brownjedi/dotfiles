#!/usr/bin/env bash

# install all required brew packages
source ./brew.sh

# install oh-my-zsh
if [ ! -n "$ZSH" ]; then
	ZSH=~/.oh-my-zsh
fi

if [ ! -d "$ZSH" ]; then
	echo "Installing oh-my-zsh..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# install all
source ./bootstrap.sh

# post install actions
source ./postinstall.sh
