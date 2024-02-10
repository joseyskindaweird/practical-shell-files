#!/bin/bash

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
echo "1. Discord"
echo "2. Spotify"
echo "3. Thorium (SSE3)"
echo "4. Thorium (Standard)"
echo "5. Steam"
echo "6. Retroarch"
echo "7. Bluetooth (see docs)"
echo "8. CPU-X"
echo "9. VSCodium"
echo "10. Chromebook-Linux-Audio (see docs)"
echo "11. Octopi" 
echo "12. Mercury (Standard)"
echo "13. Mercury (SSE3)"
echo "14. Brave"
echo "15. Google Chrome"
echo "16. Chromium"
echo "17. Firefox"
echo "18. KDE Connect"
echo "19. qBitorrent"
echo "20. RustDesk"

# Prompt the user for input
read -p "Enter the number of the program you want to run (1-20): " choice

# Validate the user input
if ((choice < 1 || choice > 20)); then
    echo "Invalid choice. Please enter a number between 1 and 20."
        exit 1
fi

# Now you can add logic to launch the selected program
case $choice in
    1)
        sudo pacman -S discord --noconfirm
        ;;
    2)
        sudo pacman -S spotify-launcher --noconfirm
        ;;
    3)
        # AUR Package is poorly maintained! (thanks a lot). We're doing the manual method cuz of it.
        echo "Installing dependencies.."
        sudo pacman -S alsa-lib at-spi2-core cairo dbus libcups libnotify libxcomposite libxkbcommon libxrandr mesa nspr nss pango --noconfirm
        mkdir thorium-browser-sse3-building
        cd thorium-browser-sse3-building
        wget https://github.com/Alex313031/thorium/releases/download/M120.0.6099.235/thorium-browser_120.0.6099.235_SSE3.deb
        ar x thorium-browser_120.0.6099.235_SSE3.deb
        tar -xvf control.tar.gz
        tar -xvf data.tar.gz
        sudo cp ./etc/* /etc/
        sudo cp ./opt/* /opt/
        sudo cp ./usr/* /usr/
        echo "Finished!"
        cd .. 
        sudo rm -rf thorium-browser-sse3-building
        # When thorium is updated, gotta update this too! hooray..
        ;;
    4)
        # AUR package is errored out, great..
        echo "Installing dependencies"
        sudo pacman -S alsa-lib at-spi2-core cairo dbus libcups libnotify libxcomposite libxkbcommon libxrandr mesa nspr nss pango --noconfirm 
        mkdir thorium-browser-building
        cd thorium-browser-building
        wget https://github.com/Alex313031/thorium/releases/download/M120.0.6099.235/thorium-browser_120.0.6099.235_amd64.deb
        ar x thorium-browser_120.0.6099.235_amd64.deb
        tar -xvf control.tar.gz
        tar -xvf data.tar.gz
        sudo cp ./etc/* /etc/
        sudo cp ./opt/* /opt/
        sudo cp ./usr/* /usr/
        echo "Finished!"
        cd ..
        sudo rm -rf thorium-browser-building
        # Updates, updates.. nyeheheh...
        ;;
    5)
        sudo pacman -S steam --noconfirm
        ;;
    6)
        sudo pacman -S retroarch --noconfirm
        ;;
    7)
        sudo pacman -S bluez blueman bluez-utils --noconfirm
        sudo modprobe btusb
        sudo systemctl enable bluetooth && sudo systemctl start bluetooth
        read -p "Do you want to reboot now to apply changes? (Y/N)? " reboot_choice
        if [[ $reboot_choice == "Y" || $reboot_choice == "y" ]]; then
            sudo reboot
        fi
        ;;
    8)
        yay -S cpu-x --noconfirm
        ;;
    9) 
        yay -S vscodium-bin --noconfirm
        ;;
    10) 
        if ! which git > /dev/null; then
            echo "You don't have git. Installing..."
            sudo pacman -S git --noconfirm
        fi
        if ! which python > /dev/null; then
            sudo pacman -S python --noconfirm
        fi
        git clone https://github.com/WeirdTreeThing/chromebook-linux-audio.git
        cd chromebook-linux-audio
        ./setup-audio
        cd ..
        sudo rm -rf chromebook-linux-audio
        ;;
    11)
        yay -S octopi --noconfirm
        ;;
    12)
       echo "Installing dependencies.."
       sudo pacman -S alsa-lib dbus-glib gtk3 libnotify --noconfirm
       mkdir mercury-building
       cd mercury-building
       wget https://github.com/Alex313031/Mercury/releases/download/v.122.0.2/mercury-browser_122.0.2_AVX2.deb
       ar x mercury-browser_122.0.2_AVX2.deb
       tar -xvf control.tar.gz
       tar -xvf data.tar.gz
       echo "Copying files..."
       sudo cp ./etc/* /etc/
       sudo cp ./opt/* /opt/
       sudo cp ./usr/* /usr/
       echo "Finished!"
       cd ..
       sudo rm -rf mercury-building
       # Have to update this every single time there's a new version of mercury.. may make an AUR package..
       ;;
    13)
       echo "Installing dependencies.."
       sudo pacman -S alsa-lib dbus-glib gtk3 libnotify --noconfirm
       mkdir mercury-sse3-building
       cd mercury-sse3-building
       wget https://github.com/Alex313031/Mercury/releases/download/v.122.0.2/mercury-browser_122.0.2_SSE3.deb
       ar x mercury-browser_122.0.2_SSE3.deb
       tar -xvf control.tar.gz
       tar -xvf data.tar.gz
       echo "Copying files..."
       sudo cp ./etc/* /etc/
       sudo cp ./opt/* /opt/
       sudo cp ./usr/* /usr/
       echo "Finished!"
       cd ..
       sudo rm -rf mercury-sse3-building
       # Updating... updating.. hee..hee..
       ;;
    14)
       yay -S brave --noconfirm
       ;;
    15)
       echo "Get ready for bloat.."
       yay -S google-chrome --noconfirm
       ;;
    16)
       echo "Thorium's better...."
       sudo pacman -S chromium --noconfirm
       ;;
    17)
       echo "Try mercury :3"
       sudo pacman -S firefox --noconfirm
       ;;
    18)
       sudo pacman -S kdeconnect --noconfirm
       ;;
    19)
       sudo pacman -S qbittorrent --noconfirm
       echo "Nice. >:3"
       ;;
    20)
       # Oh boy, gonna have to update this one too.
       echo "Installing dependencies.."
       sudo pacman -S alsa-lib gst-plugin-pipewire gst-plugins-base gst-plugins-base-libs gtk3 hicolor-icon-theme libappindicator-gtk3 libva libvdpau libxcb libxfixes pam pulseaudio xdg-user-dirs xdg-utils xdotool --noconfirm
       mkdir rustdesk-building
       cd rustdesk-building
       wget https://github.com/rustdesk/rustdesk/releases/download/1.2.3/rustdesk-1.2.3-x86_64.deb
       ar x rustdesk-1.2.3-x86_64.deb
       tar -xvf control.tar.gz
       tar -xvf data.tar.gz
       echo "Copying files..."
       sudo cp ./etc/* /etc/
       sudo cp ./opt/* /opt/
       sudo cp ./usr/* /usr/
       echo "Finished!"
       cd ..
       sudo rm -rf rustdesk-building
       ;;
    *)
        echo "Invalid choice."
        exit 1
        ;;
esac
      
echo "Recommend packages to put here on the socials on my README!"
echo "Practical shell scripts by strange."
