# Powerline and ASCII Characters
PWRLN_VCS='\ue0a0'
PWRLN_LN='\ue0a1'
PWRLN_LCK='\ue0a2'
PWRLN_ARW_BLK_R='\ue0b0'
PWRLN_ARW_R='\ue0b1'
PWRLN_ARW_L_BLK='\ue0b2'
PWRLN_ARW_L='\ue0b3'
RT_ARW='\u279c'

# Special ESC sequences
NEWLINE=$'\n'
UP_LINE=$'\e[1A'
DOWN_LINE=$'\e[1B'

# COLORS!
RED=001
GREEN=002
YELLOW=003
CYAN=006

# Default Profile
PROFILE="Default"

# ===== BEGIN PROFILE TWEAKS
curprof() {
	PROFILE=`osascript -e 'tell application "iTerm"
	get profile name of current session of current tab of current window
end tell'`
}
it2prof() { echo -e "\033]50;SetProfile=$1\a" }
changeToDefault() {
	it2prof Default;
}

changeToLight() {
	it2prof Light;
}

curprof
changeTo$PROFILE
# =====

battery_pct() {
	PCT=`pmset -g ps | grep -Eow '\d+%'`
	echo "[ $PCT% ]"
}

prompt() {
	echo -e "$1"
}

package_version() {
	if [[ -f 'package.json' ]]; then
		echo $(node -e "var pkg = require('./package.json').version; if (pkg) console.log(pkg)")
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

arrow_prompt() {
	prompt "%(?:%F{$GREEN}:%F{$RED})$RT_ARW%f"
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

	str+=' ]'

	prompt $str
}

function precmd() {
	PROMPT="$NEWLINE%F{$CYAN}(%f%3~%F{$CYAN})%f $(git_prompt)$NEWLINE$(arrow_prompt) "
	RPROMPT="%{${UP_LINE}%}$(battery_pct)%{${DOWN_LINE}%}"
}

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# INIT RBENV
eval "$(rbenv init -)"

# SOURCE CONFIGS
if [ -e $HOME/.bash_profile ] ; then
	source $HOME/.bash_profile
fi

if [ -e $HOME/.dotfilesrc ] ; then
	source $HOME/.dotfilesrc
else
	DOTFILES=$HOME/Documents/dotfiles
	CODE=/Volumes/CODE
fi

alias code="cd $CODE";

source $DOTFILES/ohmyzsh/history.zsh
source $DOTFILES/ohmyzsh/completions.zsh
source $DOTFILES/ohmyzsh/spectrum.zsh
source $DOTFILES/bash/aliases.sh
