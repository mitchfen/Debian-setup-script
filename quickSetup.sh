#!/bin/bash
sudo apt-get update

sudo apt-get upgrade

sudo apt-get install ranger vim qbittorrent vlc geany keepassx psensor feh xrandr macchanger zsh xfce4-terminal openssh neofetch htop cmatrix i3 xfce4-screenshooter breeze-cursor-theme git wget curl nemo -y

ranger --copy-config=all

cd /home/*/Downloads git clone https://github.com/mitchfen/configs.git
cd configs
mv .conkyrc /home/*
mv .i3status-small.conf /home/*
mv .vimrc /home/*
mv config /home/*/.config/i3
cd .
sudo rm -r configs

sudo update-grub
