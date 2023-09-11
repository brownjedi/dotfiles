# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# need this to hide prompt in agnoster theme
export DEFAULT_USER="$(whoami)"

# Default GOPATH
export GOPATH="$HOME/go"

# export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

export PATH=$HOME/.local/bin:$HOME/bin:$GOPATH/bin:/usr/local/sbin:$PATH

# Android
# export ANDROID_HOME=~/Library/Android/sdk
# export ANDROID_SDK_ROOT=${ANDROID_HOME}
# export ANDROID_AVD_HOME=~/.android/avd
# export PATH=${PATH}:${ANDROID_HOME}/tools
# export PATH=${PATH}:${ANDROID_HOME}/platform-tools


# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# source this file before loading zsh-syntax-highlighting plugin
source $ZSH/custom/plugins/catppuccin-zsh-syntax-highlighting/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="custom-agnoster"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
  brew
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-history-substring-search
  aliases
  colorize
  colored-man-pages
  command-not-found
  chucknorris
  fzf
  # keep zsh-interactive-cd after fzf since it's dependent on that
  zsh-interactive-cd
  # ensure H-S-MW is after fzf else fzf will overwrite CTRL + R binding
  H-S-MW
  gh
  git
  gitignore
  extract
  docker
  tmux
  thefuck
  zsh-nvm
  npm
  yarn
  golang
  terraform
  zoxide
)


# User configuration
source $ZSH/custom/plugins/almostontop/almostontop.plugin.zsh

# Automatically set GOPATH
cd () {
    builtin cd "$@"
    cdir=$PWD
    while [ "$cdir" != "/" ]; do
        if [ -e "$cdir/.gopath" ]; then
            export GOPATH=$cdir
            break
        fi
        cdir=$(dirname "$cdir")
    done
}

# running this so that it will set appropriate GOPATH for
# terminals which directly open a particular GOPATH folder
cd $PWD

source $ZSH/oh-my-zsh.sh

zstyle ":history-search-multi-word" page-size "10"
zstyle ":history-search-multi-word" highlight-color "fg=yellow,bold"

unalias run-help 2>/dev/null
autoload run-help
HELPDIR=/usr/local/share/zsh/help

chuck_cow | lolcat

# Python from pyenv
if which pyenv > /dev/null; then
	eval "$(pyenv init -)";
	pyenv virtualenvwrapper_lazy
fi

# Python from pyenv
if which pyenv > /dev/null; then
	eval "$(pyenv init -)";
	pyenv virtualenvwrapper_lazy
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

eval "$(direnv hook zsh)"
