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

	if [ EXCEPT ]; then
		COMMAND="$COMMAND | grep -v $EXCEPT"
	fi

	if [[ -n $1 ]]; then
		COMMAND="$COMMAND | grep $1"
	fi

	eval $COMMAND
}

function diff {
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

echo "== ALIASES LOADED\n"
