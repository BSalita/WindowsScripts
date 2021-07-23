@echo off
if exist makeiso.err erase/q makeiso.err
if exist makeiso.log erase/q makeiso.log
set DIRS=%1
if not defined DIRS set DIRS=*
set MakeIsoBatch=yes
for /d %%i in (%DIRS%) do @call "MAKEISO1.BAT" "%%~i" %2
set MakeIsoBatch=
if exist makeiso.err erase/q makeiso.err