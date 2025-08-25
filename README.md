# Chaotic AUR Installer

**Automated AUR Package Repository for Arch Linux**

A streamlined installer script for Chaotic-AUR, providing pre-compiled AUR packages for Arch Linux systems without the need to build from source.

## 📋 Table of Contents

- [What is Chaotic-AUR?](#what-is-chaotic-aur)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Manual Installation](#manual-installation)
- [Usage](#usage)
- [Troubleshooting](#troubleshooting)
- [Benefits](#benefits)
- [Support](#support)

## 🤔 What is Chaotic-AUR?

**Chaotic-AUR** is an automated building repository for AUR packages that provides pre-compiled binaries instead of requiring users to build packages from source. This eliminates the time-consuming compilation process and reduces system resource usage during package installation.

### Key Differences from Traditional AUR:
- **No compilation required** - Pre-built binaries ready for installation
- **Faster installation** - Skip the build process entirely
- **Lower resource usage** - No need for build dependencies or high CPU usage
- **Reduced failure risk** - Eliminates compilation errors and build failures

## ✨ Features

- 🚀 **One-line installation** - Simple curl command setup
- 📦 **4000+ packages** - Extensive collection of pre-compiled AUR packages
- ⚡ **Fast installation** - No build time required
- 🔒 **Secure** - Properly signed packages with keyring verification
- 🔄 **Automatic updates** - Packages update through pacman like official repos
- 🎯 **Compatibility** - Works with Arch Linux, EndeavourOS, Manjaro, and other Arch-based distros

## 📋 Prerequisites

- **Operating System**: Arch Linux or Arch-based distribution
- **Package Manager**: pacman
- **Internet Connection**: Required for downloading packages
- **Permissions**: sudo access for system modifications

## 🚀 Installation

### Quick Install (Recommended)

Open your terminal and run this **single command**:

```
curl -fsSL naturl.link/chaotic-aur | sh
```

Enter your password when prompted by sudo, and you're done!

### What the Script Does:

1. **Installs GPG keys** - Adds Chaotic-AUR signing keys
2. **Downloads keyring** - Installs chaotic-keyring and chaotic-mirrorlist packages  
3. **Configures pacman** - Adds repository to `/etc/pacman.conf`
4. **Updates system** - Refreshes package databases

## 🔧 Manual Installation

If you prefer to install manually or want to understand the process:

### Step 1: Install Primary Key and Keyring

```
# Add the primary GPG key
sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com

# Sign the key locally
sudo pacman-key --lsign-key FBA220DFC880C036

# Install keyring and mirrorlist packages
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
```

### Step 2: Configure Pacman

Add the repository to your pacman configuration:

```
# Open pacman configuration file
sudo nano /etc/pacman.conf

# Add these lines at the end of the file:
[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist
```

### Step 3: Update System

```
# Refresh package databases
sudo pacman -Syu
```

## 📦 Usage

### Installing Packages

Once installed, use Chaotic-AUR packages just like official repository packages:

```
# Install any AUR package (example: Spotify)
sudo pacman -S spotify

# Install development tools
sudo pacman -S visual-studio-code-bin

# Install gaming software
sudo pacman -S discord
```

### Using with GUI Package Managers

Install **Pamac** for graphical package management:

```
# Install Pamac (supports Chaotic-AUR, AUR, and Flatpak)
sudo pacman -S pamac-nosnap
```

Pamac will show packages from:
- **Official repositories**
- **Chaotic-AUR** (pre-compiled)
- **Traditional AUR** (build from source)
- **Flatpak** (if enabled)

### Package Priority

Chaotic-AUR packages take **priority** over traditional AUR packages. If you have AUR packages installed, they will be replaced by Chaotic-AUR versions during updates.

## 🛠️ Troubleshooting

### Common Issues

#### Invalid or Corrupted Package (Key Signature Error)

```
# Update the keyring if you encounter signature errors
sudo pacman -Sy chaotic-keyring
```

#### Repository Not Found

```
# Verify the repository is properly added to pacman.conf
grep -A1 "$$chaotic-aur$$" /etc/pacman.conf

# Should output:
# [chaotic-aur]
# Include = /etc/pacman.d/chaotic-mirrorlist
```

#### Network Connection Issues

- Ensure stable internet connection
- Try using a different mirror if downloads fail
- Check firewall settings

#### Package Conflicts

```
# Remove conflicting AUR packages before installing Chaotic-AUR versions
sudo pacman -R package-name
sudo pacman -S package-name
```

## 🎯 Benefits

### Time Savings
- **No compilation time** - Install large packages in seconds instead of hours
- **No build dependencies** - Skip installing compilers and development tools
- **Instant updates** - Update through pacman without rebuilding

### System Resources
- **Lower CPU usage** - No intensive compilation processes
- **Reduced disk space** - No need to store source code and build files
- **Better stability** - Eliminates build-related system freezes

### Convenience
- **Simple maintenance** - Updates handled by pacman
- **Consistent experience** - Same commands as official packages
- **Reliable builds** - Professional build infrastructure

## 📞 Support

### Official Resources
- **Website**: [aur.chaotic.cx](https://aur.chaotic.cx)
- **Documentation**: [aur.chaotic.cx/docs](https://aur.chaotic.cx/docs)
- **GitHub**: [github.com/chaotic-aur](https://github.com/chaotic-aur)

### Community Support
- **Arch Linux Forums**: Community discussions and troubleshooting
- **Reddit**: r/archlinux community
- **IRC/Discord**: Real-time community support

### Getting Help
1. **Check documentation** first for common issues
2. **Search existing issues** on GitHub
3. **Provide system information** when reporting problems:
   ```
   # Useful debugging information
   pacman -Q chaotic-keyring
   pacman -Q chaotic-mirrorlist
   cat /etc/pacman.conf | grep -A2 chaotic-aur
   ```

---

**⚠️ Note**: Chaotic-AUR is a third-party repository. While generally safe and well-maintained, always review packages before installation and keep your system backed up.

**🎉 Enjoy hassle-free AUR package installation with Chaotic-AUR!**
