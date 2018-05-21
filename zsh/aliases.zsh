# BASH ALIASES
alias l='ls -lah'
alias resource='source ~/.zshrc'
alias download='curl -O -J'
#alias dl='curl -O -J'
alias dl='download'

# GIT ALIASES
alias sta='git status'
alias master='git checkout master && git fetch && git pull origin master'
alias ghash='git rev-parse HEAD'
alias gname='git rev-parse --abbrev-ref HEAD';
alias glog="git log --pretty=format:'%C(yellow)%h%C(reset)%x09%an%x09%C(cyan)%s%Creset'"
alias ggraph='git log --graph --oneline --decorate'
alias gcgraph="git log --graph --stat --pretty=format:'%C(yellow)%H%Creset%C(white) - %Creset%C(cyan)%ad%Creset%n''%C(cyan)%an::%Creset %C(white)%s%d%Creset %C(dim white)'"

# Add an alias for `unadd`
git config --global alias.unadd "reset HEAD"

# Alias
git config --global alias.dig 'diff --ignore-space-at-eol -b -w --ignore-blank-lines'

# Static file server with history API
alias pyserv="python3 $DOTFILES/python/static-server.py";

function push {
	git add .; git commit -m "$1"; git push;
}

function processes {
	COMMAND="ps -ax"
	EXCEPTIONS=()

	while [[ $# > 1 ]]
	do
		key="$1"

		case $key in
			-x|--except)
				# build exceptions array
				EXCEPTIONS+=("$2")
				shift # past argument
				;;
			*)
				# unknown option
				;;
		esac
		shift # past argument or value
	done

	# if exceptions exist build the command up
	if [ ${#EXCEPTIONS[@]} -gt 0 ]; then
		for EXCEPT in "${EXCEPTIONS[@]}"; do
			COMMAND="$COMMAND | grep -v $EXCEPT"
		done
	fi

	# if we still have arguments these are our search string, add it to our
	# command
	if [[ -n $1 ]]; then
		COMMAND="$COMMAND | grep $1"
	fi

	#echo "the command: $COMMAND"

	# run the command
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

	git filter-branch -f --env-filter '
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

function dockerded {
	# stop all containers
	docker stop $(docker ps -a -q)

	# remove all containers
	docker rm $(docker ps -a -q)

	# remove all images
	docker rmi $(docker images -a -q)

	# Remove all volumes
	docker volume rm $(docker volume ls -f dangling=true -q)
}

function mkfile {
	while [[ $# > 0 ]]
	do
		local ARGUMENT="$1"
		local directory=`dirname "$ARGUMENT"`
		local filename=`basename "$ARGUMENT"`
		local extension="${filename##*.}"

		# if directory = "." and filename == "$dir$extension" is dot file

		mkdir -p "$directory"
		touch "$directory/$filename"

		#echo "dir: $directory"
		#echo "file: $filename"
		#echo "ext: $extension"
		#echo "test: $directory$extension"
		#echo ""

		shift
	done
}

echo
echo "Aliases Loaded!"
