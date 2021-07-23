@echo off
if exist makefolder.err erase/q makefolder.err
if exist makefolder.log erase/q makefolder.log
set DIRS=%1
if not defined DIRS set DIRS=*
set MakeFolderBatch=yes
for /d %%i in (%DIRS%) do @call "MAKEFOLDER1.BAT" "%%~i" %2
set MakeFolderBatch=
if exist makefolder.err erase/q makefolder.err