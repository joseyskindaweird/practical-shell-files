#!/bin/bash

# Check for sudo privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run the script with sudo or as root."
  exit 1
fi

# Update base system
echo "Running command 1..."
sudo pacman -Syu --noconfirm
if [ $? -ne 0 ]; then
  echo "Error: Command 1 failed. Exiting."
  exit 1
fi
echo "Command 1 completed successfully."

# Update the AUR
echo "Running command 2..."
yay -Syu --noconfirm
if [ $? -ne 0 ]; then
  echo "Error: Command 2 failed. Exiting."
  exit 1
fi
echo "Command 2 completed successfully."

# Display completion message and prompt to exit
echo "You're up to date <3"
read -p "Press 'y' to exit: " choice

if [ "$choice" == "y" ]; then
  exit 0
else
  echo "Invalid choice. Exiting."
  exit 1
fi