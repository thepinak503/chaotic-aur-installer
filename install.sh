#!/bin/bash

set -e

# 1. Import and locally sign the Chaotic-AUR key
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB

# 2. Install the keyring and mirrorlist
sudo pacman -U --noconfirm \
  'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' \
  'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

# 3. Add Chaotic-AUR repo to /etc/pacman.conf if not present
if ! grep -q '\[chaotic-aur\]' /etc/pacman.conf; then
  echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf
  echo "Chaotic-AUR repository added to /etc/pacman.conf"
else
  echo "Chaotic-AUR repository already present in /etc/pacman.conf"
fi

echo "Operation completed Successfully!"
exit
