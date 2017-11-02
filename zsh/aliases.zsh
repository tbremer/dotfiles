# BASH ALIASES
alias l='ls -la'
alias resource='source ~/.zshrc'
alias download='curl -O -J'
alias dl='curl -O -J'

# GIT ALIASES
alias sta='git status'
alias master='git checkout master && git fetch && git pull origin master'
alias ghash='git rev-parse HEAD'
alias gname='git rev-parse --abbrev-ref HEAD';
alias ggraph='git log --graph --oneline --decorate'
alias gcgraph="git log --graph --stat --pretty=format:'%C(yellow)%H%Creset%C(white) - %Creset%C(cyan)%ad%Creset%n''%C(cyan)%an::%Creset %C(white)%s%d%Creset %C(dim white)'"

function push {
  git add .; git commit -m "$1"; git push;
}

function processes {
  COMMAND="ps -ax"

  while [[ $# > 1 ]]
  do
    key="$1"

    case $key in
      -x|--except)
        EXCEPT="$2"
        shift # past argument
        ;;
      *)
        # unknown option
        ;;
    esac
    shift # past argument or value
  done

  if [ -n "$EXCEPT" ]; then
    echo "the exception: $EXCEPT"
    COMMAND="$COMMAND | grep -v $EXCEPT"
  fi

  if [[ -n $1 ]]; then
    COMMAND="$COMMAND | grep $1"
  fi

  echo "the command: $COMMAND"

  eval $COMMAND
}

function gdiff {
  BRANCH=$1;

  if [ -z "$BRANCH" ]; then;
    BRANCH="origin/master"
  fi

  git diff $BRANCH --name-status;
  read -d q -s

  for FILE in $(git diff "$BRANCH" --name-only); do
    git diff $BRANCH $FILE;
    read -d q -s
  done;
}

function resethistory {
  echo -n 'Old Email: '
  read OLD_EMAIL

  echo -n 'Correct name: '
  read CORRECT_NAME

  echo -n 'Correct email: '
  read CORRECT_EMAIL

  git filter-branch --env-filter '
  if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
  then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
  fi
  if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
  then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
  fi
  ' --tag-name-filter cat -- --branches --tags
}

echo
echo "Aliases Loaded 🎉"
