#!/bin/bash

set -ouex pipefail


dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Config files
curl -s https://raw.githubusercontent.com/Emblem-66/gamerblue/refs/heads/main/ConfigFiles.sh | bash

# COPR repo add
curl -sSL https://raw.githubusercontent.com/emblem-66/gamerblue/refs/heads/main/dnf-repo.list | xargs -r dnf config-manager addrepo

# COPR repo add
curl -sSL https://raw.githubusercontent.com/emblem-66/gamerblue/refs/heads/main/dnf-copr.list | xargs -r dnf copr enable -y

# DNF remove packages
curl -sSL https://raw.githubusercontent.com/emblem-66/gamerblue/refs/heads/main/dnf-remove.list | xargs -r dnf remove -y

# DNF install packages
curl -sSL https://raw.githubusercontent.com/emblem-66/gamerblue/refs/heads/main/dnf-install.list | xargs -r dnf install -y

# DNF install packages
curl -sSL https://raw.githubusercontent.com/emblem-66/gamerblue/refs/heads/main/systemd.list | xargs -r systemctl enable

# COPR repo remove
curl -sSL https://raw.githubusercontent.com/emblem-66/gamerblue/refs/heads/main/dnf-copr.list | xargs -r dnf copr remove -y

# Tailscale repo remove
#rm /etc/yum.repos.d/tailscale.repo

dnf -y install steam
dnf -y install mesa-freeworld

# Check packages
#curl -sSL https://raw.githubusercontent.com/emblem-66/gamerblue/refs/heads/main/.list | xargs -r rpm -qa | sort | grep

rpm -qa | sort | grep kernel
rpm -qa | sort | grep freeworld
rpm -qa | sort | grep mutter
rpm -qa | sort | grep kwin
rpm -qa | sort | grep steam

