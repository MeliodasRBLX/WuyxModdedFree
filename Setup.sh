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
echo -e "${YELLOW}        Initializing system loader...${NC}"
echo ""

# 10-second animated loader
spinner='|/-\'
echo -ne "${GREEN}[+] Loading system "

for i in {1..40}; do
    printf "\b%s" "${spinner:i%4:1}"
    sleep 0.25
done

echo -e "\n${GREEN}[✓] System loaded successfully!${NC}"
echo ""

echo ""

cd

if [ -e "/data/data/com.termux/files/home/storage" ]; then
	rm -rf /data/data/com.termux/files/home/storage
fi

# Storage setup (safe version)
echo -e "${BLUE}[+] Setting up storage...${NC}"
termux-setup-storage

# Update system
echo -e "${BLUE}[+] Updating packages...${NC}"
yes | pkg update
yes | pkg upgrade

echo -e "${BLUE}[+] Installing base Python...${NC}"
yes | pkg i python
yes | pkg i python-pip

pip install requests pytz colorama datetime logsnag

export CFLAGS="-Wno-error=implicit-function-declaration"
pkg install python-psutil -y

echo -e "${BLUE}[+] Downloading main script...${NC}"
curl -Ls "https://raw.githubusercontent.com/MeliodasRBLX/WuyxModdedFree/refs/heads/main/obf-wuyx_rejoin.py" \
-o /sdcard/Download/obf-wuyx_rejoin.py

# Build dependencies for Python 3.13
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

# Build (may take time)
echo -e "${YELLOW}[!] Building Python (this may take a while)...${NC}"
make -j$(nproc)

# Install Python 3.13 locally
echo -e "${BLUE}[+] Installing Python 3.13...${NC}"
make install

# Pip setup
$HOME/python313/bin/python3.13 -m ensurepip
$HOME/python313/bin/python3.13 -m pip install --upgrade pip

$HOME/python313/bin/pip install requests pytz colorama datetime logsnag psutil

echo ""
echo -e "${GREEN}====================================${NC}"
echo -e "${GREEN}  ✔ INSTALLATION COMPLETE${NC}"
echo -e "${GREEN}  MELIODAS MYUX MODDED IS READY${NC}"
echo -e "${GREEN}====================================${NC}"
echo ""
su -c "export PATH=$PATH:/data/data/com.termux/files/usr/bin && export TERM=xterm-256color && cd /sdcard/Download && python MeliodasWuyxFree.py"
