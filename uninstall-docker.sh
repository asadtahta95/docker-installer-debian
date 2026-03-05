#!/bin/bash

echo "Removing Docker..."

sudo systemctl stop docker

sudo apt remove -y \
docker-ce \
docker-ce-cli \
containerd.io \
docker-buildx-plugin \
docker-compose-plugin

sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd

echo "Docker removed successfully."
