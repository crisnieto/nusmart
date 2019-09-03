@echo off

echo Welcome to the Installer SetUp of NuSmart!

echo Please introduce your Database Engine Server Name, example: DESKTOP-EJGFO76\SQLEXPRESS

echo ......................................................................................

set /P name=Enter Database Engine Server Name:
sqlcmd -S %name% -i installation.sql

echo Data Source=%name%;Initial Catalog=nusmart;Integrated Security=True >> test.txt
echo Installation Complete!

echo Please run NuSmart.exe from now on
echo Starting NuSmart...

timeout /t 5
START NuSmart.exe