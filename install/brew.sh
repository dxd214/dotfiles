#!/bin/sh
# https://brew.sh/

if test ! $(which brew); then
  echo "Installing homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi


brew tap caskroom/fonts

apps=(
  fzf
  the_silver_searcher
  carthage
  neovim
  mackup
  wget
  tmux
)

brew install "${apps[@]}"
brew cleanup


caskapps=(
  font-hack-nerd-font
  google-chrome
  sublime-text-dev
  iterm2
)

# brew cask install --appdir="/Applications" "${caskapps[@]}"
