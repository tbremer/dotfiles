#!/usr/bin/env bash
[[ $(defaults read -g AppleInterfaceStyle 2>/dev/null) == "Dark" ]] && osascript -e 'tell application "System Events" to tell every desktop to set picture to "~/dotfiles/backgrounds/dark-mode.jpg"' || osascript -e 'tell application "System Events" to tell every desktop to set picture to "~/dotfiles/backgrounds/light-mode.jpg"';
