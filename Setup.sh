#!/bin/bash

cd

# Storage setup (safe version)
termux-setup-storage

# Update system
yes | pkg update
yes | pkg upgrade

# Build dependencies for Python 3.13
pkg install -y clang make pkg-config wget tar git \
libffi openssl zlib bzip2 xz readline sqlite ncurses

# Download Python 3.13
cd $HOME
PYVER=3.13.7

wget https://www.python.org/ftp/python/$PYVER/Python-$PYVER.tgz
tar -xzf Python-$PYVER.tgz
cd Python-$PYVER

# Configure build
CPPFLAGS="-I$PREFIX/include" \
LDFLAGS="-L$PREFIX/lib" \
./configure --prefix=$HOME/python313 --enable-optimizations

# Build (may take time)
make -j$(nproc)

# Install Python 3.13 locally
make install

# Use Python 3.13 pip
$HOME/python313/bin/python3.13 -m ensurepip
$HOME/python313/bin/python3.13 -m pip install --upgrade pip

# Install required packages (for Python 3.13)
$HOME/python313/bin/pip install requests pytz colorama datetime logsnag psutil

# Download script
curl -Ls "https://raw.githubusercontent.com/MeliodasRBLX/WuyxModdedFree/refs/heads/main/obf-wuyx_rejoin.py" \
-o /sdcard/Download/obf-wuyx_rejoin.py

echo "DONE: Python 3.13 installed at $HOME/python313"
echo "Run with: $HOME/python313/bin/python3.13 your_script.py"
