@echo off
:start
::Server name [!EDIT THIS!]
set serverName=YOUR SERVER NAME HERE
::Server files location [!EDIT AS NEEDED! THIS IS THE DEFAULT WHICH SHOULD WORK]
set serverDirectory="C:\Program Files (x86)\Steam\steamapps\common\DayZServer"
::Server Port [DEFAULT is 2302]
set serverPort=2302
::Server config [DEFAULT is serverDZ.cfg - hostname= in serverDZ.cfg is what shows in the steam server browser. !EDIT AS NEEDED!.]
set serverConfig=serverDZ.cfg
::Server profile location. logfiles are written here and mods are configured here [DEFAULT]
set serverProfile=profile
::Logical CPU cores to use (Equal or less than available)
set serverCPU=2
::modlist should be of the form "-mod=@mod1;@mod2;@mod3;" Don't forget the surrounding quotes or mods with spaces in their names won't work
set modList=""
::Sets title for terminal (DONT edit)
title %serverName% batch
::DayZServer location (DONT edit)
cd /D "%serverDirectory%"
:: This makes the profile directory if it doesn't already exist
if not exist "%serverProfile%" ( 
mkdir %serverProfile% > nul
) 
echo (%time%) %serverName% started.
::Launch parameters (edit end: -config=|-port=|-profiles=|-doLogs|-adminLog|-netLog|-freezeCheck|-filePatching|-BEpath=|-cpuCount=)
start "DayZ Server" /min DayZServer_x64.exe -config=%serverConfig% -port=%serverPort% -profiles=%serverProfile% -BEpath=battleye %modList% -cpuCount=%serverCPU% -dologs -adminlog -netlog -freezecheck

::Time in seconds before kill server process (14400 = 4 hours)
timeout 14400
taskkill /im DayZServer_x64.exe /F
::Time in seconds to wait before..
timeout 10
::Go back to the top and repeat the whole cycle again
goto start
