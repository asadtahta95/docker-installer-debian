#!/bin/bash

set -e

echo "====================================="
echo " Docker & Docker Compose Installer"
echo " Debian / Ubuntu Based Systems"
echo "====================================="

# Update package
echo "[INFO] Updating system packages..."
sudo apt update -y

# Install dependencies
echo "[INFO] Installing required packages..."
sudo apt install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Add Docker GPG Key
echo "[INFO] Adding Docker GPG key..."
sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg \
| sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add Docker repository
echo "[INFO] Adding Docker repository..."

echo \
"deb [arch=$(dpkg --print-architecture) \
signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
$(lsb_release -cs) stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update repo
echo "[INFO] Updating repository..."
sudo apt update -y

# Install Docker
echo "[INFO] Installing Docker Engine..."

sudo apt install -y \
docker-ce \
docker-ce-cli \
containerd.io \
docker-buildx-plugin \
docker-compose-plugin

# Enable docker
echo "[INFO] Enabling Docker service..."
sudo systemctl enable docker
sudo systemctl start docker

# Add user to docker group
echo "[INFO] Adding current user to docker group..."
sudo usermod -aG docker $USER

echo ""
echo "====================================="
echo " Docker installation completed!"
echo "====================================="
echo ""
echo "Run this command to verify:"
echo "docker --version"
echo "docker compose version"
echo ""
echo "IMPORTANT:"
echo "Logout and login again to use docker without sudo."
