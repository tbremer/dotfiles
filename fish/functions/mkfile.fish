function mkfile
  for arg in $argv
    set d (dirname $arg)
    set f (basename $arg)

    mkdir -p $d
    touch $d/$f

  end
end