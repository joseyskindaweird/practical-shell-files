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
wget -O RustDesk.sh https://github.com/strangetheproot/practical-shell-files/blob/main/RustDesk.sh

# Make it executable
chmod +x RustDesk.sh

# Says something to you
zenity --info --text="Hellooooo!!! If you wanna learn more about this popup, text meeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee! (this better work)"

# Gibs the choice
read -p "If you wanna run the script as shown above, press y. Otherwise, press N." choice

if [ "$choice" == "y" ]; then
  sudo ./RustDesk.sh
  exit 1
else
  echo "Alright, continuing.."
fi

# Moves the RustDesk.sh file
source_file="RustDesk.sh"
destination_directory="/home/oldscript/"

# Check if the source file exists
if [ -e "$source_file" ]; then
    # Move the file to the destination directory
    mv "$source_file" "$destination_directory"
    echo "File '$source_file' has been moved to '$destination_directory'."
else
    echo "File has already been moved, continuing.."
fi

# Download an example .sh file
wget -O Updater.sh https://github.com/strangetheproot/practical-shell-files/blob/main/Updater.sh

# Make the downloaded file executable
chmod +x Updater.sh

# Display a Zenity popup
zenity --info --text="Script finished! Running Updater.sh"

# Move itself onto the next script.
sudo ./Updater.sh

# Bye!
echo "First shell script. By Strange."
# Gibs the choice
read -p "Reboot? Press Y for yes, N for no." choice

if [ "$choice" == "y" ]; then
  sudo reboot
else
  echo "ByeBye!"
  exit 1
fi
