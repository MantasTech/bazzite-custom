#!/bin/bash

set -ouex pipefail

### System-level packages
# CLI tools and dependencies for OpenClaw / dev work
dnf5 install -y \
    tmux \
    htop \
    git \
    curl \
    wget \
    nodejs \
    npm \
    python3 \
    python3-pip \
    neovim \
    unzip \
    fastfetch

### Disable terra-mesa repo to fix bootc-image-builder ISO generation
### (packages are already baked into the image, BIB can't read file:// GPG keys)
if [ -f /etc/yum.repos.d/terra-mesa.repo ]; then
    sed -i 's/enabled=1/enabled=0/' /etc/yum.repos.d/terra-mesa.repo
fi

### Enable system services
systemctl enable podman.socket
