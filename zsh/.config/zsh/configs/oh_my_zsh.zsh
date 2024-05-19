plugins=(
    sudo
    git
    docker
    docker-compose
    zsh-fzf-history-search
    zsh-autosuggestions
    tmux
    shrink-path
)

if [ -f $ZSH/oh-my-zsh.sh ]; then
  source $ZSH/oh-my-zsh.sh
fi

if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

export ZSH=/usr/share/oh-my-zsh/
export ZSH_THEME="jonathan"
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOCONNECT=false
export ZSH_TMUX_AUTOQUIT=false
export ZSH_TMUX_CONFIG=".config/tmux/tmux.conf"
