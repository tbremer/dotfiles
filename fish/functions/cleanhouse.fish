function cleanhouse
  set exists (defaults read com.apple.finder CreateDesktop)
  if test "$exists" = "false"
    defaults write com.apple.finder CreateDesktop true
  else
    defaults write com.apple.finder CreateDesktop false
  end

  killall Finder
end
