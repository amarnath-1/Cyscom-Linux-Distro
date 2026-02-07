# 🔵 Cyscom Security OS

A custom Debian-based Linux distribution designed for cybersecurity training, penetration testing, and security research.

![Version](https://img.shields.io/badge/Version-1.0%20Nebula-blue)
![Based on Debian](https://img.shields.io/badge/Debian-12%20Bookworm-red)
![Architecture](https://img.shields.io/badge/Arch-amd64-green)

## 📋 Overview

Cyscom Security OS is a live bootable Linux distribution built on Debian 12 (Bookworm) with XFCE desktop environment. It comes pre-configured with cybersecurity tools and a custom dark blue/black theme.

## ✨ Features

### 🎨 Visual Design
- **Custom Dark Theme** - Arc-Dark with blue/black color scheme
- **Modern Icons** - Papirus-Dark icon set
- **Custom Branding** - Cyscom logo, wallpaper, and boot screens
- **Themed Terminal** - Dark blue background with cyan text
- **Custom ASCII Banner** - Displays on terminal startup

### 🛠️ Pre-installed Security Tools (25+)

#### 📡 Network Scanning & Reconnaissance
- `nmap` - Network scanner and security auditing tool
- `netcat-traditional` - TCP/IP swiss army knife
- `dnsutils` - DNS lookup utilities
- `whois` - Domain information lookup
- `traceroute` - Network route tracing

#### 🔐 Password Cracking & Authentication
- `hydra` - Network login cracker
- `john` - John the Ripper password cracker
- `medusa` - Parallel network login bracker

#### 📶 Wireless Security
- `aircrack-ng` - WiFi security auditing suite

#### 🌐 Web Application Security
- `sqlmap` - SQL injection tool
- `dirb` - Web content scanner

#### 🔍 Forensics & Data Recovery
- `binwalk` - Firmware analysis tool
- `foremost` - File carving utility
- `exiftool` - Metadata reader/writer
- `steghide` - Steganography tool

#### 🕵️ Network Analysis & Sniffing
- `wireshark` - Network protocol analyzer (GUI)
- `tshark` - Network protocol analyzer (CLI)
- `tcpdump` - Packet analyzer
- `ettercap-text-only` - Man-in-the-middle attack tool
- `dsniff` - Network auditing toolkit

#### 🐍 Development & Scripting
- `python3` - Python programming language
- `python3-pip` - Python package manager
- `python3-requests` - HTTP library for Python
- `python3-scapy` - Packet manipulation library
- `git` - Version control system
- `curl` - Data transfer tool
- `wget` - File downloader
- `vim` / `nano` - Text editors

#### 📊 System Utilities
- `htop` - Interactive process viewer
- `neofetch` - System information tool
- `tree` - Directory tree viewer

## 💿 System Requirements

### Minimum Requirements
- **Processor:** 64-bit (x86_64/amd64)
- **RAM:** 2 GB
- **Storage:** 2 GB (for ISO), runs in live mode (no installation needed)
- **Boot:** UEFI support recommended

### Recommended Requirements
- **Processor:** Dual-core 2GHz+
- **RAM:** 4 GB
- **Storage:** 8 GB+ for persistent storage (optional)

## 🚀 Usage

### Running in VirtualBox

1. **Create New VM:**
   - Name: Cyscom-Security-OS
   - Type: Linux
   - Version: Debian (64-bit)
   - RAM: 2048 MB (or more)

2. **IMPORTANT - Enable EFI:**
   - Settings → System → Motherboard
   - Check: "Enable EFI (special OSes only)"

3. **Mount ISO:**
   - Settings → Storage
   - Add optical drive → Select ISO file

4. **Boot and Use:**
   - Start VM
   - Select "Cyscom Security OS - Live Mode"
   - No installation required!

### Creating Bootable USB
```bash
# On Linux
sudo dd if=cyscom-security-os.iso of=/dev/sdX bs=4M status=progress
sync

# On Windows
# Use Rufus or BalenaEtcher
```

### Default Credentials
- **Username:** `user`
- **Password:** `live`

### Quick Start Commands
```bash
# View all available tools
cyshelp

# System information
neofetch

# Network scanning
nmap -sV target.com

# Password attack
hydra -l admin -P wordlist.txt target.com ssh

# WiFi auditing
aircrack-ng capture.cap

# Web vulnerability scanning
sqlmap -u "http://target.com/page?id=1"

# Packet capture
tcpdump -i eth0 -w capture.pcap
```

## 🛠️ Building from Source

### Prerequisites

**Operating System:**
- Debian 11+ or Ubuntu 20.04+
- WSL2 with Debian recommended for Windows users

**Required Packages:**
```bash
sudo apt update
sudo apt install -y live-build git
```

**System Requirements for Building:**
- 20+ GB free disk space
- Stable internet connection (downloads ~1-2 GB)
- Build time: 40-60 minutes

### Build Steps
```bash
# 1. Clone the repository
git clone https://github.com/amarnath-1/cyscom-security-os.git
cd cyscom-security-os

# 2. Clean any previous builds (optional)
sudo lb clean --purge

# 3. Configure the build
sudo lb config

# 4. Build the ISO (this takes 40-60 minutes)
sudo lb build 2>&1 | tee build.log

# 5. ISO will be created as:
# live-image-amd64.hybrid.iso (approximately 1.5-2 GB)
```

### Build Output Location
- **ISO File:** `live-image-amd64.hybrid.iso`
- **Build Log:** `build.log`

### Troubleshooting Build Issues

**Problem: Package not found**
```bash
# Edit package lists and remove problematic packages
nano config/package-lists/security-tools.list.chroot

# Rebuild
sudo lb clean --purge
sudo lb config
sudo lb build
```

**Problem: Build fails midway**
```bash
# Check the log for errors
grep "E:" build.log

# Clean and retry
sudo lb clean --purge
sudo lb build
```

**Problem: Out of disk space**
```bash
# Check available space
df -h

# Clean build artifacts
sudo lb clean --purge
```

## 📁 Project Structure
```
cyscom-security-os/
├── auto/
│   └── config                          # Build configuration script
├── config/
│   ├── package-lists/
│   │   ├── desktop.list.chroot        # Desktop environment packages
│   │   └── security-tools.list.chroot # Security tools packages
│   ├── includes.chroot/               # Files to include in the ISO
│   │   ├── etc/
│   │   │   ├── os-release            # OS identification
│   │   │   ├── issue                 # Login banner
│   │   │   ├── motd                  # Welcome message
│   │   │   ├── lightdm/              # Login screen config
│   │   │   └── skel/                 # Default user files
│   │   │       ├── .bashrc           # Bash configuration
│   │   │       ├── .config/          # User configs
│   │   │       └── Desktop/          # Desktop shortcuts
│   │   └── usr/
│   │       ├── share/
│   │       │   ├── backgrounds/      # Wallpapers
│   │       │   ├── pixmaps/          # Logos and icons
│   │       │   ├── themes/           # UI themes (Arc-Dark)
│   │       │   └── icons/            # Icon sets (Papirus-Dark)
│   │       └── local/
│   │           └── bin/
│   │               └── cyshelp       # Custom tool list command
│   ├── hooks/
│   │   └── live/
│   │       └── 0100-set-defaults.hook.chroot  # Theme/config script
│   └── includes.binary/
│       └── boot/
│           └── grub/
│               └── grub.cfg          # Boot menu configuration
├── .gitignore                         # Git ignore rules
└── README.md                          # This file
```

## 🤝 Contributing

We welcome contributions from the community!

### How to Contribute

1. **Fork the repository**
2. **Create a feature branch:**
```bash
   git checkout -b feature/your-feature-name
```
3. **Make your changes:**
   - Add new tools to `config/package-lists/`
   - Add custom configurations to `config/includes.chroot/`
   - Update documentation in `README.md`

4. **Test your changes:**
```bash
   sudo lb clean --purge
   sudo lb config
   sudo lb build
   # Test the ISO in VirtualBox
```

5. **Commit your changes:**
```bash
   git add .
   git commit -m "Add: Description of your changes"
```

6. **Push to your fork:**
```bash
   git push origin feature/your-feature-name
```

7. **Create a Pull Request** on GitHub

### Contribution Guidelines

- **Adding Security Tools:** Ensure packages exist in Debian Bookworm repositories
- **Theme Changes:** Test in live environment before committing
- **Documentation:** Update README.md with any new features
- **Code Style:** Keep scripts clean and well-commented

### Areas for Contribution

- 🔧 Additional security tools
- 🎨 UI/UX improvements
- 📝 Documentation and tutorials
- 🐛 Bug fixes and optimizations
- 🌍 Translations and localization
- 🔍 Security hardening

## 🎓 Use Cases

- **Cybersecurity Education** - Teaching security concepts and tools
- **Penetration Testing Practice** - Safe environment for learning
- **Security Research** - Testing vulnerabilities and exploits
- **CTF Competitions** - Capture The Flag competitions
- **Network Security Auditing** - Authorized security assessments
- **Digital Forensics Training** - File analysis and recovery

## 📚 Learning Resources

### Recommended Learning Path

1. **Basics:**
   - Linux command line fundamentals
   - Networking basics (TCP/IP, DNS, HTTP)
   - Basic security concepts

2. **Intermediate:**
   - Network scanning with Nmap
   - Password cracking techniques
   - Web application vulnerabilities

3. **Advanced:**
   - Wireless security auditing
   - Forensics and data recovery
   - Custom exploit development

### External Resources

- [Nmap Documentation](https://nmap.org/book/)
- [OWASP Testing Guide](https://owasp.org/www-project-web-security-testing-guide/)
- [Hack The Box](https://www.hackthebox.com/) - Practice labs
- [TryHackMe](https://tryhackme.com/) - Guided learning

## ⚠️ Legal & Ethical Notice

**IMPORTANT:** This operating system is designed for **educational purposes and authorized security testing ONLY**.

### Legal Usage
✅ **Authorized Activities:**
- Educational learning and skill development
- Testing on systems you own
- Authorized penetration testing with written permission
- Security research in controlled environments
- CTF competitions and practice labs

❌ **Unauthorized Activities (ILLEGAL):**
- Accessing systems without explicit permission
- Unauthorized network scanning
- Distributing malware or exploits
- Any form of cyber attack
- Violation of computer crime laws

### User Responsibility

By using Cyscom Security OS, you acknowledge that:
1. You are responsible for your actions
2. Unauthorized access to computer systems is illegal
3. You will only use these tools for legal and ethical purposes
4. You have proper authorization before conducting security tests

**Violation of these terms may result in criminal prosecution under applicable laws including but not limited to:**
- Computer Fraud and Abuse Act (CFAA) - USA
- Computer Misuse Act - UK  
- Similar laws in your jurisdiction

## 📜 License & Credits

### License
This project is open source. Individual tools have their respective licenses.
- **Distribution:** GPL-compatible
- **Included Tools:** Various open source licenses (see individual tool documentation)

### Credits

**Created by:** Cyscom Team  
**Based on:** Debian GNU/Linux 12 (Bookworm)  
**Desktop Environment:** XFCE  
**Theme:** Arc-Dark  
**Icons:** Papirus-Dark  
**Build System:** live-build  

### Acknowledgments

Thanks to:
- Debian project for the solid foundation
- XFCE team for the lightweight desktop
- Security tool developers and maintainers
- Open source community

## 📧 Support & Contact

### Getting Help

- **GitHub Issues:** [Report bugs or request features](https://github.com/amarnath-1/cyscom-security-os/issues)
- **Discussions:** [Q&A and general discussion](https://github.com/amarnath-1/cyscom-security-os/discussions)

### Community

- **Team:** Cyscom Cybersecurity Club
- **Website:** [Your website if any]
- **Discord:** [Your Discord if any]

## 🗺️ Roadmap

### Version 1.0 (Current) ✅
- [x] Core OS with 25+ security tools
- [x] Custom dark theme and branding
- [x] Live bootable environment
- [x] Documentation and build instructions

### Version 1.1 (Planned)
- [ ] Additional 10+ security tools
- [ ] Custom Metasploit integration
- [ ] Persistence mode support
- [ ] Automated updates system
- [ ] Video tutorials

### Version 2.0 (Future)
- [ ] GUI tool launcher dashboard
- [ ] Pre-configured VPN support
- [ ] Docker integration
- [ ] Custom kernel hardening
- [ ] Encrypted storage options

## 📊 Changelog

### v1.0 - Nebula (2026-02-07)
- Initial release
- 25+ security tools pre-installed
- Custom Cyscom branding throughout
- Dark blue/black Arc-Dark theme
- Papirus-Dark icons
- Custom terminal with ASCII banner
- UEFI boot support
- Live environment optimized for security testing

---

**Cyscom Security OS** - Empowering Cybersecurity Education 🔵🔒

*Built with ❤️ by the Cyscom Team*
