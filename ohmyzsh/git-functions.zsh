package_version() {
	if [[ -f 'package.json' ]]; then
		local pkg=`node -e "var pkg = require('./package.json').version; if (pkg) console.log(pkg)"`
		local str="(%F{$CYAN} "

		str+="$pkg"

		str+="%f )"

		prompt $str
	fi
}

is_git_folder() {
	if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
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

git_prompt() {
	if ! is_git_folder; then; return; fi

	local str="[ "

	str+="%B$(git rev-parse --abbrev-ref HEAD)%b "

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
