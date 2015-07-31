# BASH ALIASES
alias resource='source ~/.zshrc'

# FOLDER NAVIGATION
alias dev='cd /Volumes/Dev'

# GIT ALIASES
alias sta='git status'
alias master='git checkout master && git fetch && git pull origin master'

function push {
  git add .; git commit -m "$1"; git push;
}


echo "== ALIASES LOADED\n"
