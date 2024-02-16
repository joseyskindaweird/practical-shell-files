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
echo "3. LibreOffice"
echo "4. Thorium"
echo "5. Steam"
echo "6. Retroarch"
echo "7. Bluetooth (see docs)"
echo "8. CPU-X"
echo "9. VSCodium"
echo "10. Chromebook-Linux-Audio (see docs)"
echo "11. Octopi" 
echo "12. Mercury (Standard)"
echo "13. Github Desktop"
echo "14. Brave"
echo "15. Google Chrome"
echo "16. Chromium"
echo "17. Firefox"
echo "18. KDE Connect"
echo "19. qBitorrent"
echo "20. RustDesk"
echo "21. Spicetify"
echo "22. auto-cpufreq"
echo "23. Lutris"

# Prompt the user for input
read -p "Enter the number of the program you want to install (1-23): " choice

# Validate the user input
if ((choice < 1 || choice > 23)); then
    echo "Invalid choice. Please enter a number between 1 and 23."
        exit 1
fi

# Program listing
case $choice in
    1)
        sudo pacman -S discord --noconfirm
        ;;
    2)
        sudo pacman -S spotify-launcher --noconfirm
        ;;
    3)
        sudo pacman -S libreoffice-still --noconfirm
        ;;
    4)
        echo "Compressing will take a while! Be patient." 
        yay -S thorium-browser-bin --noconfirm
        ;;
    5)
        sudo pacman -S steam --noconfirm
        ;;
    6)
        sudo pacman -S retroarch --noconfirm
        ;;
    7)
        cd; curl -LO https://raw.githubusercontent.com/strangetheproot/practical-shell-files/main/scripts/Bluetooth.sh && sudo bash Bluetooth.sh
        read -p "Do you want to reboot now to apply changes? (Y/N)? " reboot_choice04u-847=85=
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
        cd chromebook-linux-audio || exit
        ./setup-audio
        cd ..
        sudo rm -rf chromebook-linux-audio
        ;;
    11)
        yay -S octopi --noconfirm
        ;;
    12)
       yay -S mercury-browser-bin --noconfirm
       ;;
    13)
       yay -S github-desktop --noconfirm
       ;;
    14)
       yay -S brave --noconfirm
       ;;
    15)
       echo "Get ready for bloat..you sure about this?"
       yay -S google-chrome --noconfirm
       ;;
    16)
       sudo pacman -S chromium --noconfirm
       ;;
    17)
       sudo pacman -S firefox --noconfirm
       ;;
    18)
       sudo pacman -S kdeconnect --noconfirm
       ;;
    19)
       sudo pacman -S qbittorrent --noconfirm
       ;;
    20)
    if ! which flatpak > /dev/null; then
        echo "You don't have flatpak. Installing..."
        sudo pacman -S flatpak --noconfirm
        read -p "Do you want to reboot now to apply changes? (Y/N)? " reboot_choice
        if [[ $reboot_choice == "Y" || $reboot_choice == "y" ]]; then
            sudo reboot
        fi
    fi
       wget https://github.com/rustdesk/rustdesk/releases/download/1.2.3/rustdesk-1.2.3-x86_64.flatpak
       echo "Press Y to install Rustdesk"
       sudo flatpak install rustdesk-1.2.3-x86_64.flatpak 
       ;;
    21)
       yay -S spicetify-cli --noconfirm
       curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.sh | sh
       spicetify apply
       ;;
    22)
       git clone https://github.com/AdnanHodzic/auto-cpufreq.git
       cd auto-cpufreq && sudo ./auto-cpufreq-installer
       sudo auto-cpufreq --install
       ;;
    23)
       sudo pacman -S lutris --noconfirm
       ;;
    *)
        echo "Invalid choice."
        exit 1
        ;;
esac
      
echo "Recommend packages to put here on the socials on my README!"
echo "Practical shell scripts by Strange."