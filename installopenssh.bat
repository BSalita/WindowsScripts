@echo "Assumes you have installed OpenSSH Client and Server in Windows->Manage optional featues."
@echo "This script elevates to powershell prompt Run as Administrator mode."
pause
powershell -Command "Start-Process -Verb runAs" cmd.exe {/K powershell InstallOpenSSh.ps1}
