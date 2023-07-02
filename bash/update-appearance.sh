#!/usr/bin/env bash

[[ $(defaults read -g AppleInterfaceStyle 2>/dev/null) == "Dark" ]] && echo "Dark" > $HOME/.appearance || echo "Light" > $HOME/.appearance
