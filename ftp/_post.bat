@echo off

:: set your args here
set ftpIp=192.168.0.107
set userName=anonymous
set passWord=123
set ftpPostFile=ftppost.txt
set ftpMessageFile=message.txt
set logMessageFile=log.txt
set logTempFile=logtemp.txt

:start

set /p string="input string,exit for exit,r to read the origin text:"
if %string%==exit goto exit
if %string%==r goto post
echo %string%>%ftpMessageFile%

:post
:: record log
type %logMessageFile%>%logTempFile%
echo %date% %time%>%logMessageFile%
type %ftpMessageFile%>>%logMessageFile%
echo. >>%logMessageFile%
type %logTempFile%>>%logMessageFile%
del %logTempFile%

:: config ftp cmd
echo open %ftpIp%>%ftpPostFile%
echo user %userName%>>%ftpPostFile%
echo password %passWord%>>%ftpPostFile%
echo put %ftpMessageFile%>>%ftpPostFile%
echo get %logMessageFile%>>%ftpPostFile%
echo bye>>%ftpPostFile%
ftp -n -s:"%ftpPostFile%"

:: config log file
type %logMessageFile%>%logTempFile%
echo %date% %time%>%logMessageFile%
type %ftpMessageFile%>>%logMessageFile%
echo. >>%logMessageFile%
type %logTempFile%>>%logMessageFile%
del %logTempFile%

echo open %ftpIp%>%ftpPostFile%
echo user %userName%>>%ftpPostFile%
echo password %passWord%>>%ftpPostFile%
echo put %logMessageFile%>>%ftpPostFile%
echo bye>>%ftpPostFile%
ftp -n -s:"%ftpPostFile%"

echo.
echo complish
:: loop here
goto start

:: exit here
:exit
exit