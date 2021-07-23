rem install latest version of udemy-dll: python.exe -m pip install --upgrade https://github.com/nishad/udemy-dl/zipball/master
rem ignore any "InsecurePlatformWarning"
rem if download errors out, manually restart by using --lecture-start followed by the next lecture's number: e.g. --lecture-start 4
cd c:\sw\udemy
bash -c "udemy-dl -u bsalita@yahoo.com -p ud7665 %1"