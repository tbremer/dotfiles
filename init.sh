#!/usr/bin/env bash

# Colors for output
readonly BOLD='\033[1m'
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly MAGENTA='\033[0;35m'
readonly BLUE='\033[0;34m'
readonly RESET='\033[0m'

header() {
    echo -e "\n${BOLD}${MAGENTA}$1${RESET}"
}
success() {
    echo -e "${BOLD}${GREEN}$1${RESET}"
}
error() {
    echo -e "${BOLD}${RED}$1${RESET}"
}
question() {
    echo -e "${BLUE}$1${RESET}"
}

# add check for git, if not installed exit with message asking them to install devtooling

# install brew
header "Installing Homebrew"
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
success "✓ Homebrew installed!"


# Update GIT info
header "Grabbing your Git config stuff"
read -p "$(question 'Git user.name: ')" G_UN
read -p "$(question 'Git user.email: ')" G_EMAIL
git config --global user.name "$G_UN"
git config --global user.email "$G_EMAIL"
success "✓ Git config updated!"

# clone dotfiles
header "Cloning in dotfiles repo"
DOT_PATH="$HOME/.dotfiles"
git clone https://github.com/tbremer/dotfiles.git "$DOT_PATH"
success "✓ dotfiles cloned!"

header "Installing brews, casks, etc."
brew bundle --file "$DOT_PATH/Brewfile"
success "✓ Homebrew installed!"

# Change Shell
header "Changing shell to fish 🐟"
sudo chsh -s `which fish` `whoami`
success "✓ Shell changed!"

echo ""
success "================================================"
success "     Complete! Please restart your machine!"
success "================================================"
echo""

read -p "$(question 'Reboot now? [Y/n]: ')" answer
if [[ -z "$answer" || "$answer" == [Yy] ]]; then
    sudo reboot now
fi
