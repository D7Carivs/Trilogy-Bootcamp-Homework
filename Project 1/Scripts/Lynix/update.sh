#!/bin/bash

# Runs this command to update all installed packages.
apt update -y

# Runs this command to upgrade all installed packages 
apt upgrade -y

# Runs this command to install new packages, and uninstall any old packages that must be 
#removed to install them
apt full-upgrade -y

# Runs this command to remove unused packages and theis associated configuration files
apt autoremove --purge -y

# Runs this command combining all commands 
apt update -y && apt upgrade -y && apt full-upgrade -y && apt-get autoremove --purge -y
