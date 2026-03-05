# Docker Installer for Debian-Based Systems

Simple and automated installer for **Docker Engine** and **Docker Compose** on Debian-based Linux distributions.

This repository provides easy-to-use scripts to install, verify, and remove Docker from systems such as **Debian, Ubuntu, Linux Mint, and Kali Linux**.

---

# Features

✔ Install latest Docker Engine
✔ Install Docker Compose Plugin
✔ Automatically configure Docker repository
✔ Enable and start Docker service
✔ Add current user to `docker` group
✔ Provide verification script
✔ Provide clean uninstall script

---

# Supported Operating Systems

This installer supports most **Debian-based distributions**, including:

* Debian 10 / 11 / 12
* Ubuntu 20.04 / 22.04 / 24.04
* Linux Mint
* Kali Linux
* Pop!_OS
* Other Debian derivatives

---

# Project Structure

```
docker-installer-debian/
│
├── install-docker.sh
├── check-docker.sh
├── uninstall-docker.sh
│
├── README.md
├── LICENSE
└── .gitignore
```

---

# Quick Installation (One Line)

You can install Docker instantly using the following command:

```bash
curl -fsSL https://raw.githubusercontent.com/asadtahta95/docker-installer-debian/main/install-docker.sh | bash
```

---

# Manual Installation

Clone this repository:

```bash
git clone https://github.com/asadtahta95/docker-installer-debian.git
cd docker-installer-debian
```

Make the script executable:

```bash
chmod +x install-docker.sh
```

Run the installer:

```bash
./install-docker.sh
```

---

# Verify Installation

Check if Docker and Docker Compose are installed correctly:

```bash
docker --version
docker compose version
```

Example output:

```
Docker version 27.x.x
Docker Compose version v2.x.x
```

You can also use the provided script:

```bash
./check-docker.sh
```

---

# Test Docker Installation

Run the Docker test container:

```bash
docker run hello-world
```

If Docker is installed correctly, you should see:

```
Hello from Docker!
This message shows that your installation appears to be working correctly.
```

---

# Docker Service Management

Check Docker service status:

```bash
systemctl status docker
```

Start Docker service:

```bash
sudo systemctl start docker
```

Stop Docker service:

```bash
sudo systemctl stop docker
```

Enable Docker to start on boot:

```bash
sudo systemctl enable docker
```

---

# Run Docker Without sudo

After installation, the current user is added to the `docker` group.

To activate this permission:

```
Logout and login again
```

Or run:

```bash
newgrp docker
```

Then test:

```bash
docker ps
```

---

# Check Docker Status Script

Run:

```bash
./check-docker.sh
```

This script will display:

* Docker version
* Docker Compose version
* Docker service status

---

# Uninstall Docker

To completely remove Docker from your system:

```bash
chmod +x uninstall-docker.sh
./uninstall-docker.sh
```

This will remove:

* Docker Engine
* Docker CLI
* Containerd
* Docker Compose Plugin
* Docker data directory

---

# Troubleshooting

## Permission Denied When Running Docker

If you see:

```
permission denied while trying to connect to the Docker daemon socket
```

Run:

```bash
sudo usermod -aG docker $USER
newgrp docker
```

---

## Docker Service Not Running

Check Docker service:

```bash
sudo systemctl status docker
```

Restart Docker:

```bash
sudo systemctl restart docker
```

---

# Security Notes

Running Docker without `sudo` gives users elevated privileges because the Docker daemon runs as root.

Only add trusted users to the `docker` group.

---

# Contributing

Contributions are welcome!

If you want to improve this project:

1. Fork the repository
2. Create a new branch
3. Commit your changes
4. Submit a Pull Request

---

# License

This project is licensed under the **MIT License**.

See the `LICENSE` file for details.

---

# Author

**As'ad Tahta Alfina**

System Administrator / DevOps Engineer

---

# Support

If you find this project helpful:

⭐ Star this repository
🐛 Report issues
🔧 Submit improvements

---

# Related Projects

Useful DevOps tools:

* Docker
* Kubernetes
* Ansible
* Terraform
* Prometheus
* Grafana

---

# Disclaimer

This script is provided **as-is** without warranty.
Use it at your own risk in production environments.
