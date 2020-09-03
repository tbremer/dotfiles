# Prompt_PWD Options
set fish_prompt_pwd_dir_length 0

# Options
set __fish_git_prompt_show_informative_status
set __fish_git_prompt_showcolorhints
set __fish_git_prompt_showupstream "informative"

# Colors
set green (set_color green)
set cyan (set_color cyan)
set magenta (set_color magenta)
set normal (set_color normal)
set red (set_color red)
set yellow (set_color yellow)

set __fish_git_prompt_color_branch magenta --bold
set __fish_git_prompt_color_dirtystate white
set __fish_git_prompt_color_invalidstate red
set __fish_git_prompt_color_merging yellow
set __fish_git_prompt_color_stagedstate yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red


# Icons
set __fish_git_prompt_char_cleanstate ' 💅  '
set __fish_git_prompt_char_conflictedstate ' ⚠️  '
set __fish_git_prompt_char_dirtystate ' 🏚️  '
set __fish_git_prompt_char_invalidstate ' 🤮  '
set __fish_git_prompt_char_stagedstate ' 🚥  '
set __fish_git_prompt_char_stashstate ' 📦  '
set __fish_git_prompt_char_stateseparator ' | '
set __fish_git_prompt_char_untrackedfiles ' ✨  '
set __fish_git_prompt_char_upstream_ahead ' ☝️  '
set __fish_git_prompt_char_upstream_behind ' 👇  '
set __fish_git_prompt_char_upstream_diverged ' 🚧  '
set __fish_git_prompt_char_upstream_equal ' 💯 '

set fish_emoji_width 2


function fish_prompt
  set last_status $status
  set -l package_version
  set -l node_version

  if type -q npm; and test -f ./package.json
    set package_version (node -p "require('./package.json').version" 2>/dev/null)
    set node_version (node -v 2>/dev/null);
  end

  set_color cyan
  printf '[%s] ' (date +"%T")
  set_color $fish_color_cwd
  printf '%s ' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)
  if test -n "$package_version"
    printf '❬'
    set_color green
    printf '⬢  '
    set_color normal
    printf '%s' $node_version
    printf ' | '
    printf '📦 %s' $package_version
    printf '❭'
    set_color normal
  end
  printf '\n'
  printf "🦦  "

  set_color normal
end
