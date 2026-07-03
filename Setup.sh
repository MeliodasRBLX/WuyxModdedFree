#!/bin/bash
cd
if [ -e "/data/data/com.termux/files/home/storage" ]; then
	rm -rf /data/data/com.termux/files/home/storage
fi
termux-setup-storage
yes | pkg update
yes | pkg upgrade
yes | pkg i python
yes | pkg i python-pip
pip install requests pytz colorama datetime logsnag
export CFLAGS="-Wno-error=implicit-function-declaration"
pkg install python-psutil -y

curl -Ls "https://raw.githubusercontent.com/g-huy128/Wuyx/refs/heads/main/obf-wuyx_rejoin.py" -o /sdcard/Download/obf-wuyx_rejoin.py
