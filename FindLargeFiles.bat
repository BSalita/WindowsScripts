echo Find large files, display to console, create .bat file for ready-to-use deletions
forfiles /S /C "cmd /c if @fsize GTR 1048576 echo @fsize @path && echo del @path >> c:\temp\files.bat"