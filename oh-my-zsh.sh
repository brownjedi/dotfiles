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
  # sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  # remove echo and env zsh so that we can do a silent install
  curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -o ${HOME}/.omz_tmp.sh
  sh ${HOME}/.omz_tmp.sh
  rm ${HOME}/.omz_tmp.sh
fi

# install zsh plugins
if [ ! -n "$ZSH_CUSTOM" ]; then
	ZSH_CUSTOM=~/.oh-my-zsh/custom
fi

ZSH_CUSTOM_PLUGINS_PATH=$ZSH_CUSTOM/plugins

if [ ! -d ${ZSH_CUSTOM_PLUGINS_PATH}/zsh-nvm ]; then
	git clone https://github.com/lukechilds/zsh-nvm.git ${ZSH_CUSTOM_PLUGINS_PATH}/zsh-nvm
else
	git -C ${ZSH_CUSTOM_PLUGINS_PATH}/zsh-nvm pull
fi

if [ ! -d ${ZSH_CUSTOM_PLUGINS_PATH}/zsh-autosuggestions ]; then
	git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM_PLUGINS_PATH}/zsh-autosuggestions
else
	git -C ${ZSH_CUSTOM_PLUGINS_PATH}/zsh-autosuggestions pull
fi

if [ ! -d ${ZSH_CUSTOM_PLUGINS_PATH}/zsh-syntax-highlighting ]; then
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM_PLUGINS_PATH}/zsh-syntax-highlighting
else
	git -C ${ZSH_CUSTOM_PLUGINS_PATH}/zsh-syntax-highlighting pull
fi

if [ ! -d ${ZSH_CUSTOM_PLUGINS_PATH}/zsh-history-substring-search ]; then
	git clone https://github.com/zsh-users/zsh-history-substring-search.git ${ZSH_CUSTOM_PLUGINS_PATH}/zsh-history-substring-search
else
	git -C ${ZSH_CUSTOM_PLUGINS_PATH}/zsh-history-substring-search pull
fi

if [ ! -d ${ZSH_CUSTOM_PLUGINS_PATH}/history-search-multi-word ]; then
	git clone https://github.com/zdharma/history-search-multi-word.git ${ZSH_CUSTOM_PLUGINS_PATH}/history-search-multi-word
else
	git -C ${ZSH_CUSTOM_PLUGINS_PATH}/history-search-multi-word pull
fi

if [ ! -d ${ZSH_CUSTOM_PLUGINS_PATH}/almostontop ]; then
	git clone https://github.com/Valiev/almostontop.git ${ZSH_CUSTOM_PLUGINS_PATH}/almostontop
else
	git -C ${ZSH_CUSTOM_PLUGINS_PATH}/almostontop pull
fi
