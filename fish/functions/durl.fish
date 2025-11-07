function durl;
  # default copy to false and the needle to the first parameter
  set -l needle "$argv[1]";
  set -l copy 0

  # first param is `-c` set copy to true and needle to second parameter
  if test "$argv[1]" = "-c"
    set needle "$argv[2]"
    set copy 1
  # second param is `-c` set copy to true
  else if test "$argv[2]" = "-c"
    set copy 1
  end

  set needle (string replace --all \/ - "$needle")
  set -l url (string join " " "https://vercel-site-git-"$needle".vercel.sh")

  if test $copy -gt 0
    echo -n "$url" | pbcopy
  else
    echo "$url"
  end
end;