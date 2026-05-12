# 🔵 Cyscom Security OS

A custom Debian-based Linux distribution for cybersecurity training and CTF competitions.

![Version](https://img.shields.io/badge/Version-1.1-blue) ![Debian](https://img.shields.io/badge/Debian-12%20Bookworm-red) ![Arch](https://img.shields.io/badge/Arch-amd64-green)

---

## 📋 Overview

Cyscom Security OS is a live-bootable Linux distribution built on Debian 12 (Bookworm) with XFCE desktop. It includes 25+ pre-installed security tools, custom dark blue/black branding, and specialized CTF utilities.

**Key Features:**
- 🎨 Custom dark theme with Cyscom branding
- 🛠️ 25+ security tools pre-configured
- 🎯 Custom multi-command CTF tools
- 💿 Live bootable (no installation needed)
- 📦 Built with Debian live-build

---

## 💿 Quick Start

### Download
- **ISO File:** [Download from Releases](https://github.com/amarnath-1/Cyscom-Linux-Distro/releases)
- **Size:** ~1.5 GB
- **Architecture:** 64-bit (amd64)

### Boot in VirtualBox
1. Create VM: Debian 64-bit, 2GB RAM
2. **Enable EFI:** Settings → System → Motherboard → ✅ Enable EFI
3. Mount ISO and boot
4. Login: `user` / `live`

### Create Bootable USB
```bash
# Linux
sudo dd if=cyscom-security-os.iso of=/dev/sdX bs=4M status=progress

# Windows: Use Rufus or BalenaEtcher
```

---

## 🎯 Custom CTF Tools

Cyscom OS includes 6 custom multi-command tools designed for CTF competitions:

### Network & Web Analysis

#### `cysnetscan <target>`
Complete network reconnaissance in one command.
- Ping test (host availability)
- Fast port scan (open ports)
- Service detection (versions)
- OS fingerprinting
- DNS lookup

**Example:**
```bash
cysnetscan scanme.nmap.org
```

#### `cyswebscan <url>`
Web application security scanner.
- HTTP header analysis
- SSL/TLS configuration check
- DNS records lookup
- Common directory discovery
- Technology detection

**Example:**
```bash
cyswebscan example.com
```

#### `cyssyscheck`
System health diagnostics.
- CPU usage and info
- Memory status
- Disk space check
- Network connectivity test
- Battery status

**Example:**
```bash
cyssyscheck
```

### CTF-Focused Tools

#### `cysforensics <file>`
File analysis and forensics tool.
- Metadata extraction (EXIF data)
- Embedded file detection (binwalk)
- String extraction
- Hex dump analysis
- File type identification

**Example:**
```bash
cysforensics suspicious.jpg
```

#### `cysstego <image>`
Steganography detection and extraction.
- Image metadata analysis
- Embedded file search (binwalk)
- Password-based extraction (steghide)
- LSB analysis
- Hidden text/flag detection

**Example:**
```bash
cysstego hidden.png
```

#### `cyscrypto <text>`
Multi-format decoding tool.
- Base64 decode
- Base32 decode
- Hexadecimal decode
- ROT13 cipher
- URL decode

**Example:**
```bash
cyscrypto "SGVsbG8gV29ybGQ="
```

---

## 🛠️ Pre-installed Security Tools

### Network Scanning
`nmap` `netcat` `dnsutils` `whois` `traceroute`

### Password Cracking
`hydra` `john` `medusa`

### Wireless Security
`aircrack-ng`

### Web Testing
`sqlmap` `dirb`

### Forensics & Analysis
`binwalk` `foremost` `exiftool` `steghide`

### Network Sniffing
`wireshark` `tshark` `tcpdump` `ettercap` `dsniff`

### Development
`python3` `pip` `git` `vim` `nano` `curl` `wget`

### System Utilities
`htop` `neofetch` `tree`

**View all tools:** Run `cyshelp` in terminal

---

## 🎨 Customization

### Visual Theme
- **Desktop:** XFCE with Arc-Dark theme
- **Icons:** Papirus-Dark
- **Colors:** Dark blue (#0a1628) and black
- **Terminal:** Custom cyan text on dark background
- **Wallpaper:** Custom Cyscom security-themed background

### Branding
- Custom boot screen
- Cyscom logo on login
- Custom ASCII banner in terminal
- System identification as "Cyscom Security OS"

---

## 🔨 Building from Source

### Prerequisites
- Debian 11+ or Ubuntu 20.04+ (WSL2 recommended for Windows)
- 20GB free disk space
- Stable internet connection

### Installation
```bash
# Install build tools
sudo apt update
sudo apt install -y live-build git

# Clone repository
git clone https://github.com/amarnath-1/Cyscom-Linux-Distro.git
cd Cyscom-Linux-Distro

# Build ISO (takes 45-60 minutes)
sudo lb clean --purge
sudo lb config
sudo lb build

# Output: security-distro-amd64.hybrid.iso (~1.5 GB)
```

### Project Structure
Cyscom-Linux-Distro/
├── auto/
│   └── config                  # Build configuration
├── config/
│   ├── package-lists/          # Software packages
│   │   ├── desktop.list.chroot
│   │   └── security-tools.list.chroot
│   ├── includes.chroot/        # Custom files
│   │   ├── usr/local/bin/      # Custom commands
│   │   │   ├── cysforensics
│   │   │   ├── cysstego
│   │   │   ├── cyscrypto
│   │   │   ├── cysnetscan
│   │   │   ├── cyswebscan
│   │   │   └── cyssyscheck
│   │   ├── usr/share/          # Themes, wallpapers, icons
│   │   └── etc/                # System configs
│   └── hooks/                  # Build-time scripts
│       └── live/
│           └── 0100-set-defaults.hook.chroot
├── .gitignore
└── README.md

---

## 💻 System Requirements

**Minimum:**
- CPU: 64-bit processor
- RAM: 2 GB
- Storage: 2 GB (for ISO)

**Recommended:**
- CPU: Dual-core 2GHz+
- RAM: 4 GB
- UEFI boot support

---

## 🤝 Contributing

Contributions welcome! To contribute:

1. Fork the repository
2. Create feature branch: `git checkout -b feature-name`
3. Make changes and test
4. Commit: `git commit -m "Description"`
5. Push: `git push origin feature-name`
6. Create Pull Request

---

## ⚠️ Legal Notice

**For educational and authorized security testing only.**

This OS is designed for:
- ✅ Educational learning
- ✅ Authorized penetration testing
- ✅ CTF competitions
- ✅ Security research in controlled environments

Unauthorized access to computer systems is illegal. Users are responsible for ensuring proper authorization before conducting any security testing.

---

## 📜 License

Open source project. Individual tools have their respective licenses.

**Credits:**
- **Created by:** Cyscom Team
- **Based on:** Debian 12 (Bookworm)
- **Desktop:** XFCE
- **Theme:** Arc-Dark
- **Icons:** Papirus-Dark

---

## 📧 Support

- **Issues:** [GitHub Issues](https://github.com/amarnath-1/Cyscom-Linux-Distro/issues)
- **Discussions:** [GitHub Discussions](https://github.com/amarnath-1/Cyscom-Linux-Distro/discussions)

---

**Cyscom Security OS** - Cybersecurity Training Platform 🔵🔒

*Built with ❤️ by the Cyscom Team*
