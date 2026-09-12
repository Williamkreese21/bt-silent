# 📡 BT SILENT — USAGE GUIDE

## 📋 Table of Contents
- [Overview](#-overview)
- [Command Reference](#-command-reference)
- [Main Menu Guide](#-main-menu-guide)
- [Detailed Option Instructions](#-detailed-option-instructions)
- [Quick Examples](#-quick-examples)
- [Background Operations](#-background-operations)
- [Status Monitoring](#-status-monitoring)
- [Keyboard Shortcuts](#-keyboard-shortcuts)
- [Best Practices](#-best-practices)
- [Common Use Cases](#-common-use-cases)
- [Advanced Usage](#-advanced-usage)
- [Emergency Commands](#-emergency-commands)
- [Frequently Asked Questions](#-frequently-asked-questions)

---

## 🔍 OVERVIEW

**BT SILENT** is designed to be as intuitive and easy-to-use as possible. You don't need to memorize complex commands or understand technical Bluetooth concepts — everything is accessible through a simple numbered menu interface. This document explains every aspect of how to use the program effectively, from basic launching to advanced operational scenarios.

---

## ⌨️ COMMAND REFERENCE

### Primary Commands
| Command | Description | Privileges Required |
|---------|-------------|---------------------|
| `bt-silent` | Launch the main BT SILENT menu interface | Root / Sudo (auto-prompted) |
| `bt-silent-status` | Check current running status — standalone quick check | None |
| `bt-silent-stop` | Immediately stop all running operations — emergency stop | Root / Sudo |

### Alternative / Manual Commands
| Command | Description |
|---------|-------------|
| `cd ~/bt-silent && ./bt-silent.sh` | Launch main program without using the global alias |
| `./bt-silent-stop.sh` | Stop operations directly from project folder |
| `./bt-silent-status.sh` | Check status directly from project folder |
| `sudo ~/bt-silent/./bt-silent.sh` | Force launch with root privileges explicitly |

---

## 🖥️ MAIN MENU GUIDE

### Step 1 — Launch The Program
Type this in your terminal and press Enter:
```bash
bt-silent
