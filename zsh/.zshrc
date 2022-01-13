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
    zsh-vi-mode
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
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable


##### VI MODE
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
ZVM_VI_HIGHLIGHT_FOREGROUND=green             # Color name
ZVM_VI_HIGHLIGHT_FOREGROUND=#008800           # Hex value
ZVM_VI_HIGHLIGHT_BACKGROUND=red               # Color name
ZVM_VI_HIGHLIGHT_BACKGROUND=#ff0000           # Hex value
ZVM_VI_HIGHLIGHT_EXTRASTYLE=bold,underline    # bold and underline
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BEAM
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE

export PYTHONPATH=/usr/bin/python3.10

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

#### ZSH history
#
bindkey -M vicmd "j" up-line-or-beginning-search
bindkey -M vicmd "k" down-line-or-beginning-search

##################
alias viewer="atril"
alias vim="nvim"
alias cat="bat"
alias ocat="/bin/cat"

alias nnn="n -er"
alias ls="n -er"
alias ll="/bin/ls -latr"

export GNUPGHOME="${HOME}/.gnupg"
export PATH=$PATH:$HOME/local_scripts
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

[ -f ~/.fzf.sh ] && source ~/.fzf.zsh
