if ! type "$starship" &> /dev/null; then
	eval "$(starship init zsh)"
else
	echo "[starship prompt] Not installed"
fi
