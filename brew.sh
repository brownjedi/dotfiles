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
brew install zsh-completions

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
brew install neovim
brew install grep
brew install openssh
brew install rsync
brew install reattach-to-user-namespace

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install nmap
brew install sqlmap

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install lazygit
brew install git
brew install git-lfs
brew install git-extras
brew install diff-so-fancy
brew install imagemagick
brew install lua
brew install ssh-copy-id
brew install tree
brew install zopfli
brew install tmux
brew install lolcat
brew install thefuck
brew install libvpx
brew install fortune
brew install cowthink
brew install ffmpeg
brew install watch
brew install hub
brew install direnv

# install tiling manager
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd

# install programming env

# golang
brew install go

# node
brew install nvm
brew install yarn

# python
brew install openssl readline sqlite3 xz zlib # dependencies for building python
brew install pyenv
brew install pyenv-virtualenvwrapper
brew install pipenv

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen quicklook-json qlmarkdown quicklook-csv qlimagesize webpquicklook suspicious-package apparency qlvideo

# install fonts
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font font-fira-mono-nerd-font

# install apps
brew install --cask iterm2
brew install --cask visual-studio-code
brew install --cask omnidisksweeper
brew install --cask postman
brew install --cask vlc
brew install --cask rancher
brew install --cask spotify
brew install --cask whatsapp
brew install --cask signal
brew install --cask firefox
brew install --cask google-chrome
brew install --cask logitech-g-hub
# this apps helps select retina enabled resolution (pixel doubling)
brew install --cask betterdisplay

# install kustomize/helm
brew install helm

# Remove outdated versions from the cellar.
brew cleanup
