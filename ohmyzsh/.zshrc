# Path to your oh-my-zsh installation.
export ZSH=/Users/tbremer/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

battery_pct() {
	PCT=`pmset -g ps | grep -Eow '\d+%'`
	echo "[ $PCT% ]"
}

package_version() {
	if [[ -f 'package.json' ]]; then
		echo $(node -e "var pkg = require('./package.json').version; if (pkg) console.log(pkg)")
	fi
}

is_git_folder() {
	git status >/dev/null 2>&1

	if [ $? -eq 0 ]; then
		return 0
	else
		return 1
	fi
}

git_status() {
	echo git status --short 2> /dev/null | tail -n 1
}

prompt() {
	echo -e "$1"
}

status_prompt() {
	if [ git_status ]; then
		prompt '*'
	else
		prompt '\u2713'
	fi
}

PWRLN_VCS='\ue0a0'
PWRLN_LN='\ue0a1'
PWRLN_LCK='\ue0a2'
PWRLN_ARW_BLK_R='\ue0b0'
PWRLN_ARW_R='\ue0b1'
PWRLN_ARW_L_BLK='\ue0b2'
PWRLN_ARW_L='\ue0b3'
RT_ARW='\u279c'

# User configuration
RPROMPT='$(battery_pct)'
PROMPT="(%3~) `status_prompt` %{$FX[bold]%}`prompt $RT_ARW`%{$FX[reset]%} "

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

source $DOTFILES/bash/aliases.sh
