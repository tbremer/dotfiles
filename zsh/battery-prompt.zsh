battery_pct() {
	if hash pmset 2>/dev/null; then
		local _PCT=`pmset -g ps | grep -Eow '\d+%'`

		if [ -z "$_PCT" ]; then
			prompt ""
			return
		fi

		local PCT=${_PCT:0:-1}
		local IS_CHARGING=true;

		if [[ -z `pmset -g ps | grep -o "'AC Power'"` ]]; then
			IS_CHARGING=false
		fi

		local str="[ "

		if [[ "$PCT" -ge "75" ]]; then
			str+="%F{$GREEN}"
		elif [[ "$PCT" -ge "25" ]]; then
			str+="%F{$YELLOW}"
		else
			str+="%F{$RED}"
		fi

		str+="$PCT%%%f"

		if $IS_CHARGING; then
			str+="%F{$ORANGE} $SUN %f"
		fi

		str+=" ]"

		prompt $str
	fi

	if hash upower 2>/dev/null; then
		local BAT=`upower -e | grep 'BAT'`
		local PCT=`upower -i "$BAT" | grep -E "percentage" | tr -dc '0-9'`
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
	fi
}
