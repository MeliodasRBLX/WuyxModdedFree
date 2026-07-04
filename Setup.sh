#!/bin/bash

clear

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

# =========================
# BANNER
# =========================
show_banner() {
clear
echo -e "${PURPLE}"
cat << "EOF"
███╗   ███╗███████╗██╗     ██╗ ██████╗ ██████╗  █████╗ ███████╗
████╗ ████║██╔════╝██║     ██║██╔═══██╗██╔══██╗██╔══██╗██╔════╝
██╔████╔██║█████╗  ██║     ██║██║   ██║██║  ██║███████║███████╗
██║╚██╔╝██║██╔══╝  ██║     ██║██║   ██║██║  ██║██╔══██║╚════██║
██║ ╚═╝ ██║███████╗███████╗██║╚██████╔╝██████╔╝██║  ██║███████║
╚═╝     ╚═╝╚══════╝╚══════╝╚═╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝
EOF
echo -e "${NC}"
echo -e "${CYAN}        ✨ Meliodas Mod Boot System ✨${NC}"
echo "==============================================="
}

# =========================
# FAKE LOADING (15 sec)
# =========================
fake_boot() {
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

# =========================
# CHECK INSTALLATION
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
fake_boot

# =========================
# IF EVERYTHING EXISTS → SKIP INSTALL BUT STILL SHOW BOOT
# =========================
if [ "$PY_INSTALLED" = true ] && [ "$SCRIPT_INSTALLED" = true ]; then
    echo -e "${GREEN}[✓] System already configured${NC}"
    echo -e "${YELLOW}[+] Skipping installation phase...${NC}"
    echo ""

    echo -e "${PURPLE}[+] Launching script...${NC}"
    cd /sdcard/Download
    python obf-wuyx_rejoin.py
    exit
fi

# =========================
# INSTALLATION FLOW
# =========================
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
