# Battery percentage
get_battery_pct() {
    percent=$(pmset -g batt | grep -o '[0-9]*%' | grep -o '[0-9]*');
    if [[ "$percent" -gt "66" ]]; then
        echo -n "%{$fg[green]%}$percent%%%{$reset_color%} | "
    elif [[ "$percent" -gt "33" ]]; then
        echo -n "%{$fg[yellow]%}$percent%%%{$reset_color%} | "
    else
        echo -n "%{$fg[red]%}$percent%%%{$reset_color%} | "
    fi
}

# Get charging or not charging
get_battery_status() {
    bat_stat=$(pmset -g batt | grep -o "discharging")
    if [ -z "$bat_stat" ]; then
        echo -n "%{$fg[yellow]%}%{$fg[green]%}+%{$reset_color%} | "
    else
        echo -n "%{$fg[black]%}%{$fg[red]%}-%{$reset_color%} | "
    fi
}

# Battery Time Left
get_battery_time() {
    bat_time="$(pmset -g batt | grep -o '[0-9]*:[0-9]*')"
    if [ -z $bat_time ]; then
        echo -n "%{$fg[green]%}calculating%{$reset_color%}"
    elif [ "$bat_time" = "0:00" ]; then
        echo -n "%{$fg[green]%}full%{$reset_color%}"
    else
        echo -n "$bat_time"
    fi
}

# Will be used to build prompt later
build_battery_prompt () {
    get_battery_pct
    get_battery_status
    get_battery_time
}

# Right hand side prompt
RPROMPT="[ \$(build_battery_prompt) ]"
