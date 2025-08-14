#!/bin/bash
set -e

# === CONFIGURATION ===
PROXY_HOST="dark.lan"
PROXY_PORT="3142"
PROXY_URL="http://${PROXY_HOST}:${PROXY_PORT}"

# === Ensure apt is installed ===
if ! command -v apt >/dev/null 2>&1; then
    echo "APT not found, installing..."
    sudo apt-get update
    sudo apt-get install -y apt
fi

# === Backup original sources.list ===
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak

# === Force HTTP repositories ===
sudo sed -i 's|https://|http://|g' /etc/apt/sources.list

# === Configure APT to use proxy ===
echo "Acquire::http::Proxy \"${PROXY_URL}\";" | sudo tee /etc/apt/apt.conf.d/01proxy

# === Clean old cache and update ===
sudo apt-get clean
#sudo apt-get update -o Debug::Acquire::http=true

echo "APT proxy setup complete. All HTTP repos should use ${PROXY_URL}"
