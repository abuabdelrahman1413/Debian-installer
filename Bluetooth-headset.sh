#!/bin/bash

# Update the package list
echo "Updating package list..."
sudo apt update -y

# Install required packages
echo "Installing required packages..."
sudo apt install -y bluetooth bluez bluez-tools blueman pipewire pipewire-audio wireplumber

# Enable and start the Bluetooth service
echo "Enabling and starting Bluetooth service..."
sudo systemctl enable bluetooth
sudo systemctl start bluetooth

# Enable and start PipeWire services
echo "Enabling and starting PipeWire services..."
systemctl --user enable pipewire pipewire-pulse wireplumber
systemctl --user start pipewire pipewire-pulse wireplumber

# Verify service status
echo "Checking service statuses..."
sudo systemctl status bluetooth | grep "Active:"
systemctl --user status pipewire | grep "Active:"
systemctl --user status wireplumber | grep "Active:"

echo "Installation and setup completed successfully!"
