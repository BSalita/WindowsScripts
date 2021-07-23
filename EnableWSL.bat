dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
msiexec /i %USERPROFILE%\Downloads\wsl_update_x64.msi
wsl --set-default-version 2
wsl --list --verbose
echo Manually Execute: wsl --install --distribution Ubuntu
echo Manually Execute: wsl --install --distribution Kali-Linux
echo Linux filesystem are created in \\wsl$\Ubuntu