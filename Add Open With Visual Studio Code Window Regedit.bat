@echo off
if _%1_==_payload_  goto :payload

:getadmin
    echo %~nx0: elevating self
    set vbs=%temp%\getadmin.vbs
    echo Set UAC = CreateObject^("Shell.Application"^)                >> "%vbs%"
    echo UAC.ShellExecute "%~s0", "payload %~sdp0 %*", "", "runas", 1 >> "%vbs%"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
goto :eof

:payload

::ENTER YOUR CODE BELOW::
choice /c AR /M "Add or Remove Open With REG?"
if %errorlevel%==1 goto yes
if %errorlevel%==2 goto no

:yes
SET vsc2Path=C:\Program Files\Microsoft VS Code\Code.exe
SET vs2Path=C:\Program Files (x86)\Common Files\Microsoft Shared\MSEnv\VSLauncher.exe
SET as2Path=C:\Program Files\Android\Android Studio\bin\studio64.exe
SET st2Path=C:\Program Files\Sublime Text 3\sublime_text.exe

rem add it for all file types
@reg add "HKEY_CLASSES_ROOT\*\shell\VSCode"         /t REG_EXPAND_SZ /v "" /d "Open with Code"   /f
@reg add "HKEY_CLASSES_ROOT\*\shell\VSCode"         /t REG_EXPAND_SZ /v "Icon" /d "%vsc2Path%" /f
@reg add "HKEY_CLASSES_ROOT\*\shell\VSCode\command" /t REG_EXPAND_SZ /v "" /d "%vsc2Path% \"%%1\"" /f
@reg add "HKEY_CLASSES_ROOT\*\shell\VS"         /t REG_EXPAND_SZ /v "" /d "Open with Visual Studio"   /f
@reg add "HKEY_CLASSES_ROOT\*\shell\VS"         /t REG_EXPAND_SZ /v "Icon" /d "%vs2Path%" /f
@reg add "HKEY_CLASSES_ROOT\*\shell\VS\command" /t REG_EXPAND_SZ /v "" /d "%vs2Path% \"%%1\"" /f
@reg add "HKEY_CLASSES_ROOT\*\shell\AndroidStudio"         /t REG_EXPAND_SZ /v "" /d "Open with Android Studio"   /f
@reg add "HKEY_CLASSES_ROOT\*\shell\AndroidStudio"         /t REG_EXPAND_SZ /v "Icon" /d "%as2Path%" /f
@reg add "HKEY_CLASSES_ROOT\*\shell\AndroidStudio\command" /t REG_EXPAND_SZ /v "" /d "%as2Path% \"%%1\"" /f
@reg add "HKEY_CLASSES_ROOT\*\shell\SublimeText"         /t REG_EXPAND_SZ /v "" /d "Open with Sublime Text"   /f
@reg add "HKEY_CLASSES_ROOT\*\shell\SublimeText"         /t REG_EXPAND_SZ /v "Icon" /d "%st2Path%" /f
@reg add "HKEY_CLASSES_ROOT\*\shell\SublimeText\command" /t REG_EXPAND_SZ /v "" /d "%st2Path% \"%%1\"" /f

rem add it for folders
@reg add "HKEY_CLASSES_ROOT\Directory\shell\VSCode"         /t REG_EXPAND_SZ /v "" /d "Open with Code"   /f
@reg add "HKEY_CLASSES_ROOT\Directory\shell\VSCode"         /t REG_EXPAND_SZ /v "Icon" /d "%vsc2Path%" /f
@reg add "HKEY_CLASSES_ROOT\Directory\shell\VSCode\command" /t REG_EXPAND_SZ /v "" /d "%vsc2Path% \"%%1\"" /f
@reg add "HKEY_CLASSES_ROOT\Directory\shell\VS"         /t REG_EXPAND_SZ /v "" /d "Open with Visual Studio"   /f
@reg add "HKEY_CLASSES_ROOT\Directory\shell\VS"         /t REG_EXPAND_SZ /v "Icon" /d "%vs2Path%" /f
@reg add "HKEY_CLASSES_ROOT\Directory\shell\VS\command" /t REG_EXPAND_SZ /v "" /d "%vs2Path% \"%%1\"" /f
@reg add "HKEY_CLASSES_ROOT\Directory\shell\AndroidStudio"         /t REG_EXPAND_SZ /v "" /d "Open with Android Studio"   /f
@reg add "HKEY_CLASSES_ROOT\Directory\shell\AndroidStudio"         /t REG_EXPAND_SZ /v "Icon" /d "%as2Path%" /f
@reg add "HKEY_CLASSES_ROOT\Directory\shell\AndroidStudio\command" /t REG_EXPAND_SZ /v "" /d "%as2Path% \"%%1\"" /f
@reg add "HKEY_CLASSES_ROOT\Directory\shell\SublimeText"         /t REG_EXPAND_SZ /v "" /d "Open with Sublime Text"   /f
@reg add "HKEY_CLASSES_ROOT\Directory\shell\SublimeText"         /t REG_EXPAND_SZ /v "Icon" /d "%st2Path%" /f
@reg add "HKEY_CLASSES_ROOT\Directory\shell\SublimeText\command" /t REG_EXPAND_SZ /v "" /d "%st2Path% \"%%1\"" /f

echo.
echo...Script Complete....
echo.

pause
goto :EOF

:no
@reg delete "HKEY_CLASSES_ROOT\*\shell\VSCode"
@reg delete "HKEY_CLASSES_ROOT\*\shell\VSCode\command"
@reg delete "HKEY_CLASSES_ROOT\Directory\shell\VSCode"
@reg delete "HKEY_CLASSES_ROOT\Directory\shell\VSCode\command"
@reg delete "HKEY_CLASSES_ROOT\*\shell\VS"
@reg delete "HKEY_CLASSES_ROOT\*\shell\VS\command"
@reg delete "HKEY_CLASSES_ROOT\Directory\shell\VS"
@reg delete "HKEY_CLASSES_ROOT\Directory\shell\VS\command"
@reg delete "HKEY_CLASSES_ROOT\*\shell\AndroidStudio"
@reg delete "HKEY_CLASSES_ROOT\*\shell\AndroidStudio\command"
@reg delete "HKEY_CLASSES_ROOT\Directory\shell\AndroidStudio"
@reg delete "HKEY_CLASSES_ROOT\Directory\shell\AndroidStudio\command"
@reg delete "HKEY_CLASSES_ROOT\*\shell\SublimeText"
@reg delete "HKEY_CLASSES_ROOT\*\shell\SublimeText\command"
@reg delete "HKEY_CLASSES_ROOT\Directory\shell\SublimeText"
@reg delete "HKEY_CLASSES_ROOT\Directory\shell\SublimeText\command"
::END OF YOUR CODE::

echo.
echo...Script Complete....
echo.

pause
