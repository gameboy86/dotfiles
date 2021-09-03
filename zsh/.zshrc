export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(
    git
    virtualenv
    history
    pipenv
    sudo
    zsh-autosuggestions
    docker
    docker-compose
)

source $ZSH/oh-my-zsh.sh

### Dart/Flutter ###
export JAVA_HOME='/usr/lib/jvm/java-8-openjdk'
export PATH=$JAVA_HOME/bin:$PATH 
export ANDROID_SDK_ROOT='/opt/android-sdk'
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools/
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin/
export PATH=$PATH:$ANDROID_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/
####################
### NNN ###########
BLK="0B" CHR="0B" DIR="04" EXE="06" REG="00" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
export NNN_PLUG="j:autojump;p:preview-tui;t:preview-tabbed;f:fzcd"
export NNN_FIFO="/tmp/nnn.fifo"

n ()
{
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    nnn "$@"
    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}


##################
alias viewer="atril"
alias vim="nvim"
alias cat="bat"
alias ocat="/bin/cat"

alias nnn="n -er"
alias ls="n -er"
alias ll="/bin/ls -latr"

export GITHUB_TOKEN=$(pass show rentier_new_app_github_token)
export GNUPGHOME="${HOME}/.gnupg"
export VISUAL=vim
export EDITOR="$VISUAL"
export PATH=$PATH:/${HOME}/.local/bin
GPG_TTY=$(tty)
export GPG_TTY

### JUMP ######
eval "$(jump shell zsh)"

__jump_chpwd() {
  jump chdir
}

jump_completion() {
  reply="'$(jump hint "$@")'"
}

j() {
  local dir="$(jump cd $@)"
  test -d "$dir" && cd "$dir"
}

typeset -gaU chpwd_functions
chpwd_functions+=__jump_chpwd

compctl -U -K jump_completion j
#######################

. "$HOME/.cargo/env"

# neofetch
[ -f ~/.fzf.sh ] && source ~/.fzf.zsh
