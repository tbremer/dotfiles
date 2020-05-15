alias l="ls -lah"
alias vim="nvim"
alias sta='git status -s'
alias resource="source ~/.config/fish/config.fish"
alias mkdir="mkdir -p"
alias ts="ts-node"
alias refmt="bsrefmt"

# Git aliases
alias guy="git"
alias gut="git"
alias gyt="git"
alias got="git"
alias glone="git clone"

# the fuck
thefuck --alias | source

if test -z (which code)
echo "got em"
    alias code='code'
end


# Java / Android bullshit
set -x JAVA_HOME (/usr/libexec/java_home)
set -x ANDROID_HOME /Users/bremert/Library/Android/sdk
set PATH $ANDROID_HOME/platform-tools $PATH
set PATH $ANDROID_HOME/tools $PATH
set PATH $ANDROID_HOME/emulator $PATH

alias dark="prof Dark"
alias light="prof light"

#function iterm_color --on-event fish_promp
#  if test (date +'%H') -gt 18
#    echo -e "\033]50;SetProfile=Dark\a"
#  else
#    echo -e "\033]50;SetProfile=Default\a"
#  end
#end

# THEME PURE #
# set fish_function_path /Users/bremert/.config/fish/functions/theme-pure/functions/ $fish_function_path
# source /Users/bremert/.config/fish/functions/theme-pure/conf.d/pure.fish
