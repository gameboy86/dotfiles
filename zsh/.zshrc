# load config stored and distributed by dotfiles repo
# this settings are universal for all my enviorments

for conf in "$HOME/.config/zsh/configs/"*.zsh; do
  source "${conf}"
done
unset conf

# local configuratin dedicated for this system
for conf in "$HOME/zsh/configs/"*.zsh; do
  source "${conf}"
done
unset conf

setopt GLOB_DOTS
setopt SHARE_HISTORY

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi
