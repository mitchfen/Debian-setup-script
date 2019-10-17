#!/bin/bash
sudo apt-get update && sudo apt-get upgrade
sleep 2
sudo apt-get install ranger vim qbittorrent vlc geany keepassx psensor feh macchanger zsh xfce4-terminal neofetch htop cmatrix i3 xfce4-screenshooter breeze-cursor-theme git wget curl nemo build-essential lxappearance -y
sleep 2
ranger --copy-config=all
cd /home/*/Downloads && git clone https://github.com/mitchfen/configs.git
cd configs
mv .conkyrc /home/*
mv .i3status-small.conf /home/*
mv .vimrc /home/*
mv config /home/*/.config/i3
cd .
sudo rm -r configs
sudo update-grub
sudo apt autoremove -y
apt list --installed
