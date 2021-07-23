@echo off
set SRC=%1
set DEST=%2
rem echo Debug ARG1=%1 ARG2=%2 SRC=%SRC% DEST=%DEST%
if defined SRC goto HasArgs
echo MakeIso1: Makes ISO from (Blu-Ray) Folder
echo syntax: makeiso1 source-folder-to-convert-to-iso [destination-folder]
goto:eof
:HasArgs
if not defined MakeIsoBatch goto NoErrorSoFar
if not exist makeiso.err goto NoErrorSoFar
echo %SRC% skipped folder due to previous error
echo %SRC% skipped folder due to previous error >>makeiso.log
goto:eof
:NoErrorSoFar
set PathToImgBurn="C:\Program Files\ImgBurn\ImgBurn.exe"
if exist %PathToImgBurn% goto FoundImgBurn
set PathToImgBurn="C:\Program Files (x86)\ImgBurn\ImgBurn.exe"
if exist %PathToImgBurn% goto FoundImgBurn
echo Can't locate imgburn
echo Can't locate imgburn >>makeiso.err
echo Can't locate imgburn >>makeiso.log
goto:eof
:FoundImgBurn
set FolderNameOnly=%~nx1
if exist %SRC% goto SrcOk
echo %SRC% not found
echo %SRC% not found >>makeiso.log
goto:eof
:SrcOk
if exist %SRC%\BDMV goto BDMVOk
echo %SRC%\BDMV not found - not a Blue-Ray disc
echo %SRC% not found - not a Blue-Ray disc >>makeiso.log
goto:eof
:BDMVOk
if defined DEST set DEST=%~2\
set DEST="%DEST%%FolderNameOnly%.ISO"
rem Uncomment the following line (remove "rem") if any existing .ISO is to be removed.
rem if exist %DEST% erase/q %DEST%
if not exist %DEST% goto DestOk
echo %DEST% exists - skipping
echo %DEST% exists - skipping >>makeiso.log
goto:eof
:DestOk
echo Converting %SRC% to %DEST%
echo Converting %SRC% to %DEST% >>makeiso.log
rem goto IsoExists
%PathToImgBurn% /MODE BUILD /BUILDMODE IMAGEFILE /SRC %SRC% /DEST %DEST% /FILESYSTEM "UDF" /UDFREVISION "2.50" /VOLUMELABEL "%FolderNameOnly%" /CLOSE /NOIMAGEDETAILS /ROOTFOLDER "YES" /START
rem could test for %ERRORLEVEL% but seems to be zero even when errors occur (empty BDMV)
if exist %DEST% goto IsoExists
echo %DEST% doesn't exist
echo %DEST% doesn't exist >makeiso.err
echo %DEST% doesn't exist >makeiso.log
goto:eof
:IsoExists
rem Uncomment the following line (remove "rem") if source folder is to be removed upon successful completion.
rem @rmdir/q/s %SRC%
