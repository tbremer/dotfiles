#!/usr/bin/env bash

[[ $(defaults read -g AppleInterfaceStyle 2>/dev/null) == "Dark" ]] && echo "Default" > $HOME/.appearance || echo "Light" > $HOME/.appearance