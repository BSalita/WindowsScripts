@echo off
if "%1" equ "" (
echo Missing environment name.
goto :eof
)
conda create --name %1 --clone base