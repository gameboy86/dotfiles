if ! type "$fzf" &> /dev/null; then
  eval "$(fzf --zsh)"
else
  echo "[fzf] Not installed"
fi
