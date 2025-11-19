#!/bin/sh

echo "Installing Packages"
paru -Syyu bspwm zsh emacs i3-wm i3blocks i3lock i3status kvantum openbox polybar qtile sxhkd volumeicon zen-browser-bin waypaper feh picom
paru -S dolphin kate kalk xclip
paru -S lxappearance starship zoxide fzf fd eza

echo "Copying Configuration Files"
cp -r .config ~

echo "Copying Theme and Icons"
cp -r .local ~
cp -r .themes ~
cp -r .icons ~
cp xresources ~/.Xresources

echo "Compiling Suckless Suite (DWM, ST, DRUN)"
~/.local/bin/dwm-rcmp

echo "Installing Doom Emacs"
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
#~/.config/emacs/bin/doom install
~/.config/emacs/bin/doom sync
~/.config/emacs/bin/doom env
emacs --batch -f nerd-fonts-install-fonts

echo "Installing LazyVim"
git clone https://github.com/LazyVim/starter ~/.config/nvim

echo "Install ZSH Goodies"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/z-shell/F-Sy-H.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/F-Sy-H
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
starship preset gruvbox-rainbow -o ~/.config/starship.toml

echo "Overwriting ZSH Config"
cp p3-zsh ~/.zshrc
