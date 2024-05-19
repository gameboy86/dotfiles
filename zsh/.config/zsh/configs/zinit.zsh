base_zinit_configs_dir="$HOME/.config/zsh/configs/zinit"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# PLUGINS
zinit ice atinit"
    ZSH_TMUX_FIXTERM=false;
		ZSH_TMUX_AUTOSTART=true;
		ZSH_TMUX_AUTOCONNECT=false;
		ZSH_TMUX_AUTOQUIT=false;"

zinit snippet OMZP::tmux

## syntax highlighting
zinit light zsh-users/zsh-syntax-highlighting

## completions
zinit light zsh-users/zsh-completions

## autosuggestions
zinit light zsh-users/zsh-autosuggestions

## fzf
zinit light Aloxaf/fzf-tab

# SNIPPETS
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found


# load competions
autoload -U compinit && compinit
zinit cdreplay -q

# KEYBINDINGS
bindkey -e
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

# SETTINGS
## History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt globdots

# COMPLETIONS STYLE
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
