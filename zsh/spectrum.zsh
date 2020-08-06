#! /bin/zsh
# A script to make using 256 colors in zsh less painful.
# P.C. Shyamshankar <sykora@lucentbeing.com>
# Copied from http://github.com/sykora/etc/blob/master/zsh/functions/spectrum/

ZSH_SPECTRUM_TEXT="Arma virumque cano Troiae qui primus ab oris"

# Show all 256 colors with color number
function spectrum_ls() {
  for code in {000..016}; do
		print -P "$code: %F{$code}$ZSH_SPECTRUM_TEXT%f"
  done
}

# Show all 256 colors where the background is set to specific color
function spectrum_bls() {
  for code in {000..016}; do
		print -P "$code: %K{$code}$ZSH_SPECTRUM_TEXT%k"
  done
}

#function spectrum_256() {
  for code in {000..256}; do
		print -P "$code: %K{$code}$ZSH_SPECTRUM_TEXT%k"
  done
#}

