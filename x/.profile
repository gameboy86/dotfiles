libinput-gestures-setup start

setxkbmap -option ctrl:nocaps -layout pl

export TERMINAL=kitty
export EDITOR=nvim
export VISUAL=nvim

picom -f &
. "$HOME/.cargo/env"
