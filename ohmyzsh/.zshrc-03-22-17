# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bullet-train"
PACKAGE_BG=010
PACKAGE_FG=232
PROFILE="Default"
BULLETTRAIN_GIT_BG=251
BULLETTRAIN_TIME_BG=255
BULLETTRAIN_TIME_FG=000
BULLETTRAIN_GIT_UNTRACKED="%F{226} ✭%F{black}"
BULLETTRAIN_PROMPT_CHAR="\$ "

btry_pct() {
	PCT=`pmset -g ps | grep -Eow '\d+%'`
	echo "[ $PCT ]"
}

package_version() {
  if [[ -f 'package.json' ]]; then
    echo $(node -e "var pkg = require('./package.json').version; if (pkg) console.log(pkg)")
  fi
}

# Change iterm2 profile. Usage it2prof ProfileName (case sensitive)
curprof() {
	PROFILE=`osascript -e 'tell application "iTerm"
	get profile name of current session of current tab of current window
end tell'`
}
it2prof() { echo -e "\033]50;SetProfile=$1\a" }
changeToDefault() {
	it2prof Default;
	PACKAGE_BG=010
	PACKAGE_FG=232
}

changeToLight() {
	it2prof Light;
	PACKAGE_BG=010
	PACKAGE_FG=255
}

curprof
changeTo$PROFILE

prompt_npm() {
  local _npm="$(package_version)"
  [[ -n "$_npm" ]] && prompt_segment $PACKAGE_BG $PACKAGE_FG  "$_npm"
}

BULLETTRAIN_PROMPT_ORDER=(
	time
	git
	npm
	status
	dir
)
RPROMPT='hey buddy'

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration
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
source $DOTFILES/ohmyzsh/battery-prompt.sh
source $ZSH/oh-my-zsh.sh

eval "$(thefuck --alias)"
