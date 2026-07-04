#!/bin/bash

clear
# Colors
WHITE='\033[1;37m'
LBLUE='\033[1;36m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# =========================
# GRADIENT BANNER EFFECT
# =========================
show_banner() {
clear

lines=(
"███╗   ███╗███████╗██╗     ██╗ ██████╗ ██████╗  █████╗ ███████╗"
"████╗ ████║██╔════╝██║     ██║██╔═══██╗██╔══██╗██╔══██╗██╔════╝"
"██╔████╔██║█████╗  ██║     ██║██║   ██║██║  ██║███████║███████╗"
"██║╚██╔╝██║██╔══╝  ██║     ██║██║   ██║██║  ██║██╔══██║╚════██║"
"██║ ╚═╝ ██║███████╗███████╗██║╚██████╔╝██████╔╝██║  ██║███████║"
"╚═╝     ╚═╝╚══════╝╚══════╝╚═╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝"
)

echo ""

# fake gradient (white → light blue)
for i in "${!lines[@]}"; do
    if [ $i -le 1 ]; then
        echo -e "${WHITE}${lines[$i]}${NC}"
    elif [ $i -le 3 ]; then
        echo -e "${CYAN}${lines[$i]}${NC}"
    else
        echo -e "${LBLUE}${lines[$i]}${NC}"
    fi
    sleep 0.1
done

echo -e "${CYAN}"
echo "        ✨ Meliodas Wuyx Mod Free ✨"
echo "        ✨ Version: 1.0.0.1 ✨"
echo "==============================================="
echo -e "${NC}"
}


open_discord() {
echo -e "${YELLOW}[+] Opening Discord invite...${NC}"
termux-open-url "https://discord.gg/reconnect"
sleep 2
}


boot() {
echo ""
echo -e "${GREEN}[+] Initializing system kernel...${NC}"
sleep 1

steps=(
"Loading modules"
"Checking environment"
"Mounting storage"
"Verifying Python runtime"
"Allocating memory"
"Injecting dependencies"
"Resolving packages"
"Syncing system time"
"Checking script integrity"
"Finalizing boot sequence"
)

for i in "${steps[@]}"; do
    echo -e "${BLUE}[-] $i...${NC}"
    sleep 1.5
done

echo -e "${GREEN}[✓] Boot sequence complete${NC}"
echo ""
sleep 1
}


PY_INSTALLED=false
SCRIPT_INSTALLED=false

if command -v python >/dev/null 2>&1; then
    PY_INSTALLED=true
fi

if [ -f "/sdcard/Download/obf-wuyx_rejoin.py" ]; then
    SCRIPT_INSTALLED=true
fi


show_banner
open_discord
boot


if [ "$PY_INSTALLED" = true ] && [ "$SCRIPT_INSTALLED" = true ]; then
    echo -e "${GREEN}[✓] System already configured${NC}"
    echo -e "${YELLOW}[+] Skipping installation phase...${NC}"
    echo ""

    echo -e "${PURPLE}[+] Launching script...${NC}"
    cd /sdcard/Download
    python obf-wuyx_rejoin.py
    exit
fi

cd

echo -e "${BLUE}[+] Setting up storage...${NC}"
termux-setup-storage

echo -e "${BLUE}[+] Updating system packages...${NC}"
yes | pkg update -y
yes | pkg upgrade -y

if [ "$PY_INSTALLED" = false ]; then
    echo -e "${BLUE}[+] Installing Python...${NC}"
    yes | pkg install python python-pip -y
else
    echo -e "${GREEN}[✓] Python already installed${NC}"
fi

echo -e "${BLUE}[+] Installing Python modules...${NC}"
pip install requests pytz colorama datetime logsnag psutil

echo -e "${BLUE}[+] Installing system tools...${NC}"
pkg install python-psutil -y

if [ "$SCRIPT_INSTALLED" = false ]; then
    echo -e "${BLUE}[+] Downloading main script...${NC}"
    curl -Ls "https://raw.githubusercontent.com/MeliodasRBLX/WuyxModdedFree/refs/heads/main/obf-wuyx_rejoin.py" \
    -o /sdcard/Download/obf-wuyx_rejoin.py
else
    echo -e "${GREEN}[✓] Script already exists${NC}"
fi

echo ""
echo -e "${GREEN}[✓] Installation complete${NC}"
echo -e "${PURPLE}[+] Launching script...${NC}"

cd /sdcard/Download
python obf-wuyx_rejoin.py
