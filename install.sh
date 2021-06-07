PLUG_PATH=~/.local/share/nvim/site/autoload/plug.vim
CONFIG_PATH=$HOME/.config

echo "Check if nvim configuration exist in ${CONFIG_PATH} ..."

if [ ! -h "${CONFIG_PATH}/nvim" ]; then
    echo "Create symling to nvim confiuguration"
    ln -s  $PWD/config/nvim $CONFIG_PATH/nvim
fi

echo "Check if nvim plug is installed"
if [ ! -f "$PLUG_PATH" ]; then
    echo "nvim plug not exist. Installing ..."
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "End dotfile installation"
