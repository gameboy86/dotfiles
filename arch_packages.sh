#!/bin/sh

echo "[#1] Start update system"
sudo pacman -Syu
echo "[#1] End update system"

BASE=(
	neovim
	zsh
	tmux
	alacritty
	polybar
	openbox
	picom
	nitrogen
	firefox
	ttf-jetbrains-mono-nerd
)
EXTRA=(
	starship-git
	vfox
	rofi
	
)
echo "[#2] Install pacman packages"
sudo pacman --noconfirm -S $BASE
echo "[#2] End install pacman packages"

echo "[#3] Install pacman packages"
yay -S --noconfirm $EXTRA
echo "[#3] End Install pacman packages"
