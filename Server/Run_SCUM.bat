echo off
title SCUM Dedicated Server
echo Starting SCUM Dedicated Server...
:start

cd steam
steamcmd.exe +runscript ../update_script.txt
steamcmd.exe +runscript ../update_script.txt
cd ..

cd scumds/SCUM/Binaries/Win64/
start "" "SCUMServer.exe" The_Island?listen -log -server -MaxPlayers=2 -ServerName="MySCUMServer"
echo Server is running. Press any key to exit...

pause