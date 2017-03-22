battery_pct() {
	local _PCT=`pmset -g ps | grep -Eow '\d+%'`
	local PCT=${_PCT:0:-1}

	local str="[ "

	if [[ "$PCT" -ge "75" ]]; then
		str+="%F{$GREEN}"
	elif [[ "$PCT" -ge "25" ]]; then
		str+="%F{$YELLOW}"
	else
		str+="%F{$RED}"
	fi

	str+="$PCT%%"

	str+=" %f]"

	prompt $str
}
