#!/bin/bash

# Check if yay is installed
if ! which yay > /dev/null; then
# Prompt the user for input
read -p "You have to install yay to continue. This will also install Git. (read docs for more info) (Y/N)? " install_yay

# Validate the user input
if [[ $install_yay == "Y" || $install_yay == "y" ]]; then
    sudo pacman -S git --noconfirm
    echo "Installing yay..."
    git clone https://aur.archlinux.org/yay.git
    cd yay || { echo "Failed to change directory!"; exit 1; }
    makepkg -si
    cd .. || { echo "Failed to change directory!"; exit 1; }
    sudo rm -rf yay
elif [[ $install_yay == "N" || $install_yay == "n" ]]; then
    echo "Sorry bro. Gotta grab it >:3"
    exit 1
else
    echo "Invalid choice. Please enter Y or N."
    exit 1
fi
fi

# Display a text-based menu
echo "Select a program:"
echo "1. Discord"
echo "2. Spotify"
echo "3. Thorium (SSE3)"
echo "4. Thorium (Standard)"
echo "5. Steam"
echo "6. Retroarch"
echo "7. Bluetooth (see docs)"
echo "8. CPU-X"
echo "9. VSCodium"
echo "10. Chromebook-linux-audio (see docs)"
echo "11. Octopi" 

# Prompt the user for input
read -p "Enter the number of the program you want to run (1-11): " choice

# Validate the user input
if ((choice < 1 || choice > 11)); then
    echo "Invalid choice. Please enter a number between 1 and 11."
        exit 1
fi

# Now you can add logic to launch the selected program
case $choice in
    1)
        sudo pacman -S discord --noconfirm
        ;;
    2)
        sudo pacman -S spotify-launcher --noconfirm
        ;;
    3)
        yay -S thorium-browser-sse3-bin --noconfirm
        ;;
    4)
        yay -S thorium-browser-bin --noconfirm
        ;;
    5)
        sudo pacman -S steam --noconfirm
        ;;
    6)
        sudo pacman -S retroarch --noconfirm
        ;;
    7)
        sudo pacman -S bluez blueman bluez-utils --noconfirm
        sudo modprobe btusb
        sudo systemctl enable bluetooth && sudo systemctl start bluetooth
        read -p "Do you want to reboot now (Y/N)? " reboot_choice
        if [[ $reboot_choice == "Y" || $reboot_choice == "y" ]]; then
            sudo reboot
        fi
        ;;
    8)
        yay -S cpu-x --noconfirm
        ;;
    9) 
        yay -S vscodium-bin --noconfirm
        ;;
    10) 
        if ! which git > /dev/null; then
            echo "You don't have git. Installing..."
            sudo pacman -S git --noconfirm
        fi
        if ! which python > /dev/null; then
            sudo pacman -S python --noconfirm
        fi
        git clone https://github.com/WeirdTreeThing/chromebook-linux-audio.git
        cd chromebook-linux-audio
        ./setup-audio
        cd ..
        sudo rm -rf chromebook-linux-audio
        ;;
    11)
        yay -S octopi --noconfirm
        ;;
    *)
        echo "Invalid choice."
        exit 1
        ;;
esac
      
echo "Recommend packages to put here on the socials on my README!"
echo "Practical shell scripts by strange."