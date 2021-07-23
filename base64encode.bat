@echo off
if not "%1" == "" goto :arg1exists
echo usage: base64encode input-file [output-file]
goto :eof
:arg1exists
set base64out=%2
if "%base64out%" == "" set base64out=con 
(
  set base64tmp=base64.tmp
  echo Might be better to use certutil -encodehex -f "%1" %base64tmp% 0x40000001 See https://stackoverflow.com/questions/60389507/cmd-batch-encode-file-to-base-64-and-trim-characters-and-new-line/60404255#60404255
  certutil -encode "%1" %base64tmp% > nul
  findstr /v /c:- %base64tmp%
  erase %base64tmp%
) > %base64out%