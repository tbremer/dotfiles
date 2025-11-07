function vct;
  set -l testmode "vtest314"
  set -l me (whoami)
  set -l today (date "+%m%d%y")
  set -l fn "vct-$today"
  set -l file "/tmp/$fn"
  set -l str ""

  if not test -f $file
    touch $file
    echo '00' > $file
  end

  if contains "clock" $argv
    set testmode "$testmode-clock-now"
  else if contains "northstar" $argv
    set testmode "$testmode-northstar"
  end


  set -l fc  (cat $file)
  set -l num (math $fc + 1)

  echo $num > $file

  if contains "northstar" $argv
    set str "$testmode-$me-$today-$num"
  else
    set str "$me-$testmode-$today-$num"
  end

  if contains -- -c $argv
    echo -n "$str"|pbcopy
  else
    echo "$str"
  end
end;