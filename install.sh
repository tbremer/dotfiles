#!/usr/bin/env bash

# install brew
/usr/bin/ruby -e "`curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install`"

# own the brews
sudo chown -R `whoami` `brew --prefix`/*

# install cask within brew
brew tap caskroom/cask

# install rmtree
brew tap beeftornado/rmtree

# install the things
brew install zsh git rbenv thefuck

# Update GIT info
echo "Grabbing your Git config stuff"
echo -n "Git user.name: "
read -n G_UN

echo -n "Git user.email: "
read -n G_EMAIL

git config --global user.name "$G_UN"
git config --global user.email "$G_EMAIL"

# clone dotfiles
DOT_PATH="~/Documents/dotfiles"
git clone https://github.com/tbremer/dotfiles.git "$DOT_PATH"

# init dotfiles
cd $DOT_PATH;
git submodule init
git submodule update
cd ~/

# symlink things
ln -s "$DOT_PATH/vim/.vim*" ~/
ln -s "$DOT_PATH/zsh/.zshrc" ~/

# install vim
brew install vim --with-lua --with-python3 --with-override-system-vim

# install ruby
LATEST=`rbenv install -l | grep -v - | tail -1`
rbenv install "$LATEST"
rbenv global "$LATEST"

# install node
N_PATH="~/Documents/n"
git clone https://github.com/tj/n.git "$N_PATH"
cd "$N_PATH"
make
n lts
echo "Node Version: `node --version`"
echo "NPM Version: `npm --version`"

# Brew cask install things
read -d '' CASKS << EOF
slack
firefox
1password
appcleaner
atom
sublime-text
docker
sketch
postico
moom
iterm2
EOF

for PKG in "$CASKS"; do
	brew cask install "$PKG"
done;

# Change Shell
sudo chsh -s `which zsh` `whoami`

echo ""
echo "Complete! Please restart your machine!"
echo ""

