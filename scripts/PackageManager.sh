#!/bin/bash

while true; do
    clear

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
            clear
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
    echo "24. GIMP"
    echo "25. Filezilla"
    echo "26. Handbrake"
    echo "27. Java"
    echo "28. Neovim"
    echo "29. Kodi"
    echo "30. OBS"
    echo "31. NewsFlash"
    echo "32. ProtonTricks"
    echo "33. Wine"
    echo "34. WineTricks"
    echo "35. GNOME Disks"

    # Prompt the user for input
    read -p "Enter the number of the program you want to install (1-30), or 'q' to quit: " choice

    # Check if the user wants to quit
    if [[$choice == "q" ]]; then
        break
    fi

    # Validate the user input
    if ((choice < 1 || choice > 30)); then
        echo "Invalid choice. Please enter a number between 1 and 30."
        exit 1
    fi

    # Program listing
    case $choice in
    1)
        clear
        sudo pacman -S discord --noconfirm
        ;;
    2)
        clear
        sudo pacman -S spotify-launcher --noconfirm
        ;;
    3)
        clear
        sudo pacman -S libreoffice-still --noconfirm
        ;;
    4)
        clear
        echo "Thorium doesn't work until the next version, segmentation fault." 
        ;;
    5)
        clear
        sudo pacman -S steam --noconfirm
        ;;
    6)
        clear
        sudo pacman -S retroarch --noconfirm
        ;;
    7)
        clear
        cd; curl -LO https://raw.githubusercontent.com/strangetheproot/practical-shell-files/main/scripts/Bluetooth.sh && sudo bash Bluetooth.sh
        clear
        read -p "Do you want to reboot now to apply changes? (Y/N)? " reboot_choice04u-847=85=
        if [[ $reboot_choice == "Y" || $reboot_choice == "y" ]]; then
            sudo reboot
        fi
        ;;
    8)
        clear
        yay -S cpu-x --noconfirm
        ;;
    9) 
        clear
        yay -S vscodium-bin --noconfirm
        ;;
    10)
        clear
        if ! which git > /dev/null; then
            echo "You don't have git. Installing..."
            sudo pacman -S git --noconfirm
        fi
        if ! which python > /dev/null; then
            sudo pacman -S python --noconfirm
        fi
        git clone https://github.com/WeirdTreeThing/chromebook-linux-audio.git
        clear
        cd chromebook-linux-audio || exit
        ./setup-audio
        cd ..
        sudo rm -rf chromebook-linux-audio
        clear
        ;;
    11)
        clear
        yay -S octopi --noconfirm
        ;;
    12)
       clear
       yay -S mercury-browser-bin --noconfirm
       ;;
    13)
       clear
       yay -S github-desktop --noconfirm
       ;;
    14)
       clear
       yay -S brave --noconfirm
       ;;
    15)
       clear
       echo "Get ready for bloat..you sure about this?"
       yay -S google-chrome --noconfirm
       ;;
    16)
       clear
       sudo pacman -S chromium --noconfirm
       ;;
    17)
       clear
       sudo pacman -S firefox --noconfirm
       ;;
    18)
       clear
       sudo pacman -S kdeconnect --noconfirm
       ;;
    19)
       clear
       sudo pacman -S qbittorrent --noconfirm
       ;;
    20)
       clear
    if ! which flatpak > /dev/null; then
        echo "You don't have flatpak. Installing..."
        sudo pacman -S flatpak --noconfirm
        read -p "Do you want to reboot now to apply changes? (Y/N)? " reboot_choice
        if [[ $reboot_choice == "Y" || $reboot_choice == "y" ]]; then
            sudo reboot
        fi
    fi
       wget https://github.com/rustdesk/rustdesk/releases/download/1.2.3-1/rustdesk-1.2.3-x86_64.flatpak
       echo "Press Y to install Rustdesk"
       sudo flatpak install rustdesk-1.2.3-x86_64.flatpak 
       ;;
    21)
       clear
       yay -S spicetify-cli --noconfirm
       curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.sh | sh
       clear
       spicetify apply
       ;;
    22)
       clear
       git clone https://github.com/AdnanHodzic/auto-cpufreq.git
       cd auto-cpufreq && sudo ./auto-cpufreq-installer
       sudo auto-cpufreq --install
       ;;
    23)
       clear
       sudo pacman -S lutris --noconfirm
       ;;
    24)
       clear
       sudo pacman -S gimp --noconfirm
       ;;
    25)
       clear
       sudo pacman -S filezilla --noconfirm
       ;;
    26)
       clear
       sudo pacman -S handbrake --noconfirm
       ;;
    27)
       clear
       sudo pacman -S jdk-openjdk --noconfirm
       ;;
    28)
       clear
       sudo pacman -S neovim --noconfirm
       ;;
    29)
       clear
       sudo pacman -S kodi --noconfirm
       ;;
    30)
       clear
       sudo pacman -S obs-studio --noconfirm
       ;;
    31)
       clear
       sudo pacman -S newsflash --noconfirm
       ;;
    32)
       clear
       echo "Also needs WineTricks, installing.."
       clear
       sudo pacman -S winetricks --noconfirm
       echo "Now grabbing ProtonTricks" 
       clear
       yay -S protontricks --noconfirm 
       ;;
    33)
       clear
       sudo pacman -S wine wine-mono wine-gecko --noconfirm
       ;;
    34)
       clear
       sudo pacman -S winetricks --noconfirm
       ;;
    35)
       clear
       sudo pacman -S gnome-disk-utility --noconfirm
       ;;
    *)
        echo "Invalid choice."
        exit 1
        ;;
    esac

    # After installing the selected program ask the user if they want to go back to the main menu
    read -p "Do you want to go back to the main menu? (Y/N): " back_to_menu

    if [[ $back_to_menu != "Y" && $back_to_menu != "y" ]]; then
        break
    fi
done
      
echo "Recommend packages to put here on the socials listed on my README!"
echo "Practical Shell Scripts by Strange."