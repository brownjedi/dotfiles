#!/usr/bin/env bash

# install all required brew packages
source ./brew.sh

# install oh-my-zsh
source ./oh-my-zsh.sh

# install all
source ./bootstrap.sh

# post install actions
source ./postinstall.sh
