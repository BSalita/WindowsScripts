@echo "This script elevates to powershell prompt Run as Administrator mode."
powershell -Command "Start-Process -Verb runAs" cmd.exe {/K powershell SetPowerShellExecutionPolicy.ps1}