#!/bin/bash

# Display a text-based menu
echo "Select a program:"
echo "1. Cowsay"
echo "2. Fortune"
echo "3. Telnet"
echo "4. 2048"
echo "5. KNetWalk"
echo "6. Tetris-like game"

# Prompt the user for input
read -p "Enter the number of the program you want to run (1-6): " choice

# Validate the user input
if ((choice < 1 || choice > 6)); then
    echo "Invalid choice. Please enter a number between 1 and 6."
    exit 1
fi

# Now you can add logic to launch the selected program
case $choice in
    1)
        sudo pacman -S cowsay --noconfirm
        ;;
    2)
        sudo pacman -S fortune-mod --noconfirm
        ;;
    3)
        sudo pacman -S inetutils --noconfirm
        ;;
    4)
        sudo pacman -S gnome-2048 --noconfirm
        ;;
    5)
        sudo pacman -S knetwalk --noconfirm
        ;;
    6)
        sudo pacman -S quadrapassel --noconfirm
        ;;
    *)
        echo "Invalid choice."
        exit 1
        ;;
esac

echo "Practical shell scripts by Strange"
echo "Recommend games to put here on the socials on my README!"
