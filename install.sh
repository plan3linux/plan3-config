#!/bin/sh

echo "Installing Packages"
paru -Syyu --noconfirm bspwm zsh emacs i3-wm i3blocks i3lock i3status noto-fonts kvantum openbox polybar qtile sxhkd volumeicon zen-browser-bin waypaper feh picom qt6-multimedia-ffmpeg pipewire-jack ttf-ibm-plex
#paru -S --noconfirm dolphin kate kalk xclip ark
paru -S --noconfirm pwvucontrol wireplumber pipewire pipewire-alsa pipewire-pulse
paru -S --noconfirm thunar gvfs xclip xarchiver xfce4-mixer thunar-archive-plugins thunar-media-tags-plugin thunar-shares-plugins tumbler
paru -S --noconfirm lxappearance starship zoxide fzf fd eza mpv stalonetray network-manager-applet dunst dex
paru -S --noconfirm sddm kvantum kvantum-qt5 breeze kde-cli-tools rofi fastfetch

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

sudo systemctl enable sddm --now
