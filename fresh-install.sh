#!/usr/bin/env bash

# install all required brew packages
source ./brew.sh

# install all
source ./bootstrap.sh

# post install actions
source ./postinstall.sh
