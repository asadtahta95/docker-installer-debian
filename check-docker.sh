#!/bin/bash

echo "Checking Docker installation..."
echo "--------------------------------"

if command -v docker &> /dev/null
then
    echo "Docker installed:"
    docker --version
else
    echo "Docker is NOT installed"
fi

echo ""

if docker compose version &> /dev/null
then
    echo "Docker Compose installed:"
    docker compose version
else
    echo "Docker Compose NOT installed"
fi

echo ""

echo "Docker service status:"
systemctl is-active docker
