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
echo "        ✨ Meliodas Wuyx Mod Free✨"
echo "        ✨ Version: 1.0.0.1 ✨"
echo "==============================================="
echo -e "${NC}"
}

# =========================
# DISCORD AUTO OPEN
# =========================
open_discord() {
echo -e "${YELLOW}[+] Opening Discord invite...${NC}"
termux-open-url "https://discord.gg/YOUR_INVITE"
sleep 2
}

# =========================
# FAKE BOOT (15 sec)
# =========================
fake_boot() {
echo ""
echo -e "${GREEN}[+] Initializing system...${NC}"

steps=(
"Loading kernel"
"Checking modules"
"Mounting storage"
"Verifying Python runtime"
"Allocating memory"
"Injecting dependencies"
"Syncing system"
"Finalizing boot"
)

for i in "${steps[@]}"; do
    echo -e "${BLUE}[-] $i...${NC}"
    sleep 1.5
done

echo -e "${GREEN}[✓] Boot complete${NC}"
echo ""
sleep 1
}

# =========================
# CHECK INSTALL
# =========================
PY_INSTALLED=false
SCRIPT_INSTALLED=false

if command -v python >/dev/null 2>&1; then
    PY_INSTALLED=true
fi

if [ -f "/sdcard/Download/obf-wuyx_rejoin.py" ]; then
    SCRIPT_INSTALLED=true
fi

# =========================
# START
# =========================
show_banner
open_discord
fake_boot

# =========================
# SKIP INSTALL IF READY
# =========================
if [ "$PY_INSTALLED" = true ] && [ "$SCRIPT_INSTALLED" = true ]; then
    echo -e "${GREEN}[✓] Already installed${NC}"
    echo -e "${YELLOW}[+] Skipping setup...${NC}"
    cd /sdcard/Download
    python obf-wuyx_rejoin.py
    exit
fi

# =========================
# INSTALLATION
# =========================
cd

echo -e "${BLUE}[+] Setting up storage...${NC}"
termux-setup-storage

echo -e "${BLUE}[+] Updating system...${NC}"
yes | pkg update -y
yes | pkg upgrade -y

if ! command -v python >/dev/null 2>&1; then
    echo -e "${BLUE}[+] Installing Python...${NC}"
    yes | pkg install python python-pip -y
else
    echo -e "${GREEN}[✓] Python already installed${NC}"
fi

echo -e "${BLUE}[+] Installing modules...${NC}"
pip install requests pytz colorama datetime logsnag psutil

echo -e "${BLUE}[+] Installing tools...${NC}"
pkg install python-psutil -y

if [ "$SCRIPT_INSTALLED" = false ]; then
    echo -e "${BLUE}[+] Downloading script...${NC}"
    curl -Ls "https://raw.githubusercontent.com/MeliodasRBLX/WuyxModdedFree/refs/heads/main/obf-wuyx_rejoin.py" \
    -o /sdcard/Download/obf-wuyx_rejoin.py
fi

echo ""
echo -e "${GREEN}[✓] Setup complete${NC}"
echo -e "${PURPLE}[+] Launching script...${NC}"

cd /sdcard/Download
python obf-wuyx_rejoin.py
