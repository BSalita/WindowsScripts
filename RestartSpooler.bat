@echo off
 echo Stopping Spooler
 echo.
 net stop spooler
 echo Deleting Stuff
 echo.
 del "%SystemRoot%\system32\spool\printers\*.shd"
 del "%SystemRoot%\system32\spool\printers\*.spl"
 echo Restarting Spooler.
 echo.
 net start spooler
 