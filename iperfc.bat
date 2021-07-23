echo First parameter is ip (192.168.1.96). Default is localhost
set ip=localhost
if "%1" neq "" set ip=%1
iperf-2.0.14a-win.exe -d -c %ip%
