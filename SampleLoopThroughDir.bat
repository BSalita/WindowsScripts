For /F "tokens=*" %%F In ('Dir /B %1') Do copy "%1\%%F\folder.jpg" "%1\%%F\VIDEO_TS"
