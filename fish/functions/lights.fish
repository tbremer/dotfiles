function lights
  set -l mode = (cat $HOME/.appearance)
  osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to not dark mode'

  if test "$mode" = "Dark"
    echo "Light" > $HOME/.appearance
  else
    echo "Dark" > $HOME/.appearance
  end
end
