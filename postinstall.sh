
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
if [ ! -n "$ZSH_CUSTOM" ]; then
	ZSH_CUSTOM=~/.oh-my-zsh/custom
	ZSH_CUSTOM_PLUGINS_PATH=$ZSH_CUSTOM/plugins
fi

if [! -d ${ZSH_CUSTOM_PLUGINS_PATH}/zsh-nvm ]; then
	git clone https://github.com/lukechilds/zsh-nvm.git ${ZSH_CUSTOM_PLUGINS_PATH}/zsh-nvm
else
	git -C ${ZSH_CUSTOM_PLUGINS_PATH}/zsh-nvm pull
fi

if [! -d ${ZSH_CUSTOM_PLUGINS_PATH}/zsh-autosuggestions ]; then
	git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM_PLUGINS_PATH}/zsh-autosuggestions
else
	git -C ${ZSH_CUSTOM_PLUGINS_PATH}/zsh-autosuggestions pull
fi

if [! -d ${ZSH_CUSTOM_PLUGINS_PATH}/zsh-syntax-highlighting ]; then
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM_PLUGINS_PATH}/zsh-syntax-highlighting
else
	git -C ${ZSH_CUSTOM_PLUGINS_PATH}/zsh-syntax-highlighting pull
fi

if [! -d ${ZSH_CUSTOM_PLUGINS_PATH}/zsh-history-substring-search ]; then
	git clone https://github.com/zsh-users/zsh-history-substring-search.git ${ZSH_CUSTOM_PLUGINS_PATH}/zsh-history-substring-search
else
	git -C ${ZSH_CUSTOM_PLUGINS_PATH}/zsh-history-substring-search pull
fi

if [! -d ${ZSH_CUSTOM_PLUGINS_PATH}/history-search-multi-word ]; then
	git clone https://github.com/zdharma/history-search-multi-word.git ${ZSH_CUSTOM_PLUGINS_PATH}/history-search-multi-word
else
	git -C ${ZSH_CUSTOM_PLUGINS_PATH}/history-search-multi-word pull
fi

if [! -d ${ZSH_CUSTOM_PLUGINS_PATH}/almostontop ]; then
	git clone https://github.com/Valiev/almostontop.git ${ZSH_CUSTOM_PLUGINS_PATH}/almostontop
else
	git -C ${ZSH_CUSTOM_PLUGINS_PATH}/almostontop pull
fi

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
