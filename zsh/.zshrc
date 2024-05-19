# load config stored and distributed by dotfiles repo
# this settings are universal for all my enviorments

base_zsh_configs_dir="$HOME/.config/zsh/configs"
source "${base_zsh_configs_dir}/zinit.zsh"
source "${base_zsh_configs_dir}/paths.zsh"
source "${base_zsh_configs_dir}/aliases.zsh"
source "${base_zsh_configs_dir}/envs.zsh"
# source "${base_zsh_configs_dir}/apps/p10k.zsh"
source "${base_zsh_configs_dir}/apps/starship.zsh"
source "${base_zsh_configs_dir}/apps/fzf.zsh"
source "${base_zsh_configs_dir}/apps/zoxide.zsh"
source "${base_zsh_configs_dir}/apps/vfox.zsh"

# local configuratin dedicated for this system
if [ -d "$HOME/zsh/configs" ]
then
  for conf in "$HOME/zsh/configs/"*.zsh; do
    source "${conf}"
  done
  unset conf
fi
