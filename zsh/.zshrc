# Ensure 256 on ubuntu
if [ "$COLORTERM" = "gnome-terminal" ] || [ "$COLORTERM" = "xfce4-terminal" ] ; then
	TERM=xterm-256color
fi

# ENSURE DELETE KEY WORKS AS ASSUMED
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char

# Powerline and ASCII Characters
PWRLN_VCS='\ue0a0'
PWRLN_LN='\ue0a1'
PWRLN_LCK='\ue0a2'
PWRLN_ARW_BLK_R='\ue0b0'
PWRLN_ARW_R='\ue0b1'
PWRLN_ARW_L_BLK='\ue0b2'
PWRLN_ARW_L='\ue0b3'
ARW='\u2794'
SUN='\u2600'

# Special ESC sequences
NEWLINE=$'\n'
UP_LINE=$'\e[1A'
DOWN_LINE=$'\e[1B'

# COLORS!
RED=001
GREEN=002
YELLOW=003
CYAN=006
ORANGE=214

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

setopt auto_cd
setopt multios
setopt prompt_subst

# INIT RBENV
eval "$(rbenv init -)"

# INIT thefuck
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

alias cdcode="cd $CODE";

# LOAD PLUGINS
for plgn in $(ls $DOTFILES/zsh); do
	local file="$DOTFILES/zsh/$plgn"
	if [[ -f "$file" ]]; then
		source "$DOTFILES/zsh/$plgn"
	fi
done

# LOAD AUTO SUGGEST PLUGIN
source $DOTFILES/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

echo "ZSH Loaded!"
echo "----"
