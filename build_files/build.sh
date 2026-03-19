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

### Enable system services
systemctl enable podman.socket
