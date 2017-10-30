atom_clean() {
  for pkg in $(apm list --bare --installed); do
    apm remove ${pkg[(ws:@:)1]}
  done
}

atom_install() {
  for pkg in $(cat ~/Documents/dotfiles/Atom/packages.txt); do
    apm install ${pkg[(ws:@:)1]}
  done
}

atom_save() {
  apm list --bare --installed | grep '^[^@]\+' -o > ~/Documents/dotfiles/Atom/packages.txt
}

atom_list() {
  apm list --bare --installed | grep '^[^@]\+' -o
}
