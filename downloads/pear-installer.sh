#!/bin/bash

# ----------------------------------------
# Shell Script to Install PearLang on Windows
# ----------------------------------------

# Exit immediately if a command exits with a non-zero status
set -e

# Define Variables
REPO_URL="https://github.com/Pear-Lang/PearLang/archive/refs/heads/main.zip"
PEAR_DIR="/c/Pear/extractedfiles"         # C:\Pear\extractedfiles
ZIP_FILE="/c/Pear/PearLang.zip"           # C:\Pear\PearLang.zip
EXTRACT_DIR="/c/Pear/extractedfiles"      # C:\Pear\extractedfiles
INSTALL_SCRIPT="$EXTRACT_DIR/PearLang-main/install.bat"

# Function to display messages
function echo_info() {
    echo -e "\e[32m[INFO]\e[0m $1"
}

function echo_error() {
    echo -e "\e[31m[ERROR]\e[0m $1" >&2
}

# Step 1: Create C:\Pear\extractedfiles directory
echo_info "Creating directory C:\\Pear\\extractedfiles if it doesn't exist..."
mkdir -p "$PEAR_DIR"
echo_info "Directory created or already exists."

# Step 2: Download the PearLang repository as a ZIP file
echo_info "Downloading PearLang repository from GitHub..."
curl -L "$REPO_URL" -o "$ZIP_FILE"
echo_info "Download completed: $ZIP_FILE"

# Step 3: Extract the ZIP file to C:\Pear\extractedfiles
echo_info "Extracting ZIP file to C:\\Pear\\extractedfiles..."
unzip -o "$ZIP_FILE" -d "$EXTRACT_DIR"
echo_info "Extraction completed."

# Optional Step: Delete the downloaded ZIP file to save space
echo_info "Deleting the downloaded ZIP file..."
rm -f "$ZIP_FILE"
echo_info "ZIP file deleted."

# Step 4: Run install.bat from the extracted folder
if [ -f "$INSTALL_SCRIPT" ]; then
    echo_info "Running install.bat..."
    cmd.exe /c "$INSTALL_SCRIPT"
    echo_info "install.bat executed successfully."
else
    echo_error "install.bat not found at $INSTALL_SCRIPT"
    exit 1
fi

# Step 5: Close the current terminal window
# Note: Closing the terminal programmatically can be disruptive. Proceed with caution.
# Uncomment the following line to enable automatic closure.
# exit

# Step 6: Open a new Command Prompt window and execute 'pear --v'
echo_info "Launching a new Command Prompt window to display PearLang version..."
cmd.exe /c "start cmd.exe /k pear --v"

echo_info "Installation script completed successfully."

# ----------------------------------------
# End of Script
# ----------------------------------------
