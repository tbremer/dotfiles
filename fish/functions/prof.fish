# alias dark="echo -e \"\033]50;SetProfile=Dark\a\""
# alias light="echo -e \"\033]50;SetProfile=Default\a\""
function prof
    echo -e "\033]50;SetProfile=$argv[1]\a"
    set -u ITERM_PROFILE "$argv[1]"
end
