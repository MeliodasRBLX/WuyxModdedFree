#!/bin/bash

clear

RED=('\033['+'0;3'+'1m')
GREEN=([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XDAzM1swOzMybQ==')))
YELLOW='\​0‍3‍3‌[‌1​;‌3​3‍m‍'
BLUE=([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XDAzM1swOzM0bQ==')))
PURPLE=([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XDAzM1swOzM1bQ==')))
CYAN=('\'+'0'+'33[0;'+'36'+'m')
NC=([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XDAzM1swbQ==')))

show_banner() {
clear
echo -e ${PURPLE}
cat << 'ЕОF'
███╗   ███╗███████╗██╗     ██╗ ██████╗ ██████╗  █████╗ ███████╗
████╗ ████║██╔════╝██║     ██║██╔═══██╗██╔══██╗██╔══██╗██╔════╝
██╔████╔██║█████╗  ██║     ██║██║   ██║██║  ██║███████║███████╗
██║╚██╔╝██║██╔══╝  ██║     ██║██║   ██║██║  ██║██╔══██║╚════██║
██║ ╚═╝ ██║███████╗███████╗██║╚██████╔╝██████╔╝██║  ██║███████║
╚═╝     ╚═╝╚══════╝╚══════╝╚═╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝
EOF
echo -e ${NC}
echo -e (${CYAN} + '        ✨ Меlіоdаs Wuух Моd Frее ✨' + ${NC})
echo -e (${CYAN} + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgICAgICDinKggVmVyc2lvbiAxLjAuMC4xIOKcqA=='))) + ${NC})
echo ('======='+'======='+'======'+'========'+'======='+'=='+'===='+'==='+'=='+'=')
}


fake_boot() {
echo ''
echo -e (${GREEN} + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('WytdIEluaXRpYWxpemluZyBzeXN0ZW0ga2VybmVsLi4u'))) + ${NC})
sleep 1

steps=(
'L‌o​a​d​i​n‍g‌ ​m‌o‌d​u‍l​e​s‍'
([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Q2hlY2tpbmcgZW52aXJvbm1lbnQ=')))
('M'+'ountin'+'g sto'+'ra'+'ge')
([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('VmVyaWZ5aW5nIFB5dGhvbiBydW50aW1l')))
([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QWxsb2NhdGluZyBtZW1vcnk=')))
('In'+'jecting'+' depend'+'e'+'nc'+'ie'+'s')
'Rеsоlvіng расkаgеs'
('Syncing'+' system'+' ti'+'m'+'e')
([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Q2hlY2tpbmcgc2NyaXB0IGludGVncml0eQ==')))
([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('RmluYWxpemluZyBib290IHNlcXVlbmNl')))
)

for i in ${steps[@]}; do
    echo -e (${BLUE} + '[​-‌]​ ‌' + $i + '...' + ${NC})
    sleep 1.5
done

echo -e (${GREEN} + '[‌✓​]​ ‌B‌o​o‍t‌ ​s‌e‍q​u‌e​n‍c‍e‌ ​c‌o‌m‌p‍l‌e​t‌e‌' + ${NC})
echo ''
sleep 1
}


PY_INSTALLED=false
SCRIPT_INSTALLED=false

if command -v python >/dev/null 2>&1; then
    PY_INSTALLED=true
fi

if [ -f ('/sdca'+'r'+'d'+'/Downloa'+'d/obf-w'+'uy'+'x_rejo'+'in'+'.py') ]; then
    SCRIPT_INSTALLED=true
fi


show_banner
fake_boot


if [ $PY_INSTALLED = true ] && [ $SCRIPT_INSTALLED = true ]; then
    echo -e (${GREEN} + '[‌✓‌]​ ‌S‍y‍s​t​e​m‍ ‌a​l​r​e‍a‍d​y​ ‌c‌o‌n‍f‍i‍g‌u​r‌e‌d​' + ${NC})
    echo -e (${YELLOW} + ('[+'+'] Sk'+'ipp'+'ing '+'in'+'st'+'all'+'ation '+'pha'+'se...') + ${NC})
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
    echo -e (${BLUE} + (-join('[','+','] Insta','lling',' Pyt','h','on..','.')) + ${NC})
    yes | pkg install python python-pip -y
else
    echo -e (${GREEN} + (-join('[✓] Pyth','on al','rea','dy ','i','n','stall','ed')) + ${NC})
fi

echo -e (${BLUE} + (-join('[+] In','stallin','g Py','tho','n',' m','odules','...')) + ${NC})
pip install requests pytz colorama datetime logsnag psutil

echo -e (${BLUE} + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('WytdIEluc3RhbGxpbmcgc3lzdGVtIHRvb2xzLi4u'))) + ${NC})
pkg install python-psutil -y

if [ $SCRIPT_INSTALLED = false ]; then
    echo -e (${BLUE} + '[​+‍]‍ ​D‌o‌w‍n‍l‍o‌a‌d‌i‍n‌g​ ​m‍a‍i‍n‌ ​s​c​r‍i‌p‌t‌.‌.‍.​' + ${NC})
    curl -Ls 'h​t‍t‌p‌s‌:‌/‍/‍r​a‌w​.​g‍i‌t‌h‍u‍b‌u​s‍e‍r‍c‍o​n​t‌e‍n​t​.​c‌o‌m‌/​M​e‌l‍i​o‍d‍a‍s‌R‌B​L‍X‌/‍W‌u‍y‍x‍M‍o​d​d​e​d‌F​r‌e​e​/‌r‌e‍f‌s‌/​h‍e‌a‌d‌s​/‍m‍a‌i‍n‌/‍o‌b‌f‌-​w‍u‌y​x‍_‍r‍e​j‌o​i‍n‌.‌p‍y‍' \
    -o /sdcard/Download/obf-wuyx_rejoin.py
else
    echo -e (${GREEN} + ('[✓] Scr'+'ipt alre'+'ady '+'exi'+'s'+'ts') + ${NC})
fi

echo ''
echo -e (${GREEN} + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('W+Kck10gSW5zdGFsbGF0aW9uIGNvbXBsZXRl'))) + ${NC})
echo -e (${PURPLE} + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('WytdIExhdW5jaGluZyBzY3JpcHQuLi4='))) + ${NC})

cd /sdcard/Download
python obf-wuyx_rejoin.py
