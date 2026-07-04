#!/bin/bash

clear

RED=([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XDAzM1swOzMxbQ==')))
GREEN=([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XDAzM1swOzMybQ==')))
YELLOW=([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XDAzM1sxOzMzbQ==')))
BLUE=([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XDAzM1swOzM0bQ==')))
PURPLE=([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XDAzM1swOzM1bQ==')))
CYAN=([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XDAzM1swOzM2bQ==')))
NC=([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XDAzM1swbQ==')))

show_banner() {
clear
echo -e ${PURPLE}
cat << ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('RU9G')))
███╗   ███╗███████╗██╗     ██╗ ██████╗ ██████╗  █████╗ ███████╗
████╗ ████║██╔════╝██║     ██║██╔═══██╗██╔══██╗██╔══██╗██╔════╝
██╔████╔██║█████╗  ██║     ██║██║   ██║██║  ██║███████║███████╗
██║╚██╔╝██║██╔══╝  ██║     ██║██║   ██║██║  ██║██╔══██║╚════██║
██║ ╚═╝ ██║███████╗███████╗██║╚██████╔╝██████╔╝██║  ██║███████║
╚═╝     ╚═╝╚══════╝╚══════╝╚═╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝
EOF
echo -e ${NC}
echo -e (${CYAN} + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgICAgICDinKggTWVsaW9kYXMgV3V5eCBNb2QgRnJlZSDinKg='))) + ${NC})
echo -e (${CYAN} + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgICAgICDinKggVmVyc2lvbiAxLjAuMC4xIOKcqA=='))) + ${NC})
echo ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0=')))
}


boot() {
echo ''
echo -e (${GREEN} + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('WytdIEluaXRpYWxpemluZyBzeXN0ZW0ga2VybmVsLi4u'))) + ${NC})
sleep 1

steps=(
([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('TG9hZGluZyBtb2R1bGVz')))
([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Q2hlY2tpbmcgZW52aXJvbm1lbnQ=')))
([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('TW91bnRpbmcgc3RvcmFnZQ==')))
([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('VmVyaWZ5aW5nIFB5dGhvbiBydW50aW1l')))
([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QWxsb2NhdGluZyBtZW1vcnk=')))
([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SW5qZWN0aW5nIGRlcGVuZGVuY2llcw==')))
([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UmVzb2x2aW5nIHBhY2thZ2Vz')))
([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U3luY2luZyBzeXN0ZW0gdGltZQ==')))
([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Q2hlY2tpbmcgc2NyaXB0IGludGVncml0eQ==')))
([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('RmluYWxpemluZyBib290IHNlcXVlbmNl')))
)

for i in ${steps[@]}; do
    echo -e (${BLUE} + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Wy1dIA=='))) + $i + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Li4u'))) + ${NC})
    sleep 1.5
done

echo -e (${GREEN} + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('W+Kck10gQm9vdCBzZXF1ZW5jZSBjb21wbGV0ZQ=='))) + ${NC})
echo ''
sleep 1
}


PY_INSTALLED=false
SCRIPT_INSTALLED=false

if command -v python >/dev/null 2>&1; then
    PY_INSTALLED=true
fi

if [ -f ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('L3NkY2FyZC9Eb3dubG9hZC9vYmYtd3V5eF9yZWpvaW4ucHk='))) ]; then
    SCRIPT_INSTALLED=true
fi


show_banner
boot


if [ $PY_INSTALLED = true ] && [ $SCRIPT_INSTALLED = true ]; then
    echo -e (${GREEN} + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('W+Kck10gU3lzdGVtIGFscmVhZHkgY29uZmlndXJlZA=='))) + ${NC})
    echo -e (${YELLOW} + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('WytdIFNraXBwaW5nIGluc3RhbGxhdGlvbiBwaGFzZS4uLg=='))) + ${NC})
    echo ''

    echo -e (${PURPLE} + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('WytdIExhdW5jaGluZyBzY3JpcHQuLi4='))) + ${NC})
    cd /sdcard/Download
    python obf-wuyx_rejoin.py
    exit
fi

cd

echo -e (${BLUE} + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('WytdIFNldHRpbmcgdXAgc3RvcmFnZS4uLg=='))) + ${NC})
termux-setup-storage

echo -e (${BLUE} + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('WytdIFVwZGF0aW5nIHN5c3RlbSBwYWNrYWdlcy4uLg=='))) + ${NC})
yes | pkg update -y
yes | pkg upgrade -y

if [ $PY_INSTALLED = false ]; then
    echo -e (${BLUE} + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('WytdIEluc3RhbGxpbmcgUHl0aG9uLi4u'))) + ${NC})
    yes | pkg install python python-pip -y
else
    echo -e (${GREEN} + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('W+Kck10gUHl0aG9uIGFscmVhZHkgaW5zdGFsbGVk'))) + ${NC})
fi

echo -e (${BLUE} + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('WytdIEluc3RhbGxpbmcgUHl0aG9uIG1vZHVsZXMuLi4='))) + ${NC})
pip install requests pytz colorama datetime logsnag psutil

echo -e (${BLUE} + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('WytdIEluc3RhbGxpbmcgc3lzdGVtIHRvb2xzLi4u'))) + ${NC})
pkg install python-psutil -y

if [ $SCRIPT_INSTALLED = false ]; then
    echo -e (${BLUE} + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('WytdIERvd25sb2FkaW5nIG1haW4gc2NyaXB0Li4u'))) + ${NC})
    curl -Ls ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL01lbGlvZGFzUkJMWC9XdXl4TW9kZGVkRnJlZS9yZWZzL2hlYWRzL21haW4vb2JmLXd1eXhfcmVqb2luLnB5'))) \
    -o /sdcard/Download/obf-wuyx_rejoin.py
else
    echo -e (${GREEN} + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('W+Kck10gU2NyaXB0IGFscmVhZHkgZXhpc3Rz'))) + ${NC})
fi

echo ''
echo -e (${GREEN} + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('W+Kck10gSW5zdGFsbGF0aW9uIGNvbXBsZXRl'))) + ${NC})
echo -e (${PURPLE} + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('WytdIExhdW5jaGluZyBzY3JpcHQuLi4='))) + ${NC})

cd /sdcard/Download
python obf-wuyx_rejoin.py
