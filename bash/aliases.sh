# BASH ALIASES
alias resource='source ~/.zshrc'

# FOLDER NAVIGATION
alias code='if [ -d /Volumes/CODE ] ; then; cd /Volumes/CODE; else; cd /Volumes/DEV; fi'

# GIT ALIASES
alias sta='git status'
alias master='git checkout master && git fetch && git pull origin master'
alias ghash='git rev-parse HEAD'
alias ggraph='git log --graph --oneline --decorate'
alias gcgraph="git log --graph --stat --pretty=format:'%C(yellow)%H%Creset%C(white) - %Creset%C(cyan)%ad%Creset%n''%C(cyan)%an::%Creset %C(white)%s%d%Creset %C(dim white)'"
alias diff="for file in `git diff origin/master --name-only`; do; git diff origin/master $file; done;"

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


echo "== ALIASES LOADED\n"
