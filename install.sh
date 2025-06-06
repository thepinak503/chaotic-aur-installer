#!/bin/bash
set -e
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U --noconfirm \
  'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' \
  'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
if ! grep -q '\[chaotic-aur\]' /etc/pacman.conf; then
  echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf
  echo "Chaotic-AUR repository added to /etc/pacman.conf"
else
  echo "Chaotic-AUR repository already present in /etc/pacman.conf"
fi
echo "Operation completed Successfully!"
exit
