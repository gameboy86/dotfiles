if ! type "$vfox" &> /dev/null; then
  eval "$(vfox activate zsh)"
else
  echo "[vfox] Not installed"
fi
