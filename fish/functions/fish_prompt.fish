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
set black (set_color black)

set __fish_git_prompt_color_branch magenta --bold
set __fish_git_prompt_color_cleanstate cyan
set __fish_git_prompt_color_dirtystate white
set __fish_git_prompt_color_invalidstate red
set __fish_git_prompt_color_merging yellow
set __fish_git_prompt_color_stagedstate yellow
set __fish_git_prompt_color_upstream --bold blue

# Icons
set __fish_git_prompt_char_cleanstate ' ✓ '
set __fish_git_prompt_char_conflictedstate ' ⚠️  '
set __fish_git_prompt_char_dirtystate '  '
set __fish_git_prompt_char_invalidstate ' 🤮  '
set __fish_git_prompt_char_stagedstate ' 🚥  '
set __fish_git_prompt_char_stashstate ' ⚑ '
set __fish_git_prompt_char_stateseparator ' ⎮ '
set __fish_git_prompt_char_untrackedfiles ' ✨  '
set __fish_git_prompt_char_upstream_ahead ' ⥂ '
set __fish_git_prompt_char_upstream_behind ' ⥃ '
set __fish_git_prompt_char_upstream_diverged ' ⤭ '
set __fish_git_prompt_char_upstream_equal ' = '

set fish_emoji_width 2

function fish_prompt
  set -l last_status $status
  set -l package_version
  set -l monorepo false
  set -l node_version
  set -l monorepo -1

  if type -q npm
    if test \( -f ./package.json \)
      set node_version (node -v 2>/dev/null);
      set package_version (node -p "require('./package.json').version" 2>/dev/null)

      # package_version could be undefined if it's not present in `package.json`
      if test "$package_version" = "undefined"
        set package_version ""
      end

      set monorepo (node -p "((require('./package.json').workspaces||{}).packages||[]).length" 2>/dev/null)

      # there is a chance that $monorepo ends up as no length variable,
      # if there is an issue with the `package.json` file, account for that here
      if test -z "$monorepo"
        set monorepo -1
      end

    end
  end

  printf '[%s] ' (date +"%T")
  set_color $fish_color_cwd
  printf '%s ' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)

  if test -n "$node_version"
    printf '❬ '
    set_color cyan
    printf '⬢  '
    set_color normal
    printf '%s' $node_version

    if test $monorepo -gt 0
      printf ' ‹'
      set_color magenta
      printf '%s' $monorepo
      set_color normal
      printf '›'
    end

    if test -n "$package_version"
      printf ' @ %s' $package_version
    end

    printf ' ❭'
    set_color normal
  end

  if test $last_status -eq 0
    set_color brgreen
  else
    set_color brred
  end
  printf "\n➔  "

  set_color normal

    if test -f $HOME/.appearance && test -d /Applications/iTerm.app/
  	  prof (cat $HOME/.appearance);
    end
end
