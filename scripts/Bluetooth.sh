#!/bin/bash

# Function to install bluetooth packages
install_packages() {
    echo "Installing.. be patient.."
    sudo pacman -S bluez blueman bluez-utils --noconfirm
    if [ $? -eq 0 ]; then
        echo "Finished!"
    else
        echo "Installation failed, check the logs for more details."
        exit 1
    fi
}

# Function to probe for the btusb service
probe_service() {
    echo "Probing.."
    sudo modprobe btusb
    if [ $? -eq 0 ]; then
        echo "Probed!"
    else
        echo "Probing failed, check the logs for more details."
        exit 1
    fi
}

# Function to start services
start_service() {
    echo "Starting Bluetooth service.."
    sudo systemctl enable bluetooth && sudo systemctl start bluetooth
    if [ $? -eq 0 ]; then
echo "Service started.."
    else
        echo "Service start failed, check the logs for more details."
        exit 1
    fi
}

# Beginning of the script
clear
echo "Starting.."
install_packages
clear
probe_service
clear
start_service