@echo off
:: 관리자 권한 확인
:: net session 명령어를 사용하여 관리자 권한 여부 확인
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo   [91m이 배치 파일을 관리자 권한으로 실행해야 합니다.[0m
    echo.
    pause
    exit /b
)

REM 사용자에게 선택지 제공
echo [97m
echo  작업을 선택하세요:
echo.	
echo  1. 백업하기
echo  2. 복원하기
echo  3. 정품 인증 확인 하기
echo.
set /p choice=" 입력 (1, 2, 3): "[0m

REM 선택한 옵션에 따라 작업 수행
if "%choice%"=="1" goto backup
if "%choice%"=="2" goto restore
if "%choice%"=="3" goto lisence

REM 잘못된 입력 처리
echo 잘못된 선택입니다. 1 또는 2 또는 3을 입력하십시오.
pause
exit /b



:backup
cls
rundll32.exe pnpclean.dll,RunDLL_PnpClean /DRIVERS /MAXCLEAN
echo.
echo  [96m1. 장치 드라이버의 찌꺼기를 제거했습니다.[0m
echo.
echo  [96m2. 장치 드라이버를 백업합니다.[0m

REM 장치 드라이버 백업. 해당 폴더가 없으면 새로 자동 생성
if not exist "C:\Backup\Drivers" mkdir "C:\Backup\Drivers"
Dism.exe /Online /Export-Driver /Destination:C:\Backup\Drivers
timeout /t 2 /nobreak>nul

cls
echo.
echo.
echo. [96m3. 귀하의 윈도우의 [93m"라이선스 유형"[96m[96m은 다음과 같습니다.[0m
echo.
echo     Windows Script Host 창에서 [93m"제품 키 채널:"[0m 부분만 확인하시면 됩니다.
echo.

REM 제품 키의 자세한 정보를 텍스트 파일로 저장
slmgr.vbs /dlv

cls
setlocal enabledelayedexpansion
REM 레지스트리 값 쿼리 및 저장
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform" /v BackupProductKeyDefault > temp.txt

REM temp.txt에서 REG_SZ 값을 추출
set "value="

REM findstr을 사용하여 REG_SZ가 포함된 줄 찾기
for /f "tokens=*" %%a in ('findstr /c:"REG_SZ" temp.txt') do (
    REM REG_SZ 이후의 실제 값 추출
    set "line=%%a"
    REM BackupProductKeyDefault, REG_SZ 및 공백을 제거하여 실제 값을 추출
    set "line=!line:BackupProductKeyDefault=!"
    set "line=!line:REG_SZ =!"
    REM 결과 값이 변수에 저장됨
    set "value=!line!"

    REM 공백 제거
    for /f "tokens=* delims= " %%b in ("!line!") do set "value=%%b"
)

REM 결과를 C:\Backup\인증키.txt 파일로 저장
if defined value (
    echo %value% > C:\Backup\인증키.txt
) else (
    echo REG_SZ 값이 없습니다. > C:\Backup\인증키.txt
)

REM 임시 파일 삭제
del temp.txt

timeout /t 1 /nobreak>nul
echo.
echo.
echo. [96m4. OEM:DM 인증 방식을 위해 인증키를 복사하고, Volume:MAK 인증 방식을 위해 "2.0" 폴더를 C:\Backup 폴더에 복사했습니다.[0m
echo.
if defined value (
    echo  인증키: %value%
    echo  [93m(인증키는 C:\Backup 폴더에 "인증키.txt"로 저장됐습니다.^)[0m
    echo  [93m(OEM:DM은 윈도우 재설치 후 인터넷만 연결해도 자동 인증된다고 합니다만 혹시 모를 상황에 대비하여 인증키를 백업했습니다.^)[0m
) else (
    echo REG_SZ 값이 없습니다.
)

setlocal

REM 소스 및 대상 경로 설정
set "source=C:\WINDOWS\System32\spp\store\2.0"
set "destination=C:\Backup\2.0"

REM 대상 경로가 없으면 생성
if not exist "%destination%" (
    mkdir "%destination%"
)

REM 폴더를 복사
xcopy "%source%" "%destination%" /e /i /y /q >nul 2>&1
REM 복사 완료 메시지 출력
echo.
echo  2.0 폴더가 복사되었습니다.
echo.
echo.
echo.
echo  [92m※ 이제 모든 백업이 완료 되었으니 C:\Backup 폴더를 USB메모리에 저장한 후 윈도우즈를 재설치 하십시오.[0m
echo  [92m※ 혹시 모를 오류를 위해서 해당 내용(C:\Backup)을 꼭 확인해 보시길 바랍니다.[0m
echo  [92m※ 이 파일을 사용함에 있어서 잘못된 부분은 전적으로 사용자의 책임이며, 제작자에게는 책임을 물을 수 없음을 알립니다.[0m
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo  모든 준비가 되었다면 여기서 아무 키나 누르면 3초 후 컴퓨터가 종료되며 바이오스로 진입합니다.[0m
echo  (바이오스에서 Boot 메뉴에서 USB 메모리를 Boot1번으로 지정하고 저장하고 종료하세요.)
set /p dummy=">"
shutdown /fw /r /t 3
goto end


:restore
cls
echo.
echo  [96m백업 한 "Backup" 폴더가 있는 드라이브를 미리 입력해 놓으면 자동으로 복원을 하게 되니 꼭 드라이브명을 넣으시길 바랍니다.[0m
echo [97m
set /p Drive="  Backup 폴더가 있는 드라이브를 입력하세요. (예 C, D, E): "[0m
echo.
echo.
echo  [93m※ OEM:DM의 경우 정품 인증이 되었는지 확인하고 정품 인증이 되었다면 인증 작업을 따로 하실 게 없으나 인증이 안 되었다면 인증키를 넣는 작업을 하시길 바랍니다.[0m
slmgr /xpr

REM 사용자에게 선택지 제공
cls
echo [97m
echo  작업을 선택하세요:
echo.	
echo  1. OEM:DM 백업한 인증키 적용하기
echo  2. Volume:MAK 인증 폴더 복원하기
echo  3. 종료
echo.
set /p choice=" 입력 (1 또는 2 또는 3): "[0m

REM 선택한 옵션에 따라 작업 수행
if "%choice%"=="1" goto DM
if "%choice%"=="2" goto MAK
if "%choice%"=="3" goto end

REM 잘못된 입력 처리
echo 잘못된 선택입니다. 1 또는 2를 입력하십시오.

:DM
REM 인증키가 저장된 파일 경로 설정
set "keyFile=%Drive%:\Backup\인증키.txt"

REM 파일에서 인증키 읽어오기
for /f "usebackq delims=" %%A in ("%keyFile%") do set "Key=%%A"
echo.
echo.
echo  [96m귀하의 인증키는 다음과 같습니다.[0m
echo  %Key%
echo.

REM 사용자 정의 메시지와 함께 대기
echo  [93m인증키가 맞다면 Enter 키를 눌러 계속 진행하십시오...[0m
set /p dummy=">"

REM 인증키가 성공적으로 읽혔는지 확인
if "%Key%"=="" (
    echo 인증키를 읽어오는 데 실패했습니다. 파일이 비어 있거나 존재하지 않을 수 있습니다.
    pause
)

REM 예제 작업 수행 (인증키를 사용하여 작업을 수행하는 부분을 추가할 수 있습니다)
echo.
echo  [96m인증키 등록 작업을 수행합니다...[0m
echo.
slmgr -ipk %Key%
echo  [93m인증키 등록 작업을 마쳤으며 백업된 드라이버를 복원하겠습니다.[0m
timeout /t 3 /nobreak>nul
goto reDrivers

:MAK
echo.
echo [34m
net stop sppsvc
echo [0m
timeout /t 3 /nobreak>nul
setlocal

REM 소스 및 대상 경로 설정
set "source=%Drive%:\Backup\2.0"
set "destination=C:\WINDOWS\System32\spp\store\2.0"

REM 대상 경로가 없으면 생성
if not exist "%destination%" (
    mkdir "%destination%"
)

REM 폴더를 복사
xcopy "%source%" "%destination%" /e /i /y /q >nul 2>&1
REM 복사 완료 메시지 출력
echo  2.0 폴더가 복사되었습니다.
echo.
echo [96m
net start sppsvc
echo [0m
slmgr /xpr

REM 사용자 정의 메시지와 함께 대기
echo  [93m정품 인증을 확인하셨다면 백업한 드라이버를 복원하겠습니다.[0m
timeout /t 3 /nobreak>nul
goto reDrivers


:reDrivers
cls
set backupDir=%Drive%:\Backup\Drivers
echo.
echo  [96m드라이버 백업 폴더 경로: [93m%backupDir%[0m
echo.
timeout /t 3 /nobreak>nul

REM 백업된 드라이버가 있는지 확인
if not exist "%backupDir%" (
    echo 지정된 경로에 백업된 드라이버 폴더가 없습니다.
    pause
    exit /b
)

REM 드라이버 복사할 경로 설정
set "driverStore=%SystemRoot%\System32\DriverStore\FileRepository"

REM 드라이버 복사
echo.
echo  [96m백업된 드라이버를 복사 중...[0m
echo.
xcopy "%backupDir%\*" "%driverStore%\" /s /i /y /q >nul 2>&1

REM 넘버링을 위한 카운터 변수 초기화
setlocal enabledelayedexpansion
set counter=0

REM 드라이버 설치
echo  [96m드라이버 설치 중...[0m
for /r "%backupDir%" %%f in (*.inf) do (
    set /a counter+=1
    echo  [!counter!] %%f 드라이버 설치 중...
    pnputil /add-driver "%%f" /install >nul 2>&1
)

echo  [96m드라이버 복원이 완료되었습니다.[0m
echo.
echo  [93m모든 복원 작업이 끝났습니다. 
echo  드라이버의 경우 완벽하게 설치가 안 될 수 있으므로 "장치 관리자"에서 드라이버가 잘 설치되었는지 확인하시고, 설치가 안 된 드라이버는 수동으로 설치(드라이버 업데이트) 하시길 바랍니다.[0m
echo.
echo  여기에서 아무 키나 누르시면 윈도우를 2초 후에 재부팅 합니다.
set /p dummy=">"
shutdown /r /t 2

:lisence
cls
echo.
echo  이 윈도우의 인증키: 
powershell -command "(Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform').BackupProductKeyDefault"

slmgr.vbs /xpr



:end
exit /b