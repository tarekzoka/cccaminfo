#!/bin/sh
## Command=wget ## Command=wget https://raw.githubusercontent.com/tarekzoka/cccaminfo/refs/heads/main/cccaminfo/cccaminfo_py2.sh -O - | /bin/sh
##
PLUGIN_URL="https://github.com/tarekzoka/cccaminfo/raw/refs/heads/main/cccaminfo/cccaminfo_py2.ipk"
PLUGIN_FILE="cccaminfo_py2.ipk"

echo "Installing plugin..."
cd /tmp || exit 1

if command -v curl >/dev/null 2>&1; then
    curl -k -L "$PLUGIN_URL" -o "$PLUGIN_FILE"
elif command -v wget >/dev/null 2>&1; then
    wget "$PLUGIN_URL" -O "$PLUGIN_FILE"
else
    echo "Error: Neither curl nor wget found. Install one of them first."
    exit 1
fi

if [ -f "$PLUGIN_FILE" ]; then
    echo "Installation in progress..."
    opkg install "$PLUGIN_FILE" >/dev/null 2>&1
    rm -f "$PLUGIN_FILE"
    sync
    echo "Installation completed successfully."
else
    echo "Error: Failed to download plugin."
    exit 1
fi

echo ">>> Uploaded by: TAREK_HANFY"
exit 0





