if ! type "$zoxide" &> /dev/null; then
  eval "$(zoxide init --cmd cd zsh)"
else
  echo "[zoxide] Not installed"
fi
