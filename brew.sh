#!/usr/bin/env bash

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install zsh.
brew install zsh

# Switch to using brew-installed zsh as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/zsh" /etc/shells; then
  echo "${BREW_PREFIX}/bin/zsh" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/zsh";
fi;

# Install `wget` with IRI support.
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh
brew install screen
brew install rsync
brew install reattach-to-user-namespace

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install nmap
brew install sqlmap

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install git-flow
brew install git-extras
brew install diff-so-fancy
brew install imagemagick
brew install lua
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli
brew install tmux
brew install lolcat
brew install thefuck
brew install ctags
brew install libvpx
brew install fortune
brew install cowthink
brew install ffmpeg


# install programming env

# golang
brew install go

# node
brew install nvm
brew install yarn

# python
brew install pyenv
brew install pyenv-virtualenvwrapper
brew install pipenv

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzip qlimagesize webpquicklook suspicious-package quicklookase qlvideo

# install fonts
brew tap caskroom/fonts
brew cask install font-fira-code

# install apps
brew cask install iterm2
brew cask install hammerspoon
brew cask install visual-studio-code
brew cask install typora
brew cask install omnidisksweeper
brew cask install postman
brew cask install docker
brew cask install vlc
brew cask install spotify
brew cask install whatsapp
brew cask install signal

# Remove outdated versions from the cellar.
brew cleanup
