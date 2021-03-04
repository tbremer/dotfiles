# Variables
if test -z "$DOTFILES"
  if test -d "$HOME/Documents/dotfiles"
    set -g DOTFILES "$HOME/Documents/dotfiles"
  else if test -d "$HOME/dotfiles"
    set -g DOTFILES "~/dotfiles"
  end
end

# General Aliases
alias l="ls -lah"
alias vim="nvim"
alias resource="source ~/.config/fish/config.fish"
alias mkdir="mkdir -p"
alias download='curl -O -J'
alias dl='download'
alias webtopdf='chrome --headless --disable-gpu --run-all-compositor-stages-before-draw --print-to-pdf-no-header --print-to-pdf'

# Git aliases
alias guy="git"
alias gut="git"
alias gyt="git"
alias got="git"
alias glone="git clone"
alias sta='git status'
alias master='git checkout master && git fetch && git pull origin master'
alias ghash='git rev-parse HEAD'
alias gname='git rev-parse --abbrev-ref HEAD';
alias glog="git log --pretty=format:'%C(yellow)%h%C(reset)%x09%an(%ae)%x09%C(cyan)%s%Creset'"
alias ggraph='git log --graph --oneline --decorate'
alias gcgraph="git log --graph --stat --pretty=format:'%C(yellow)%H%Creset%C(white) - %Creset%C(cyan)%ad%Creset%n''%C(cyan)%an::%Creset %C(white)%s%d%Creset %C(dim white)'"

# Git Config
git config --global alias.unadd "reset HEAD"
git config --global alias.dig 'diff --ignore-space-at-eol -b -w --ignore-blank-lines'

# Static file server with history API
alias pyserv="python3 $DOTFILES/python/static-server.py";

alias glcoud="gcloud"

# the fuck
thefuck --alias | source

# if .fishrc exists at $HOME
if test -e $HOME/.fishrc
  source $HOME/.fishrc
end

set -l is_dark (defaults read -g AppleInterfaceStyle)

if test is_dark != "Dark"
  prof Light
end

