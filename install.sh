PLUG_PATH=~/.local/share/nvim/site/autoload/plug.vim
NVIM_CONFIG_PATH=$HOME/.config
I3WM_CONFIG_PATH=$HOME/.config

SCRIPTS_PATH=$HOME
ZSH_PATH=$HOME

TMUX_PLUG_PATH=$HOME/.tmux
TMUX_CONFIG_PATH=$HOME


echo "Start dotfile installation ..."

####### I3WM #######
echo "[*] I3wm cofniguration"
echo "   -> Check if i3 configuration exist in ${I3WM_CONFIG_PATH} ..."

if [ ! -h "${I3WM_CONFIG_PATH}/i3" ]; then
    echo "   -> Create symling to i3 confiuguration"
    ln -s  $PWD/config/i3 $I3WM_CONFIG_PATH/i3
fi

####### Nvim #######
echo "[*] NVim cofniguration"
echo "   -> Check if nvim configuration exist in ${NVIM_CONFIG_PATH} ..."

if [ ! -h "${NVIM_CONFIG_PATH}/nvim" ]; then
    echo "  -> Create symling to nvim confiuguration"
    ln -s  $PWD/config/nvim $NVIM_CONFIG_PATH/nvim
fi

echo "   -> Check if nvim plug is installed"
if [ ! -f "$PLUG_PATH" ]; then
    echo "   -> NVim plug not exist. Installing ..."
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi


####### Tmux #######
echo "[*] Tmux configuration"
echo "   -> Check if tmux configuration exist in ${TMUX_CONFIG_PATH} ..."
if [ ! -h "${TMUX_CONFIG_PATH}/.tmux.conf" ]; then
    echo "   -> Create Symlink to tmux configuration"
    ln -s $PWD/config/tmux/tmux.conf $TMUX_CONFIG_PATH/.tmux.conf
fi

echo "   -> Check if tmux pluging mannager is installed"
if [ ! -d "$TMUX_PLUG_PATH" ]; then
    echo "   -> Tmux pluging manager not exist. Installing ..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi


####### Scripts #######
echo "[*] Scripts"
echo "   -> Check if scripts exist in ${SCRIPTS_PATH} ..."
if [ ! -h "${SCRIPTS_PATH}/scripts" ]; then
    echo "   -> Create Symlink to scripts"
    ln -s $PWD/config/scripts $HOME/scripts
fi


####### Zsh #######
echo "[*] zsh config"
echo "   -> Check if config exist in ${ZSH_PATH} ..."
if [ ! -d "${HOME}/.oh-my-zsh" ]; then
    echo "   -> Install oh my zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ ! -h "${ZSH_PATH}/.zshrc" ]; then
    echo "   -> Create Symlink to zshrc"
    ln -s $PWD/config/zsh/config $HOME/.zshrc
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if [ ! -h "${ZSH_PATH}/.fzf.zsh" ]; then
    echo "   -> Create Symlink to fzf.zsh"
    ln -s $PWD/config/zsh/fzf.zsh $HOME/.fzf.zsh
fi


####### Git #######
echo "[*] git config"
echo "   -> Check if config exist in ${HOME} ..."
if [ ! -h "${HOME}/.gitconfig" ]; then
    echo "   -> Create Symlink to .gitconfig"
    ln -s $PWD/config/git/config $HOME/.gitconfig
fi

echo "End dotfile installation"
