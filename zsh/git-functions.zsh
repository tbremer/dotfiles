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
		echo ""
		if [ -n "$(ls -A .git/refs/heads 2>/dev/null)" ]; then
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
