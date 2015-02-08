#/bin/bash

if [ ! -f /data/.wine/winetricks.log ]; then
    echo "Installing wine tricks ..."
    winetricks fontfix fontsmooth-rgb gdiplus gecko vcrun2008 vcrun2005 d3dx11_43 win7 ie6
    bash
    exit
fi

if [ ! -f "/data/.wine/drive_c/Program Files (x86)/Battle.net/Battle.net.exe" ]; then
    echo "Installing battle.net launcher ..."
    wget http://dist.blizzard.com/downloads/bna-installers/322d5bb9ae0318de3d4cde7641c96425/retail.1/Battle.net-Setup-enUS.exe -O setup.exe
    wine setup.exe
    bash
    exit
fi

wine "/data/.wine/drive_c/Program Files (x86)/Battle.net/Battle.net.exe"
bash
exit

