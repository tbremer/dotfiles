function lines-changed -a since author
  set -q since[1]; or set since "1 week"
  set -q author[1]; or set author "tom@tbremer.com"

set -l ginfo (git log --author="$author" --numstat --since="$since" --pretty=tformat: | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }')
  echo "$ginfo"
end

