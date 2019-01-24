package_version() {
	if [[ -f 'package.json' ]]; then
		local str="(%F{$CYAN} "
		local PACKAGE_VERSION=$(cat package.json \
			| grep version \
			| head -1 \
			| awk -F: '{ print $2 }' \
			| sed 's/[",]//g' \
			| tr -d '[[:space:]]')

		str+="v$PACKAGE_VERSION"
		str+="%f )"
		prompt $str
	fi
}

is_git_folder() {
	local intree=$(git rev-parse --is-inside-work-tree 2>/dev/null)

	if [ $intree ]; then
		return 0
	fi

	return 1
}

is_tree_dirty() {
	if is_git_folder; then
		if ! [[ -z $(git status --short > /dev/null 2>&1 | tail -n1) ]]; then
			return 0
		fi
	fi

	return 1
}

has_heads() {
	if is_git_folder; then;
		local git_dir=$(git rev-parse --git-dir)
		if [ -n "$(ls -A $git_dir/refs/heads 2>/dev/null)" ]; then
			return 0
		fi
		return 1
	fi

	return 1
}

git_prompt() {
	if ! is_git_folder; then; return; fi

	local str="[ "

	if has_heads; then
		str+="%B$(git rev-parse --abbrev-ref HEAD)%b "
	else
		str+="%BNO HEAD%b "
	fi

	# Git is Dirty
	if is_tree_dirty; then
		str+="%F{$YELLOW}"
	else
		str+="%F{$GREEN}"
	fi

	str+="$PWRLN_VCS%f"

	if [[ -f 'package.json' ]]; then
		str+=" $(package_version)"
	fi

	str+=' ]'

	prompt $str
}

glone() {
	repo=$1
	shift
	git clone "$repo" $@
}

function glc {
	local COMMAND="git ls-files"
	local INCLUSIONS=()

	while [[ $# > 1 ]]
	do
		key="$1"

		case $key in
			-i|--include)
				# build exceptions array
				INCLUSIONS+=("$2")
				shift # past argument
				;;
			*)
				# unknown option
				;;
		esac
		shift # past argument or value
	done

	# if exceptions exist build the command up
	if [ ${#INCLUSIONS[@]} -gt 0 ]; then
		for EXCEPT in "${INCLUSIONS[@]}"; do
			COMMAND="$COMMAND | grep $EXCEPT"
		done
	fi

	COMMAND="$COMMAND | xargs wc -l"

	eval $COMMAND
}
