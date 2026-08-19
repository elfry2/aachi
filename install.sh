#!/bin/bash

source config.sh

sudo pacman -Syyu
sudo pacman -Syu --noconfirm $pacmanPackages

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rfv yay

yay -Syu --noconfirm $aurPackages

# Install AstroNvim
rm -rvf ~/.config/nvim.bak
rm -rvf ~/.local/share/nvim.bak
rm -rvf ~/.local/state/nvim.bak
rm -rvf ~/.cache/nvim.bak
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rvf ~/.config/nvim/.git

echo "aachi installed."
