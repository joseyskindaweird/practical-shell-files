#!/bin/bash

# Check for sudo privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run the script with sudo or as root."
  exit 1
fi

# Download the .AppImage file
wget -O RustDesk.AppImage https://github.com/rustdesk/rustdesk/releases/latest/download/rustdesk-1.2.3-x86_64.AppImage

# Make the downloaded file executable
chmod +x RustDesk.AppImage

# Runs the thing.
./RustDesk.AppImage

# Permenant Solution
wget -O RunMeForRustDesk.sh https://raw.githubusercontent.com/strangetheproot/practical-shell-files/main/RunMeForRustDesk.sh

# Gibs the choice
read -p "Time to go back! Press y :3" choice

if [ "$choice" == "y" ]; then
  sudo ./TheRayScript.sh
  exit 1
else
  echo "tf you doing? wrong button bro. Either way, ur going back >:3"
    sudo ./TheRayScript.sh
  exit 1
fi
