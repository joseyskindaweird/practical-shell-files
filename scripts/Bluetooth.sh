#!/bin/bash

# Beginning of the script
clear
echo "Starting.."
echo "Installing.. be patient.."
sudo pacman -S bluez blueman bluez-utils --noconfirm
echo "Finished!"

# Probing for the btusb service
clear
echo "Probing.."
sudo modprobe btusb
echo "Probed!"

# Starting services
clear
echo "Starting Bluetooth service.."
sudo systemctl enable bluetooth && sudo systemctl start bluetooth
echo "Service started.."