@echo off
set SRC=%1
set DEST=%2
rem echo Debug ARG1=%1 ARG2=%2 SRC=%SRC% DEST=%DEST%
if defined SRC goto HasArgs
echo MakeFolder1: Makes Folders from (Blu-Ray) ISO
echo syntax: makefolder1 source-iso-to-convert-to-folder [destination-folder]
goto:eof
:HasArgs
if not defined MakeFolderBatch goto NoErrorSoFar
if not exist makefolder.err goto NoErrorSoFar
echo %SRC% skipped folder due to previous error
echo %SRC% skipped folder due to previous error >>makefolder.log
goto:eof
:NoErrorSoFar
set PathToImgBurn="C:\Program Files\ImgBurn\ImgBurn.exe"
if exist %PathToImgBurn% goto FoundImgBurn
set PathToImgBurn="C:\Program Files (x86)\ImgBurn\ImgBurn.exe"
if exist %PathToImgBurn% goto FoundImgBurn
echo Can't locate imgburn
echo Can't locate imgburn >>makefolder.err
echo Can't locate imgburn >>makefolder.log
goto:eof
:FoundImgBurn
set FolderNameOnly=%~nx1
if exist %SRC% goto SrcOk
echo %SRC% not found
echo %SRC% not found >>makefolder.log
goto:eof
:SrcOk
if exist "%SRC%%FolderNameOnly%.ISO" goto ISOOk
echo %SRC%%FolderNameOnly%.ISO not found - not a Blue-Ray disc
echo %SRC% not found - not a Blue-Ray folder >>makefolder.log
goto:eof
:ISOOk
if defined DEST set DEST=%~2\
set DEST="%DEST%%FolderNameOnly%.ISO"
rem Uncomment the following line (remove "rem") if any existing .ISO is to be removed.
rem if exist %DEST% erase/q %DEST%
if not exist %DEST% goto DestOk
echo %DEST% exists - skipping
echo %DEST% exists - skipping >>makefolder.log
goto:eof
:DestOk
echo Converting %SRC% to %DEST%
echo Converting %SRC% to %DEST% >>makefolder.log
rem goto IsoExists
%PathToImgBurn% /MODE READ /SRC %SRC% /DEST %DEST% /CLOSE /NOIMAGEDETAILS /ROOTFOLDER "YES" /START
rem could test for %ERRORLEVEL% but seems to be zero even when errors occur (empty ISO)
if exist %DEST% goto IsoExists
echo %DEST% doesn't exist
echo %DEST% doesn't exist >makefolder.err
echo %DEST% doesn't exist >makefolder.log
goto:eof
:IsoExists
rem Uncomment the following line (remove "rem") if source folder is to be removed upon successful completion.
rem @rmdir/q/s %SRC%
