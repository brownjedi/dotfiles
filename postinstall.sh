
#!/usr/bin/env bash

# install zsh shell integration for iterm2
if test ! -e "${HOME}/.iterm2_shell_integration.zsh"; then
	echo "Installing iterm2 shell integration with zsh..."
	curl -L https://iterm2.com/shell_integration/zsh -o ${HOME}/.iterm2_shell_integration.zsh
fi

# install oh-my-zsh
if [ ! -n "$ZSH" ]; then
	ZSH=~/.oh-my-zsh
fi

if [ ! -d "$ZSH" ]; then
	echo "Installing oh-my-zsh..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# install zsh plugins
git clone https://github.com/lukechilds/zsh-nvm ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvm
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zdharma/history-search-multi-word ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/history-search-multi-word
git clone https://github.com/Valiev/almostontop.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/almostontop

# install tpm plugin manager
if [ ! -d ${HOME}/.tmux/plugins/tpm ]; then
	echo "Installing tmux plugin manager..."
	git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
	${HOME}/.tmux/plugins/tpm/bin/install_plugins
fi

# install all vim plugins in .vimrc
vim +PlugInstall +qall

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
	echo "Installing python 2 and python 3"
	pyenv install 2.7.10
	pyenv install 3.7.0
	pyenv global 2.7.10 3.7.0
fi
