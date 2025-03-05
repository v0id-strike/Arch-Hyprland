#!/bin/bash

# SDDM themes #

## WARNING: DO NOT EDIT BEYOND THIS LINE IF YOU DON'T KNOW WHAT YOU ARE DOING! ##

# Determine the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Change the working directory to the parent directory of the script
PARENT_DIR="$SCRIPT_DIR/.."
cd "$PARENT_DIR" || exit 1

source "$(dirname "$(readlink -f "$0")")/Global_functions.sh"

# Set the name of the log file to include the current date and time
LOG="Install-Logs/install-$(date +%d-%H%M%S)_themes.log"


# Check if the directory exists and delete it if present
if [ -d "sddm-astronaut-theme" ]; then
    echo "$NOTE SDDM themes folder exist..deleting..." 2>&1 | tee -a "$LOG"
    rm -rf "sddm-astronaut-theme" 2>&1 | tee -a "$LOG"
fi

echo "$NOTE Cloning ${SKY_BLUE}SDDM themes${RESET} repository..." 2>&1 | tee -a "$LOG"
if git clone --depth 1 https://github.com/v0id-strike/sddm-astronaut-theme.git ; then
    cd sddm-astronaut-theme
    chmod +x setup.sh
    ./setup.sh
    cd ..
else
    echo "$ERROR Download failed for SDDM themes.." 2>&1 | tee -a "$LOG"
fi

printf "\n%.0s" {1..2}
