@echo off
:: ∞¸∏Æ¿⁄ ±««— »Æ¿Œ
:: net session ∏Ì∑…æÓ∏¶ ªÁøÎ«œø© ∞¸∏Æ¿⁄ ±««— ø©∫Œ »Æ¿Œ
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo   [91m¿Ã πËƒ° ∆ƒ¿œ¿ª ∞¸∏Æ¿⁄ ±««—¿∏∑Œ Ω««‡«ÿæﬂ «’¥œ¥Ÿ.[0m
    echo.
    pause
    exit /b
)

REM ªÁøÎ¿⁄ø°∞‘ º±≈√¡ˆ ¡¶∞¯
echo [97m
echo  ¿€æ˜¿ª º±≈√«œººø‰:
echo.	
echo  1. πÈæ˜«œ±‚
echo  2. ∫πø¯«œ±‚
echo  3. ¡§«∞ ¿Œ¡ı »Æ¿Œ «œ±‚
echo.
set /p choice=" ¿‘∑¬ (1, 2, 3): "[0m

REM º±≈√«— ø…º«ø° µ˚∂Û ¿€æ˜ ºˆ«‡
if "%choice%"=="1" goto backup
if "%choice%"=="2" goto restore
if "%choice%"=="3" goto lisence

REM ¿ﬂ∏¯µ» ¿‘∑¬ √≥∏Æ
echo ¿ﬂ∏¯µ» º±≈√¿‘¥œ¥Ÿ. 1 ∂«¥¬ 2 ∂«¥¬ 3¿ª ¿‘∑¬«œΩ Ω√ø¿.
pause
exit /b



:backup
cls
rundll32.exe pnpclean.dll,RunDLL_PnpClean /DRIVERS /MAXCLEAN
echo.
echo  [96m1. ¿Âƒ° µÂ∂Û¿Ãπˆ¿« ¬Ó≤®±‚∏¶ ¡¶∞≈«ﬂΩ¿¥œ¥Ÿ.[0m
echo.
echo  [96m2. ¿Âƒ° µÂ∂Û¿Ãπˆ∏¶ πÈæ˜«’¥œ¥Ÿ.[0m

REM ¿Âƒ° µÂ∂Û¿Ãπˆ πÈæ˜. «ÿ¥Á ∆˙¥ı∞° æ¯¿∏∏È ªı∑Œ ¿⁄µø ª˝º∫
if not exist "C:\Backup\Drivers" mkdir "C:\Backup\Drivers"
Dism.exe /Online /Export-Driver /Destination:C:\Backup\Drivers
timeout /t 2 /nobreak>nul

cls
echo.
echo.
echo. [96m3. ±Õ«œ¿« ¿©µµøÏ¿« [93m"∂Û¿Ãº±Ω∫ ¿Ø«¸"[96m[96m¥¬ ¥Ÿ¿Ω∞˙ ∞∞Ω¿¥œ¥Ÿ.[0m
echo.
echo     Windows Script Host √¢ø°º≠ [93m"¡¶«∞ ≈∞ √§≥Œ:"[0m ∫Œ∫–∏∏ »Æ¿Œ«œΩ√∏È µÀ¥œ¥Ÿ.
echo.

REM ¡¶«∞ ≈∞¿« ¿⁄ºº«— ¡§∫∏∏¶ ≈ÿΩ∫∆Æ ∆ƒ¿œ∑Œ ¿˙¿Â
slmgr.vbs /dlv

cls
setlocal enabledelayedexpansion
REM ∑π¡ˆΩ∫∆Æ∏Æ ∞™ ƒı∏Æ π◊ ¿˙¿Â
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform" /v BackupProductKeyDefault > temp.txt

REM temp.txtø°º≠ REG_SZ ∞™¿ª √ﬂ√‚
set "value="

REM findstr¿ª ªÁøÎ«œø© REG_SZ∞° ∆˜«‘µ» ¡Ÿ √£±‚
for /f "tokens=*" %%a in ('findstr /c:"REG_SZ" temp.txt') do (
    REM REG_SZ ¿Ã»ƒ¿« Ω«¡¶ ∞™ √ﬂ√‚
    set "line=%%a"
    REM BackupProductKeyDefault, REG_SZ π◊ ∞¯πÈ¿ª ¡¶∞≈«œø© Ω«¡¶ ∞™¿ª √ﬂ√‚
    set "line=!line:BackupProductKeyDefault=!"
    set "line=!line:REG_SZ =!"
    REM ∞·∞˙ ∞™¿Ã ∫Øºˆø° ¿˙¿Âµ 
    set "value=!line!"

    REM ∞¯πÈ ¡¶∞≈
    for /f "tokens=* delims= " %%b in ("!line!") do set "value=%%b"
)

REM ∞·∞˙∏¶ C:\Backup\¿Œ¡ı≈∞.txt ∆ƒ¿œ∑Œ ¿˙¿Â
if defined value (
    echo %value% > C:\Backup\¿Œ¡ı≈∞.txt
) else (
    echo REG_SZ ∞™¿Ã æ¯Ω¿¥œ¥Ÿ. > C:\Backup\¿Œ¡ı≈∞.txt
)

REM ¿”Ω√ ∆ƒ¿œ ªË¡¶
del temp.txt

timeout /t 1 /nobreak>nul
echo.
echo.
echo. [96m4. OEM:DM ¿Œ¡ı πÊΩƒ¿ª ¿ß«ÿ ¿Œ¡ı≈∞∏¶ ∫πªÁ«œ∞Ì, Volume:MAK ¿Œ¡ı πÊΩƒ¿ª ¿ß«ÿ "2.0" ∆˙¥ı∏¶ C:\Backup ∆˙¥ıø° ∫πªÁ«ﬂΩ¿¥œ¥Ÿ.[0m
echo.
if defined value (
    echo  ¿Œ¡ı≈∞: %value%
    echo  [93m(¿Œ¡ı≈∞¥¬ C:\Backup ∆˙¥ıø° "¿Œ¡ı≈∞.txt"∑Œ ¿˙¿Âµ∆Ω¿¥œ¥Ÿ.^)[0m
    echo  [93m(OEM:DM¿∫ ¿©µµøÏ ¿Áº≥ƒ° »ƒ ¿Œ≈Õ≥›∏∏ ø¨∞·«ÿµµ ¿⁄µø ¿Œ¡ıµ»¥Ÿ∞Ì «’¥œ¥Ÿ∏∏ »§Ω√ ∏∏¶ ªÛ»≤ø° ¥Î∫Ò«œø© ¿Œ¡ı≈∞∏¶ πÈæ˜«ﬂΩ¿¥œ¥Ÿ.^)[0m
) else (
    echo REG_SZ ∞™¿Ã æ¯Ω¿¥œ¥Ÿ.
)

setlocal

REM º“Ω∫ π◊ ¥ÎªÛ ∞Ê∑Œ º≥¡§
set "source=C:\WINDOWS\System32\spp\store\2.0"
set "destination=C:\Backup\2.0"

REM ¥ÎªÛ ∞Ê∑Œ∞° æ¯¿∏∏È ª˝º∫
if not exist "%destination%" (
    mkdir "%destination%"
)

REM ∆˙¥ı∏¶ ∫πªÁ
xcopy "%source%" "%destination%" /e /i /y /q >nul 2>&1
REM ∫πªÁ øœ∑· ∏ﬁΩ√¡ˆ √‚∑¬
echo.
echo  2.0 ∆˙¥ı∞° ∫πªÁµ«æ˙Ω¿¥œ¥Ÿ.
echo.
echo.
echo.
echo  [92m°ÿ ¿Ã¡¶ ∏µÁ πÈæ˜¿Ã øœ∑· µ«æ˙¿∏¥œ C:\Backup ∆˙¥ı∏¶ USB∏ﬁ∏∏Æø° ¿˙¿Â«— »ƒ ¿©µµøÏ¡Ó∏¶ ¿Áº≥ƒ° «œΩ Ω√ø¿.[0m
echo  [92m°ÿ »§Ω√ ∏∏¶ ø¿∑˘∏¶ ¿ß«ÿº≠ «ÿ¥Á ≥ªøÎ(C:\Backup)¿ª ≤¿ »Æ¿Œ«ÿ ∫∏Ω√±Ê πŸ∂¯¥œ¥Ÿ.[0m
echo  [92m°ÿ ¿Ã ∆ƒ¿œ¿ª ªÁøÎ«‘ø° ¿÷æÓº≠ ¿ﬂ∏¯µ» ∫Œ∫–¿∫ ¿¸¿˚¿∏∑Œ ªÁøÎ¿⁄¿« √•¿”¿Ã∏Á, ¡¶¿€¿⁄ø°∞‘¥¬ √•¿”¿ª π∞¿ª ºˆ æ¯¿Ω¿ª æÀ∏≥¥œ¥Ÿ.[0m
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo  ∏µÁ ¡ÿ∫Ò∞° µ«æ˙¥Ÿ∏È ø©±‚º≠ æ∆π´ ≈∞≥™ ¥©∏£∏È 3√  »ƒ ƒƒ«ª≈Õ∞° ¡æ∑·µ«∏Á πŸ¿Ãø¿Ω∫∑Œ ¡¯¿‘«’¥œ¥Ÿ.[0m
echo  (πŸ¿Ãø¿Ω∫ø°º≠ Boot ∏ﬁ¥∫ø°º≠ USB ∏ﬁ∏∏Æ∏¶ Boot1π¯¿∏∑Œ ¡ˆ¡§«œ∞Ì ¿˙¿Â«œ∞Ì ¡æ∑·«œººø‰.)
set /p dummy=">"
shutdown /fw /r /t 3
goto end


:restore
cls
echo.
echo  [96mπÈæ˜ «— "Backup" ∆˙¥ı∞° ¿÷¥¬ µÂ∂Û¿Ã∫Í∏¶ πÃ∏Æ ¿‘∑¬«ÿ ≥ı¿∏∏È ¿⁄µø¿∏∑Œ ∫πø¯¿ª «œ∞‘ µ«¥œ ≤¿ µÂ∂Û¿Ã∫Í∏Ì¿ª ≥÷¿∏Ω√±Ê πŸ∂¯¥œ¥Ÿ.[0m
echo [97m
set /p Drive="  Backup ∆˙¥ı∞° ¿÷¥¬ µÂ∂Û¿Ã∫Í∏¶ ¿‘∑¬«œººø‰. (øπ C, D, E): "[0m
echo.
echo.
echo  [93m°ÿ OEM:DM¿« ∞ÊøÏ ¡§«∞ ¿Œ¡ı¿Ã µ«æ˙¥¬¡ˆ »Æ¿Œ«œ∞Ì ¡§«∞ ¿Œ¡ı¿Ã µ«æ˙¥Ÿ∏È ¿Œ¡ı ¿€æ˜¿ª µ˚∑Œ «œΩ« ∞‘ æ¯¿∏≥™ ¿Œ¡ı¿Ã æ» µ«æ˙¥Ÿ∏È ¿Œ¡ı≈∞∏¶ ≥÷¥¬ ¿€æ˜¿ª «œΩ√±Ê πŸ∂¯¥œ¥Ÿ.[0m
slmgr /xpr

REM ªÁøÎ¿⁄ø°∞‘ º±≈√¡ˆ ¡¶∞¯
cls
echo [97m
echo  ¿€æ˜¿ª º±≈√«œººø‰:
echo.	
echo  1. OEM:DM πÈæ˜«— ¿Œ¡ı≈∞ ¿˚øÎ«œ±‚
echo  2. Volume:MAK ¿Œ¡ı ∆˙¥ı ∫πø¯«œ±‚
echo  3. ¡æ∑·
echo.
set /p choice=" ¿‘∑¬ (1 ∂«¥¬ 2 ∂«¥¬ 3): "[0m

REM º±≈√«— ø…º«ø° µ˚∂Û ¿€æ˜ ºˆ«‡
if "%choice%"=="1" goto DM
if "%choice%"=="2" goto MAK
if "%choice%"=="3" goto end

REM ¿ﬂ∏¯µ» ¿‘∑¬ √≥∏Æ
echo ¿ﬂ∏¯µ» º±≈√¿‘¥œ¥Ÿ. 1 ∂«¥¬ 2∏¶ ¿‘∑¬«œΩ Ω√ø¿.

:DM
REM ¿Œ¡ı≈∞∞° ¿˙¿Âµ» ∆ƒ¿œ ∞Ê∑Œ º≥¡§
set "keyFile=%Drive%:\Backup\¿Œ¡ı≈∞.txt"

REM ∆ƒ¿œø°º≠ ¿Œ¡ı≈∞ ¿–æÓø¿±‚
for /f "usebackq delims=" %%A in ("%keyFile%") do set "Key=%%A"
echo.
echo.
echo  [96m±Õ«œ¿« ¿Œ¡ı≈∞¥¬ ¥Ÿ¿Ω∞˙ ∞∞Ω¿¥œ¥Ÿ.[0m
echo  %Key%
echo.

REM ªÁøÎ¿⁄ ¡§¿« ∏ﬁΩ√¡ˆøÕ «‘≤≤ ¥Î±‚
echo  [93m¿Œ¡ı≈∞∞° ∏¬¥Ÿ∏È Enter ≈∞∏¶ ¥≠∑Ø ∞Ëº” ¡¯«‡«œΩ Ω√ø¿...[0m
set /p dummy=">"

REM ¿Œ¡ı≈∞∞° º∫∞¯¿˚¿∏∑Œ ¿–«˚¥¬¡ˆ »Æ¿Œ
if "%Key%"=="" (
    echo ¿Œ¡ı≈∞∏¶ ¿–æÓø¿¥¬ µ• Ω«∆–«ﬂΩ¿¥œ¥Ÿ. ∆ƒ¿œ¿Ã ∫ÒæÓ ¿÷∞≈≥™ ¡∏¿Á«œ¡ˆ æ ¿ª ºˆ ¿÷Ω¿¥œ¥Ÿ.
    pause
)

REM øπ¡¶ ¿€æ˜ ºˆ«‡ (¿Œ¡ı≈∞∏¶ ªÁøÎ«œø© ¿€æ˜¿ª ºˆ«‡«œ¥¬ ∫Œ∫–¿ª √ﬂ∞°«“ ºˆ ¿÷Ω¿¥œ¥Ÿ)
echo.
echo  [96m¿Œ¡ı≈∞ µÓ∑œ ¿€æ˜¿ª ºˆ«‡«’¥œ¥Ÿ...[0m
echo.
slmgr -ipk %Key%
echo  [93m¿Œ¡ı≈∞ µÓ∑œ ¿€æ˜¿ª ∏∂√∆¿∏∏Á πÈæ˜µ» µÂ∂Û¿Ãπˆ∏¶ ∫πø¯«œ∞⁄Ω¿¥œ¥Ÿ.[0m
timeout /t 3 /nobreak>nul
goto reDrivers

:MAK
echo.
echo [34m
net stop sppsvc
echo [0m
timeout /t 3 /nobreak>nul
setlocal

REM º“Ω∫ π◊ ¥ÎªÛ ∞Ê∑Œ º≥¡§
set "source=%Drive%:\Backup\2.0"
set "destination=C:\WINDOWS\System32\spp\store\2.0"

REM ¥ÎªÛ ∞Ê∑Œ∞° æ¯¿∏∏È ª˝º∫
if not exist "%destination%" (
    mkdir "%destination%"
)

REM ∆˙¥ı∏¶ ∫πªÁ
xcopy "%source%" "%destination%" /e /i /y /q >nul 2>&1
REM ∫πªÁ øœ∑· ∏ﬁΩ√¡ˆ √‚∑¬
echo  2.0 ∆˙¥ı∞° ∫πªÁµ«æ˙Ω¿¥œ¥Ÿ.
echo.
echo [96m
net start sppsvc
echo [0m
slmgr /xpr

REM ªÁøÎ¿⁄ ¡§¿« ∏ﬁΩ√¡ˆøÕ «‘≤≤ ¥Î±‚
echo  [93m¡§«∞ ¿Œ¡ı¿ª »Æ¿Œ«œºÃ¥Ÿ∏È πÈæ˜«— µÂ∂Û¿Ãπˆ∏¶ ∫πø¯«œ∞⁄Ω¿¥œ¥Ÿ.[0m
timeout /t 3 /nobreak>nul
goto reDrivers


:reDrivers
cls
set backupDir=%Drive%:\Backup\Drivers
echo.
echo  [96mµÂ∂Û¿Ãπˆ πÈæ˜ ∆˙¥ı ∞Ê∑Œ: [93m%backupDir%[0m
echo.
timeout /t 3 /nobreak>nul

REM πÈæ˜µ» µÂ∂Û¿Ãπˆ∞° ¿÷¥¬¡ˆ »Æ¿Œ
if not exist "%backupDir%" (
    echo ¡ˆ¡§µ» ∞Ê∑Œø° πÈæ˜µ» µÂ∂Û¿Ãπˆ ∆˙¥ı∞° æ¯Ω¿¥œ¥Ÿ.
    pause
    exit /b
)

REM µÂ∂Û¿Ãπˆ ∫πªÁ«“ ∞Ê∑Œ º≥¡§
set "driverStore=%SystemRoot%\System32\DriverStore\FileRepository"

REM µÂ∂Û¿Ãπˆ ∫πªÁ
echo.
echo  [96mπÈæ˜µ» µÂ∂Û¿Ãπˆ∏¶ ∫πªÁ ¡ﬂ...[0m
echo.
xcopy "%backupDir%\*" "%driverStore%\" /s /i /y /q >nul 2>&1

REM ≥—πˆ∏µ¿ª ¿ß«— ƒ´øÓ≈Õ ∫Øºˆ √ ±‚»≠
setlocal enabledelayedexpansion
set counter=0

REM µÂ∂Û¿Ãπˆ º≥ƒ°
echo  [96mµÂ∂Û¿Ãπˆ º≥ƒ° ¡ﬂ...[0m
for /r "%backupDir%" %%f in (*.inf) do (
    set /a counter+=1
    echo  [!counter!] %%f µÂ∂Û¿Ãπˆ º≥ƒ° ¡ﬂ...
    pnputil /add-driver "%%f" /install >nul 2>&1
)

echo  [96mµÂ∂Û¿Ãπˆ ∫πø¯¿Ã øœ∑·µ«æ˙Ω¿¥œ¥Ÿ.[0m
echo.
echo  [93m∏µÁ ∫πø¯ ¿€æ˜¿Ã ≥°≥µΩ¿¥œ¥Ÿ. 
echo  µÂ∂Û¿Ãπˆ¿« ∞ÊøÏ øœ∫Æ«œ∞‘ º≥ƒ°∞° æ» µ… ºˆ ¿÷¿∏π«∑Œ "¿Âƒ° ∞¸∏Æ¿⁄"ø°º≠ µÂ∂Û¿Ãπˆ∞° ¿ﬂ º≥ƒ°µ«æ˙¥¬¡ˆ »Æ¿Œ«œΩ√∞Ì, º≥ƒ°∞° æ» µ» µÂ∂Û¿Ãπˆ¥¬ ºˆµø¿∏∑Œ º≥ƒ°(µÂ∂Û¿Ãπˆ æ˜µ•¿Ã∆Æ) «œΩ√±Ê πŸ∂¯¥œ¥Ÿ.[0m
set /p dummy=">"
exit /b

:lisence
cls
echo.
echo  ¿Ã ¿©µµøÏ¿« ¿Œ¡ı≈∞: 
powershell -command "(Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform').BackupProductKeyDefault"

slmgr.vbs /xpr



:end
exit /b