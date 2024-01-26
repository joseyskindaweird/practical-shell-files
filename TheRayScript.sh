#!/bin/bash

# Check for sudo privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run the script with sudo or as root."
  exit 1
fi

# Grabs zenity
sudo pacman -S zenity --noconfirm

# Update system
sudo pacman -Syu  --noconfirm

# Install basic tools
sudo pacman -S nano git vim neofetch --noconfirm

# Install Bluetooth tools
sudo pacman -S bluez blueman bluez-utils --noconfirm
sudo systemctl enable bluetooth && sudo systemctl start bluetooth
echo "Bluetooth service started!"
zenity --info --text="Bluetooth should work after this :p"


# Install additional utilities
sudo pacman -S p7zip unrar tar rsync git neofetch htop exfat-utils fuse-exfat ntfs-3g flac jasper aria2 --noconfirm

# Install Intel microcode
sudo pacman -S intel-ucode --noconfirm

# Update GRUB
sudo grub-mkconfig -o /boot/grub/grub.cfg
echo "GRUB Updated!"

# Grab the script to run the AppImage
wget -O RustDesk.sh https://raw.githubusercontent.com/strangetheproot/practical-shell-files/main/RustDesk.sh

# Make it executable
chmod +x RustDesk.sh

# Says something to you
zenity --info --text="Hellooooo!!! If you wanna learn more about this popup, text meeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee! (this better work)"
read -p "Wanna launch it? Press Y for yes, press N to continue. (Do N if you already ran it)" choice

# Gib choice
if [ "$choice" == "y" ]; then
  echo "Launching the script"
  ./RustDesk.sh
else
  echo "Okay! Continuing...."
fi



# Download an example .sh file
wget -O Updater.sh https://raw.githubusercontent.com/strangetheproot/practical-shell-files/main/Updater.sh

# Make the downloaded file executable
chmod +x Updater.sh
read -p "Press Y to update, or N to not if you already did." choice

if [ "$choice" == "y" ]; then
  sudo ./Updater.sh
else
  echo "Okay!"
fi

# Display a Zenity popup
zenity --info --text="Script finished! Run Updater.sh for now!"

# Moves a file, only here if I gave you the script. You know who you are :3
destination_directory="$HOME/oldscript/"
source_file="RustDesk.sh"


# Check if the source file exists
if [ -e "$source_file" ]; then
    # Move the file to the destination directory
    mv "$source_file" "$destination_directory"
    echo "File '$source_file' has been moved to '$destination_directory'."
else
    echo "File has already been moved, continuing.."
fi

# Goodbye!
echo "With the help of my brain, my first shell script has been finished."
echo "Made by Strange."
cd /home/Desktop/
read -p "Would you like to reboot? Y for yes, N for no." choice


if [ "$choice" == "y" ]; then
  sudo reboot
else
  exit 1
fi