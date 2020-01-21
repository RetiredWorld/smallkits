@echo off

:: set your args here
set ftpIp=192.168.0.107
set userName=anonymous
set passWord=123
set ftpPostFile=ftppost.txt
set ftpMessageFile=./message.txt

:start

set /p string="input string,exit for exit:"
if %string%==exit goto exit

echo %string%>%ftpMessageFile%

:: config ftp cmd
echo open %ftpIp%>%ftpPostFile%
echo user %userName%>>%ftpPostFile%
echo password %passWord%>>%ftpPostFile%
echo put %ftpMessageFile%>>%ftpPostFile%
echo bye>>%ftpPostFile%
echo complish
ftp -n -s:"%ftpPostFile%"



:: loop here
goto start

:: exit here
:exit
exit