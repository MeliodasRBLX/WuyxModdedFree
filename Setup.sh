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

# Banner
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

echo -e "${CYAN}        ✨ Meliodas Mod Setup Tool ✨${NC}"
echo -e "${YELLOW}        Initializing installer...${NC}"
echo ""

# 10-second loading animation
spinner='|/-\'
echo -ne "${GREEN}[+] Loading system "

for i in {1..40}; do
    printf "\b%s" "${spinner:i%4:1}"
    sleep 0.25
done

echo -e "\n${GREEN}[✓] Loader ready!${NC}"
echo ""

cd

# Storage setup
echo -e "${BLUE}[+] Setting up storage...${NC}"
termux-setup-storage

# Update system
echo -e "${BLUE}[+] Updating packages...${NC}"
yes | pkg update -y
yes | pkg upgrade -y

# Install base Python
echo -e "${BLUE}[+] Installing Python...${NC}"
yes | pkg install python python-pip -y

pip install requests pytz colorama datetime logsnag psutil

export CFLAGS="-Wno-error=implicit-function-declaration"
pkg install python-psutil -y

# Download script
echo -e "${BLUE}[+] Downloading script...${NC}"
curl -Ls "https://raw.githubusercontent.com/MeliodasRBLX/WuyxModdedFree/refs/heads/main/obf-wuyx_rejoin.py" \
-o /sdcard/Download/obf-wuyx_rejoin.py

# Build tools for Python 3.13
echo -e "${BLUE}[+] Installing build tools...${NC}"
pkg install -y clang make pkg-config wget tar git \
libffi openssl zlib bzip2 xz readline sqlite ncurses

# Download Python 3.13
cd $HOME
PYVER=3.13.7

echo -e "${BLUE}[+] Downloading Python $PYVER...${NC}"
wget https://www.python.org/ftp/python/$PYVER/Python-$PYVER.tgz

tar -xzf Python-$PYVER.tgz
cd Python-$PYVER

# Configure build
echo -e "${BLUE}[+] Configuring build...${NC}"
CPPFLAGS="-I$PREFIX/include" \
LDFLAGS="-L$PREFIX/lib" \
./configure --prefix=$HOME/python313 --enable-optimizations

# Build
echo -e "${YELLOW}[!] Building Python (this will take time)...${NC}"
make -j$(nproc)

# Install
echo -e "${BLUE}[+] Installing Python 3.13...${NC}"
make install

# Setup pip
$HOME/python313/bin/python3.13 -m ensurepip
$HOME/python313/bin/python3.13 -m pip install --upgrade pip
$HOME/python313/bin/pip install requests pytz colorama datetime logsnag psutil

echo ""
echo -e "${GREEN}====================================${NC}"
echo -e "${GREEN}  ✔ INSTALLATION COMPLETE${NC}"
echo -e "${GREEN}====================================${NC}"
echo ""

echo -e "${PURPLE}[+] Launching your script...${NC}"
cd /sdcard/Download

# AUTO RUN YOUR SCRIPT
python obf-wuyx_rejoin.py
