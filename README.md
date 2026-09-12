# 📡 BT SILENT

### Bluetooth Auto Jammer — Professional Menu-Driven Tool

---

## 📋 TABLE OF CONTENTS
- [Introduction](#-introduction)
- [Features](#-features)
- [Version Information](#-version-information)
- [Author & Credits](#-author--credits)
- [System Requirements](#-system-requirements)
- [Installation Guide](#-installation-guide)
- [Quickstart Guide](#-quickstart-guide)
- [Usage Instructions](#-usage-instructions)
- [Menu Options](#-menu-options)
- [Command Reference](#-command-reference)
- [File Structure](#-file-structure)
- [How It Works](#-how-it-works)
- [Safety & Warnings](#-safety--warnings)
- [Legal Disclaimer](#-legal-disclaimer)
- [Troubleshooting](#-troubleshooting)
- [Support & Feedback](#-support--feedback)
- [License Agreement](#-license-agreement)

---

## 📖 INTRODUCTION

**BT SILENT** is a powerful, easy-to-use Bluetooth testing and auditing tool designed specifically for cybersecurity professionals, students, and authorized testers. This tool provides a clean, intuitive menu interface that allows users to scan, detect, and perform authorized testing on nearby Bluetooth devices with just a few keystrokes.

Built with simplicity and efficiency in mind, BT SILENT requires no advanced technical knowledge to operate — simply run the command, select your desired option from the menu, and the tool handles the rest automatically in the background. Whether you are conducting a security audit, testing Bluetooth device resilience, or learning about wireless communication protocols, BT SILENT provides a comprehensive, accessible solution.

---

## ✨ FEATURES

BT SILENT comes packed with a wide range of features designed to make your Bluetooth testing experience as smooth and effective as possible:

| Feature | Description |
|---------|-------------|
| 🎨 **Beautiful ASCII Menu** | Clean, colorful interface with clear options — no confusing commands |
| 🌈 **Rainbow Banner** | Stunning ASCII art header displayed every time you launch the program |
| 🔍 **Automatic Device Scanning** | Continuously scans for nearby Bluetooth devices in the background |
| 📡 **Auto-Attack Mode** | Automatically initiates authorized testing on all detected devices simultaneously |
| 🕐 **Background Operation** | Runs silently and efficiently — you can continue using your terminal while it works |
| 📊 **Real-Time Status Check** | Instantly see how many devices are detected and how many processes are running |
| 🛑 **One-Click Termination** | Stop all operations immediately with a single menu selection |
| 🔐 **Privilege Detection** | Automatically detects if you have root/sudo access and prompts you accordingly |
| 💻 **Cross-Platform Support** | Designed for Kali Linux but works on any Debian-based distribution |
| 📝 **Comprehensive Documentation** | Detailed guide, installation steps, and usage instructions included |
| 🎯 **Zero Configuration** | No complex setup — install, run, and start using immediately |
| 🔄 **Continuous Updates** | Actively maintained with new features and improvements added regularly |

---

## 🔖 VERSION INFORMATION

| Property | Details |
|----------|---------|
| **Program Name** | BT SILENT |
| **Current Version** | 1.0.0 |
| **Release Date** | September 2026 |
| **Development Status** | Active Development |
| **Stability** | Stable Release |
| **Code Language** | Bash Shell Script |
| **Encoding** | UTF-8 |
| **Repository** | github.com/williamkreese21/bt-silent |

---

## 👤 AUTHOR & CREDITS

| Role | Name / Details |
|------|---------------|
| **Original Developer & Maintainer** | williamkreese21 |
| **Repository Owner** | williamkreese21 |
| **License** | MIT License |
| **Contributors** | Open to community contributions |
| **Special Thanks** | Kali Linux Community, Bluetooth Protocol Developers, Open-Source Security Researchers |

---

## 💻 SYSTEM REQUIREMENTS

Before installing and running BT SILENT, please ensure your system meets the following minimum and recommended requirements:

### 🖥️ Operating System
- ✅ **Recommended:** Kali Linux (Latest Version)
- ✅ **Compatible:** Debian 11 / 12, Ubuntu 20.04 / 22.04 / 24.04, Linux Mint, Parrot OS, and other Debian-based distributions
- ❌ **Not Compatible:** Windows, macOS (without Linux subsystem), Android, iOS

### 🛠️ Software Dependencies
| Dependency | Minimum Version | Purpose | Installation Command |
|------------|-----------------|---------|----------------------|
| **Bash Shell** | 4.0+ | Script execution environment | Pre-installed on most systems |
| **Figlet** | 2.2.5+ | ASCII art banner generation | `sudo apt install figlet` |
| **Lolcat** | 2.2.5+ | Rainbow color text output | `sudo apt install lolcat` |
| **Bluez** | 5.87+ | Bluetooth protocol stack & tools | `sudo apt install bluez` |
| **Git** | 2.30+ | Repository cloning & updates | `sudo apt install git` |
| **Awk** | Any | Text processing | Pre-installed |

### 🔧 Hardware Requirements
| Component | Specification |
|-----------|---------------|
| **Processor** | 1 GHz or faster processor (32-bit or 64-bit) |
| **Memory (RAM)** | Minimum 512 MB RAM; Recommended 1 GB+ |
| **Storage** | Less than 50 MB free space required — very lightweight! |
| **Bluetooth Adapter** | Any Bluetooth adapter compatible with Bluez (Internal or USB) — Bluetooth 4.0+ recommended |
| **Network** | Internet connection required ONLY for installation and updates — not required during operation |

### 🔑 Privileges
- **Root / Sudo Access Required:** Yes — Bluetooth scanning and packet transmission operations require elevated system privileges
- **Regular User:** The program will automatically detect insufficient privileges and prompt you to restart with sudo

---
### 🚀 Quickstart
```bash
git clone https://github.com/williamkreese21/bt-silent.git
cd bt-silent
sudo apt update
sudo apt install -y figlet lolcat bluez
chmod +x *.sh
echo "alias bt-silent='cd ~/bt-silent && sudo ./bt-silent.sh'" >> ~/.bashrc && source ~/.bashrc




