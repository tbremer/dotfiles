# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

package_version() {
  if [[ -f 'package.json' ]]; then
    echo $(node -e "var pkg = require('./package.json').version; if (pkg) console.log(pkg)")
  fi
}

BULLETTRAIN_TIME_BG=023
BULLETTRAIN_GIT_BG=030
BULLETTRAIN_DIR_BG=044
BULLETTRAIN_GIT_FG=015
BULLETTRAIN_TIME_FG=015
BULLETTRAIN_DIR_FG=241

prompt_npm() {
  local _npm="$(package_version)"
  [[ -n "$_npm" ]] && prompt_segment 037 white "$_npm"
}

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bullet-train"

BULLETTRAIN_PROMPT_ORDER=(
	time
	git
	npm
	status
	dir
)

BULLETTRAIN_PROMPT_CHAR="\$ "

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git yarn npm)

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

# POWERLINE 9K Stuff
prompt_show_branch() {
  if [ -d ".git" ]; then
	branch=`git rev-parse --abbrev-ref HEAD`;
	"$1_prompt_segment" "HOME_ICON" "$2" "074" "$DEFAULT_COLOR" "$branch" 'HOME_ICON'
  fi
}

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir show_branch vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(battery time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

eval "$(thefuck --alias)"
