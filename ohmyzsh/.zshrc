# Powerline and ASCII Characters
PWRLN_VCS='\ue0a0'
PWRLN_LN='\ue0a1'
PWRLN_LCK='\ue0a2'
PWRLN_ARW_BLK_R='\ue0b0'
PWRLN_ARW_R='\ue0b1'
PWRLN_ARW_L_BLK='\ue0b2'
PWRLN_ARW_L='\ue0b3'
ARW='\u2794'

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

prompt() {
	echo -e "$1"
}

arrow_prompt() {
	prompt "%B%(?:%F{$GREEN}:%F{$RED})$ARW%f%b"
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
source $DOTFILES/ohmyzsh/git-functions.zsh
source $DOTFILES/ohmyzsh/battery-prompt.zsh
source $DOTFILES/ohmyzsh/spectrum.zsh
source $DOTFILES/bash/aliases.sh
