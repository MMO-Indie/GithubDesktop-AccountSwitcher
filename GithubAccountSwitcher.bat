tasklist /fi "ImageName eq GitHubDesktop.exe" /fo csv 2>NUL | find /I "GitHubDesktop.exe">NUL
if "%ERRORLEVEL%"=="0" taskkill /F /IM GitHubDesktop.exe
md "%AppData%\GitHub Desktop-Temp"
md "%AppData%\GitHub Desktop-OtherAccount"

Xcopy "%AppData%\GitHub Desktop" "%AppData%\GitHub Desktop-Temp" /E /O /X /H /K /Y

set "DIR_TO_DELETE=%AppData%\GitHub Desktop"

Xcopy "%AppData%\GitHub Desktop-OtherAccount" "%AppData%\GitHub Desktop" /E /O /X /H /K /Y

set "DIR_TO_DELETE=%AppData%\GitHub Desktop-OtherAccount"

Xcopy "%AppData%\GitHub Desktop-Temp" "%AppData%\GitHub Desktop-OtherAccount" /E /O /X /H /K /Y

set "DIR_TO_DELETE=%AppData%\GitHub Desktop-Temp"

IF EXIST %DIR_TO_DELETE% (
    FOR /D %%p IN ("%DIR_TO_DELETE%\*.*") DO rmdir "%%p" /S /Q
    del %DIR_TO_DELETE%\*.* /F /Q
)