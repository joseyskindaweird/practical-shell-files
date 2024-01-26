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
echo "That popup"

# Download an example .sh file
wget -O Updater.sh https://raw.githubusercontent.com/strangetheproot/practical-shell-files/main/Updater.sh

# Make the downloaded file executable
chmod +x Updater.sh

# Display a Zenity popup
zenity --info --text="Script finished! Grabbing Updater.sh"

# Goodbye!
echo "Run sudo ./Updater.sh"
echo "With the help of my brain, my first shell script has been finished."
echo "Made by Strange"
exit 1
