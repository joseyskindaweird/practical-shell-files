#!/bin/bash

# Update the system
echo "Updating main packages.."
sudo pacman -Syu --noconfirm

# Check if yay is installed
if ! command -v yay &> /dev/null; then
    echo "yay is not installed. Do you want to install it? (y/n)"
    read -r answer

    if [[ $answer =~ ^[Yy]$ ]] ;then
        echo "Installing yay..."
        git clone https://aur.archlinux.org/yay.git
        cd yay || { echo "Failed to change directory!"; exit 1; }
        makepkg -si
        cd .. || { echo "Failed to change directory!"; exit 1; }
        rm -rf yay
    fi
else
    echo "yay is already installed, continuing..."
fi

# Update the AUR
echo "Updating AUR.."
yay -Syu --noconfirm