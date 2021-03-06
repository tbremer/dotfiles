#!/usr/bin/env bash

# install brew
echo "Installing Homebrew"
/usr/bin/ruby -e "`curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install`"

# own the brews
sudo chown -R `whoami` `brew --prefix`/*

# install cask within brew
echo "Installing Cask"
brew tap caskroom/cask

# install rmtree
echo "Installing RMTREE"
brew tap beeftornado/rmtree

# install the things
echo "Installing all the Brews"
brew install zsh git rbenv thefuck neovim

# Update GIT info
echo "Grabbing your Git config stuff"
echo "Git user.name: "
read G_UN

echo "Git user.email: "
read G_EMAIL

git config --global user.name "$G_UN"
git config --global user.email "$G_EMAIL"

# clone dotfiles
echo "Pulling in Dotfiles"
DOT_PATH="$HOME/Documents/dotfiles"
git clone https://github.com/tbremer/dotfiles.git "$DOT_PATH"

# init dotfiles
cd $DOT_PATH;
git submodule init
git submodule update
cd ~/

# symlink things
local CONFIG_PATH="$HOME/.config/nvim"
mkdir -p "$CONFIG_PATH"
# ln -s "$DOT_PATH/vim/.vim" ~/
ln -s "$DOT_PATH/vim/.vimrc" mkdir -p "$CONFIG_PATH/init.vim"
ln -s "$DOT_PATH/zsh/.zshrc" ~/

# install ruby
echo "Installing Ruby"
LATEST=`rbenv install -l | grep -v - | tail -1 | tr -d '[:space:]'`
rbenv install "$LATEST"
rbenv global "$LATEST"

# install node
echo "Grabbing NodeJS"
N_PATH="$HOME/Documents/n"
git clone https://github.com/tj/n.git "$N_PATH"
cd "$N_PATH"
make
sudo mkdir -p /usr/local/n
sudo chown -R `whoami` /usr/local/n
n lts
echo "Node Version: `node --version`"
echo "NPM Version: `npm --version`"

# Brew cask install things
echo "Installing Casks"
brew cask install appcleaner
brew cask install sublime-text
brew cask install docker
brew cask install sketch
brew cask install postico
brew cask install moom
brew cask install hyper

# Change Shell
echo "Changing shell to ZSH"
sudo chsh -s `which zsh` `whoami`

echo ""
echo "Complete! Please restart your machine!"
echo ""

