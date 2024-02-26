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
    echo "1. Cowsay"
    echo "2. Fortune"
    echo "3. Telnet"
    echo "4. 2048"
    echo "5. KNetWalk"
    echo "6. Tetris-like game"
    echo "7. FIGlet"
    echo "8. cMatrix"
    echo "9. sl"
    echo "10. xEyes"
    echo "11. eSpeak"
    echo "12. asciiquarium"
    echo "13. Minesweeper"

    # Prompt the user for input
    read -p "Enter the number of the program you want to install (1-13), or press q to quit: " choice

    # Check if the user wants to quit
    if [[$choice == "q" ]]; then
        break
    fi

    # Validate the user input
    if ((choice < 1 || choice > 13)); then
    echo "Invalid choice. Please enter a number between 1 and 12."
    exit 1
fi

    # Program listing
    case $choice in
    1)
        clear
        sudo pacman -S cowsay --noconfirm
        ;;
    2)
        clear
        sudo pacman -S fortune-mod --noconfirm
        ;;
    3)
        clear
        sudo pacman -S inetutils --noconfirm
        ;;
    4)
        clear
        sudo pacman -S gnome-2048 --noconfirm
        ;;
    5)
        clear
        sudo pacman -S knetwalk --noconfirm
        ;;
    6)
        clear
        sudo pacman -S quadrapassel --noconfirm
        ;;
    7)
        clear
        sudo pacman -S figlet --noconfirm
        ;;
    8)
        clear
        sudo pacman -S cmatrix --noconfirm
        ;;
    9)
        clear
        sudo pacman -S sl --noconfirm
        sl
        ;;
    10)
        clear
        sudo pacman -S xorg-xeyes --noconfirm
        ;;
    11)
        clear
        yay -S espeak --noconfirm
        ;;
    12)
        sudo pacman -S asciiquarium --noconfirm
        ;;
    13)
        sudo pacman -S gnome-mines --noconfirm
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

echo "Practical shell scripts by Strange"
echo "Recommend packages to put here on the socials listed on my README!"
