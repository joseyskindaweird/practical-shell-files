#!/bin/bash

# Check for sudo privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run the script with sudo or as root."
  exit 1
fi

# Makes a folder to store the file in
mkdir -p ~/oldscript
destination_directory="$HOME/oldscript/"

# Moves a file, only here if I gave you the script. You know who you are :3
source_file="TheRayScript.sh"

# Check if the source file exists
if [ -e "$source_file" ]; then
    # Move the file to the destination directory
    mv "$source_file" "$destination_directory"
    echo "File '$source_file' has been moved to '$destination_directory'."
else
    echo "File has already been moved, continuing.."
fi

# Update base system
echo "Updating base system..."
sudo pacman -Syu --noconfirm
if [ $? -ne 0 ]; then
  echo "Error: command failed. Exiting."
  exit 1
fi
echo "Base system is up-to-date."

# Update the AUR
echo "Updating AUR..."
# Assuming yay is installed. If not, install it using your package manager.
yay -Syu --noconfirm
if [ $? -ne 0 ]; then
  echo "Error: command failed. Exiting."
  exit 1
fi
echo "AUR has been updated"

# Display completion message and prompt to exit
echo "You're up to date <3"
read -p "Press 'y' to exit: " choice

if [ "$choice" == "y" ]; then
  exit 1
else
  echo "Erm.... wrong key but we still leaving."
  exit 1
fi
