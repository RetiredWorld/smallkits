@echo off
:: set your args here
set ftpIp=192.168.0.107
set userName=anonymous
set passWord=123
set ftpGetFile=ftpget.txt
set ftpMessageFile=message.txt

:start
set /p flag="press key to read,"r" to copy to clip board,exit for exit:"
if %flag%==exit goto exit


:: config ftp cmd
echo open %ftpIp%>%ftpGetFile%
echo user %userName%>>%ftpGetFile%
echo password %passWord%>>%ftpGetFile%
:: echo ls>>ftpGetFile
echo get %ftpMessageFile%>>%ftpGetFile%
echo bye>>%ftpGetFile%
ftp -n -s:"%ftpGetFile%"
echo complish


:: r for copy to clipboard, or merely output
if %flag%==r clip<%ftpMessageFile%

echo.
echo the received string is:
for /f "delims=[" %%i in (message.txt) do echo %%i
echo.
:: loop here
goto start


:: exit here
:exit
exit