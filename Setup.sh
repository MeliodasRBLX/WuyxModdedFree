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

# ===== TOP BANNER (always visible) =====
print_banner() {
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
echo -e "${CYAN}        ✨ Meliodas Wuyx Mod ✨${NC}"
echo "============================================"
}

# ===== INSTALL CHECKS =====
PY_INSTALLED=false
SCRIPT_INSTALLED=false

# check python
if command -v python >/dev/null 2>&1; then
    PY_INSTALLED=true
fi

# check script
if [ -f "/sdcard/Download/obf-wuyx_rejoin.py" ]; then
    SCRIPT_INSTALLED=true
fi

# ===== START UI =====
print_banner

echo -e "${YELLOW}Status Check:${NC}"

# ===== INSTALL FLOW (BOTTOM HALF STYLE) =====
if [ "$PY_INSTALLED" = true ] && [ "$SCRIPT_INSTALLED" = true ]; then
    echo -e "${GREEN}[✓] Everything already installed${NC}"
    echo -e "${GREEN}[✓] Skipping setup...${NC}"
    echo ""
    echo -e "${PURPLE}[+] Launching script...${NC}"
    cd /sdcard/Download
    python obf-wuyx_rejoin.py
    exit
fi

echo ""

# ===== INSTALLATION =====

cd

echo -e "${BLUE}[+] Setting up storage...${NC}"
termux-setup-storage

echo -e "${BLUE}[+] Updating packages...${NC}"
yes | pkg update -y
yes | pkg upgrade -y

# Python install only if missing
if [ "$PY_INSTALLED" = false ]; then
    echo -e "${BLUE}[+] Installing Python...${NC}"
    yes | pkg install python python-pip -y
else
    echo -e "${GREEN}[✓] Python already installed${NC}"
fi

# dependencies
echo -e "${BLUE}[+] Installing Python packages...${NC}"
pip install requests pytz colorama datetime logsnag psutil

echo -e "${BLUE}[+] Installing system tools...${NC}"
pkg install python-psutil -y

# download script only if missing
if [ "$SCRIPT_INSTALLED" = false ]; then
    echo -e "${BLUE}[+] Downloading script...${NC}"
    curl -Ls "https://raw.githubusercontent.com/MeliodasRBLX/WuyxModdedFree/refs/heads/main/obf-wuyx_rejoin.py" \
    -o /sdcard/Download/obf-wuyx_rejoin.py
else
    echo -e "${GREEN}[✓] Script already exists${NC}"
fi

echo ""
echo -e "${GREEN}[✓] Setup complete${NC}"
echo -e "${PURPLE}[+] Launching script...${NC}"

cd /sdcard/Download
python obf-wuyx_rejoin.py
