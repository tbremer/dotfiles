# BASH ALIASES
alias resource='source ~/.zshrc'

# FOLDER NAVIGATION
alias dev='cd /Volumes/Dev'

# GIT ALIASES
alias sta='git status'
alias master='git checkout master && git fetch && git pull origin master'
alias ggraph='git log --graph --oneline --decorate'
alias gitk="git log --graph --stat --pretty=format:'%C(yellow)%H%Creset%C(white) - %Creset%C(cyan)%ad%Creset%n''%C(cyan)%an::%Creset %C(white)%s%d%Creset %C(dim white)'"

function push {
  git add .; git commit -m "$1"; git push;
}


echo "== ALIASES LOADED\n"
