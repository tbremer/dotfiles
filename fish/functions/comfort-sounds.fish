function comfort-sounds
    set -l enabled (defaults read com.apple.ComfortSounds "comfortSoundsEnabled")

   if test "$enabled" -eq 1
        defaults write com.apple.ComfortSounds "comfortSoundsEnabled" -bool "false"
    else
        defaults write com.apple.ComfortSounds "comfortSoundsEnabled" -bool "true"
    end

    launchctl kill SIGHUP gui/501/com.apple.accessibility.heard
end

