# Chaotic-AUR Installer

This script installs the [Chaotic-AUR](https://chaotic.cx/) repository on Arch Linux.

## Installation

To install, run the following command in your terminal:

```bash
curl -fsSL naturl.link/chaotic-aur | sh
```

The script will ask for your `sudo` password to complete the installation.

## What it does

The script will:
1.  Install the `chaotic-keyring` and `chaotic-mirrorlist` packages.
2.  Add the Chaotic-AUR repository to your `/etc/pacman.conf`.
