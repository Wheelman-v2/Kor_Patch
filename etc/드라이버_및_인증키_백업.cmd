@echo off
:: ������ ���� Ȯ��
:: net session ��ɾ ����Ͽ� ������ ���� ���� Ȯ��
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo   [91m�� ��ġ ������ ������ �������� �����ؾ� �մϴ�.[0m
    echo.
    pause
    exit /b
)

REM ����ڿ��� ������ ����
echo [97m
echo  �۾��� �����ϼ���:
echo.	
echo  1. ����ϱ�
echo  2. �����ϱ�
echo  3. ��ǰ ���� Ȯ�� �ϱ�
echo.
set /p choice=" �Է� (1, 2, 3): "[0m

REM ������ �ɼǿ� ���� �۾� ����
if "%choice%"=="1" goto backup
if "%choice%"=="2" goto restore
if "%choice%"=="3" goto lisence

REM �߸��� �Է� ó��
echo �߸��� �����Դϴ�. 1 �Ǵ� 2 �Ǵ� 3�� �Է��Ͻʽÿ�.
pause
exit /b



:backup
cls
rundll32.exe pnpclean.dll,RunDLL_PnpClean /DRIVERS /MAXCLEAN
echo.
echo  [96m1. ��ġ ����̹��� ��⸦ �����߽��ϴ�.[0m
echo.
echo  [96m2. ��ġ ����̹��� ����մϴ�.[0m

REM ��ġ ����̹� ���. �ش� ������ ������ ���� �ڵ� ����
if not exist "C:\Backup\Drivers" mkdir "C:\Backup\Drivers"
Dism.exe /Online /Export-Driver /Destination:C:\Backup\Drivers
timeout /t 2 /nobreak>nul

cls
echo.
echo.
echo. [96m3. ������ �������� [93m"���̼��� ����"[96m[96m�� ������ �����ϴ�.[0m
echo.
echo     Windows Script Host â���� [93m"��ǰ Ű ä��:"[0m �κи� Ȯ���Ͻø� �˴ϴ�.
echo.

REM ��ǰ Ű�� �ڼ��� ������ �ؽ�Ʈ ���Ϸ� ����
slmgr.vbs /dlv

cls
setlocal enabledelayedexpansion
REM ������Ʈ�� �� ���� �� ����
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform" /v BackupProductKeyDefault > temp.txt

REM temp.txt���� REG_SZ ���� ����
set "value="

REM findstr�� ����Ͽ� REG_SZ�� ���Ե� �� ã��
for /f "tokens=*" %%a in ('findstr /c:"REG_SZ" temp.txt') do (
    REM REG_SZ ������ ���� �� ����
    set "line=%%a"
    REM BackupProductKeyDefault, REG_SZ �� ������ �����Ͽ� ���� ���� ����
    set "line=!line:BackupProductKeyDefault=!"
    set "line=!line:REG_SZ =!"
    REM ��� ���� ������ �����
    set "value=!line!"

    REM ���� ����
    for /f "tokens=* delims= " %%b in ("!line!") do set "value=%%b"
)

REM ����� C:\Backup\����Ű.txt ���Ϸ� ����
if defined value (
    echo %value% > C:\Backup\����Ű.txt
) else (
    echo REG_SZ ���� �����ϴ�. > C:\Backup\����Ű.txt
)

REM �ӽ� ���� ����
del temp.txt

timeout /t 1 /nobreak>nul
echo.
echo.
echo. [96m4. OEM:DM ���� ����� ���� ����Ű�� �����ϰ�, Volume:MAK ���� ����� ���� "2.0" ������ C:\Backup ������ �����߽��ϴ�.[0m
echo.
if defined value (
    echo  ����Ű: %value%
    echo  [93m(����Ű�� C:\Backup ������ "����Ű.txt"�� ����ƽ��ϴ�.^)[0m
    echo  [93m(OEM:DM�� ������ �缳ġ �� ���ͳݸ� �����ص� �ڵ� �����ȴٰ� �մϴٸ� Ȥ�� �� ��Ȳ�� ����Ͽ� ����Ű�� ����߽��ϴ�.^)[0m
) else (
    echo REG_SZ ���� �����ϴ�.
)

setlocal

REM �ҽ� �� ��� ��� ����
set "source=C:\WINDOWS\System32\spp\store\2.0"
set "destination=C:\Backup\2.0"

REM ��� ��ΰ� ������ ����
if not exist "%destination%" (
    mkdir "%destination%"
)

REM ������ ����
xcopy "%source%" "%destination%" /e /i /y /q >nul 2>&1
REM ���� �Ϸ� �޽��� ���
echo.
echo  2.0 ������ ����Ǿ����ϴ�.
echo.
echo.
echo.
echo  [92m�� ���� ��� ����� �Ϸ� �Ǿ����� C:\Backup ������ USB�޸𸮿� ������ �� ������� �缳ġ �Ͻʽÿ�.[0m
echo  [92m�� Ȥ�� �� ������ ���ؼ� �ش� ����(C:\Backup)�� �� Ȯ���� ���ñ� �ٶ��ϴ�.[0m
echo  [92m�� �� ������ ����Կ� �־ �߸��� �κ��� �������� ������� å���̸�, �����ڿ��Դ� å���� ���� �� ������ �˸��ϴ�.[0m
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo  ��� �غ� �Ǿ��ٸ� ���⼭ �ƹ� Ű�� ������ 3�� �� ��ǻ�Ͱ� ����Ǹ� ���̿����� �����մϴ�.[0m
echo  (���̿������� Boot �޴����� USB �޸𸮸� Boot1������ �����ϰ� �����ϰ� �����ϼ���.)
set /p dummy=">"
shutdown /fw /r /t 3
goto end


:restore
cls
echo.
echo  [96m��� �� "Backup" ������ �ִ� ����̺긦 �̸� �Է��� ������ �ڵ����� ������ �ϰ� �Ǵ� �� ����̺���� �����ñ� �ٶ��ϴ�.[0m
echo [97m
set /p Drive="  Backup ������ �ִ� ����̺긦 �Է��ϼ���. (�� C, D, E): "[0m
echo.
echo.
echo  [93m�� OEM:DM�� ��� ��ǰ ������ �Ǿ����� Ȯ���ϰ� ��ǰ ������ �Ǿ��ٸ� ���� �۾��� ���� �Ͻ� �� ������ ������ �� �Ǿ��ٸ� ����Ű�� �ִ� �۾��� �Ͻñ� �ٶ��ϴ�.[0m
slmgr /xpr

REM ����ڿ��� ������ ����
cls
echo [97m
echo  �۾��� �����ϼ���:
echo.	
echo  1. OEM:DM ����� ����Ű �����ϱ�
echo  2. Volume:MAK ���� ���� �����ϱ�
echo  3. ����
echo.
set /p choice=" �Է� (1 �Ǵ� 2 �Ǵ� 3): "[0m

REM ������ �ɼǿ� ���� �۾� ����
if "%choice%"=="1" goto DM
if "%choice%"=="2" goto MAK
if "%choice%"=="3" goto end

REM �߸��� �Է� ó��
echo �߸��� �����Դϴ�. 1 �Ǵ� 2�� �Է��Ͻʽÿ�.

:DM
REM ����Ű�� ����� ���� ��� ����
set "keyFile=%Drive%:\Backup\����Ű.txt"

REM ���Ͽ��� ����Ű �о����
for /f "usebackq delims=" %%A in ("%keyFile%") do set "Key=%%A"
echo.
echo.
echo  [96m������ ����Ű�� ������ �����ϴ�.[0m
echo  %Key%
echo.

REM ����� ���� �޽����� �Բ� ���
echo  [93m����Ű�� �´ٸ� Enter Ű�� ���� ��� �����Ͻʽÿ�...[0m
set /p dummy=">"

REM ����Ű�� ���������� �������� Ȯ��
if "%Key%"=="" (
    echo ����Ű�� �о���� �� �����߽��ϴ�. ������ ��� �ְų� �������� ���� �� �ֽ��ϴ�.
    pause
)

REM ���� �۾� ���� (����Ű�� ����Ͽ� �۾��� �����ϴ� �κ��� �߰��� �� �ֽ��ϴ�)
echo.
echo  [96m����Ű ��� �۾��� �����մϴ�...[0m
echo.
slmgr -ipk %Key%
echo  [93m����Ű ��� �۾��� �������� ����� ����̹��� �����ϰڽ��ϴ�.[0m
timeout /t 3 /nobreak>nul
goto reDrivers

:MAK
echo.
echo [34m
net stop sppsvc
echo [0m
timeout /t 3 /nobreak>nul
setlocal

REM �ҽ� �� ��� ��� ����
set "source=%Drive%:\Backup\2.0"
set "destination=C:\WINDOWS\System32\spp\store\2.0"

REM ��� ��ΰ� ������ ����
if not exist "%destination%" (
    mkdir "%destination%"
)

REM ������ ����
xcopy "%source%" "%destination%" /e /i /y /q >nul 2>&1
REM ���� �Ϸ� �޽��� ���
echo  2.0 ������ ����Ǿ����ϴ�.
echo.
echo [96m
net start sppsvc
echo [0m
slmgr /xpr

REM ����� ���� �޽����� �Բ� ���
echo  [93m��ǰ ������ Ȯ���ϼ̴ٸ� ����� ����̹��� �����ϰڽ��ϴ�.[0m
timeout /t 3 /nobreak>nul
goto reDrivers


:reDrivers
cls
set backupDir=%Drive%:\Backup\Drivers
echo.
echo  [96m����̹� ��� ���� ���: [93m%backupDir%[0m
echo.
timeout /t 3 /nobreak>nul

REM ����� ����̹��� �ִ��� Ȯ��
if not exist "%backupDir%" (
    echo ������ ��ο� ����� ����̹� ������ �����ϴ�.
    pause
    exit /b
)

REM ����̹� ������ ��� ����
set "driverStore=%SystemRoot%\System32\DriverStore\FileRepository"

REM ����̹� ����
echo.
echo  [96m����� ����̹��� ���� ��...[0m
echo.
xcopy "%backupDir%\*" "%driverStore%\" /s /i /y /q >nul 2>&1

REM �ѹ����� ���� ī���� ���� �ʱ�ȭ
setlocal enabledelayedexpansion
set counter=0

REM ����̹� ��ġ
echo  [96m����̹� ��ġ ��...[0m
for /r "%backupDir%" %%f in (*.inf) do (
    set /a counter+=1
    echo  [!counter!] %%f ����̹� ��ġ ��...
    pnputil /add-driver "%%f" /install >nul 2>&1
)

echo  [96m����̹� ������ �Ϸ�Ǿ����ϴ�.[0m
echo.
echo  [93m��� ���� �۾��� �������ϴ�. 
echo  ����̹��� ��� �Ϻ��ϰ� ��ġ�� �� �� �� �����Ƿ� "��ġ ������"���� ����̹��� �� ��ġ�Ǿ����� Ȯ���Ͻð�, ��ġ�� �� �� ����̹��� �������� ��ġ(����̹� ������Ʈ) �Ͻñ� �ٶ��ϴ�.[0m
set /p dummy=">"
exit /b

:lisence
cls
echo.
echo  �� �������� ����Ű: 
powershell -command "(Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform').BackupProductKeyDefault"

slmgr.vbs /xpr



:end
exit /b