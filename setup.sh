#!/bin/bash


#
# Ubuntu "Auto" Setup
# Ubuntu 20.04
#


# Purge the default software
sudo apt-get remove --purge libreoffice*
sudo apt-get remove --purge thunderbird* 
sudo apt-get remove --purge rhythmbox* 
sudo apt-get remove --purge aisleriot gnome-mahjongg gnome-mines gnome-sudoku 

sudo apt-get clean
sudo apt-get autoremove

# Install Useful Software
sudo apt install git

# Configure Dash
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode 'FIXED'
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.0
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
gsettings set org.gnome.shell.extensions.desktop-icons show-trash false

# This SHOULD work, however I have issues if Ubuntu setting was already been changed
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true

