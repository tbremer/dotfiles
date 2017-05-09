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
if [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
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
fi
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

# PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# ls colors
autoload -U colors && colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
#export LS_COLORS=di=1;34:ln=1;35:so=1;32:pi=1;33:ex=1;31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43

setopt auto_cd
setopt multios
setopt prompt_subst

# INIT RBENV
eval "$(rbenv init -)"

# INITI thefuck
eval $(thefuck --alias)

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

for plgn in $(ls $DOTFILES/zsh); do
	local file="$DOTFILES/zsh/$plgn"
	if [[ -f "$file" ]]; then
		source "$DOTFILES/zsh/$plgn"
	fi
done

source $DOTFILES/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

echo "ZSH Loaded 🎉"
echo "----"

