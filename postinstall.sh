
#!/usr/bin/env bash

# install tpm plugin manager
if [ ! -d ${HOME}/.tmux/plugins/tpm ]; then
	echo "Installing tmux plugin manager..."
	git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
	${HOME}/.tmux/plugins/tpm/bin/install_plugins
fi

# install node via nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

if test $(command -v nvm); then
	echo "Installing lastest node..."
	nvm install node
	nvm alias default node
fi

# Python from pyenv
if which pyenv > /dev/null; then
	eval "$(pyenv init -)";
fi
# install node via pyenv
if test $(command -v pyenv); then
	echo "Installing python 3"
	LDFLAGS="-L$(xcrun --show-sdk-path)/usr/lib" pyenv install 3.11.4
	pyenv global 3.11.4
fi

pip install --upgrade setuptools wheel pip
pip3 install --upgrade setuptools wheel pip3

# we need this to enable ccat (colorize plugin of oh-my-zsh)
pip install Pygments
