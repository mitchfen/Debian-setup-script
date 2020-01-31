#!/bin/bash

# Update distro
sudo apt-get update && sudo apt-get upgrade

# Install apt packages
sudo apt-get install ranger vim vlc keepassxc psensor feh zsh xfce4-terminal neofetch htop i3 xfce4-screenshooter breeze-cursor-theme git wget curl nemo build-essential lxappearance snapd qbittorrent ffmpeg -y

# May be redundant but need to ensure these are present for i3-gaps
sudo apt-get install gcc make dh-autoreconf libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev libxcb-shape0 libxcb-shape0-dev

# Install snap packages
sudo snap install spotify
sudo snap install code --classic
sudo snap install signal-desktop

# Build i3-gaps from source - not in Debian apt repository
cd ~/Downloads
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install
cd ~/Downloads
sudo rm -r i3-gaps


# Move config files to correct directories
ranger --copy-config=all
cd ~/Downloads && git clone https://github.com/mitchfen/configs.git
cd configs
mv i3 ~/.config
mv .vimrc ~/
mv .zshrc ~/

# Cleanup and finishing touches
cd .
sudo rm -r configs
sudo update-grub
sudo apt autoremove -y

# Pretty neofetch goodness
neofetch
