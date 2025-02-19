Set WshShell = WScript.CreateObject("WScript.Shell")

' Путь к вашему батнику
batFile = "C:\ProgramData\Microsoft\Settings\Accounts\MicrosoftAccount\Main.bat"

' Создаем скрытое окно
WshShell.Run batFile, 0, False

' Объяснение:
' WScript.CreateObject("WScript.Shell") - создает объект WshShell, который позволяет нам взаимодействовать с оболочкой Windows.
' batFile = "C:\path\to\your\script.bat" -  замените "C:\path\to\your\script.bat" на фактический путь к вашему .bat файлу.  Обязательно используйте полные пути.
' WshShell.Run batFile, 0, False -  запускает .bat файл.
'   - batFile: путь к bat файлу.
'   - 0:  Аргумент, определяющий  окно.  0 означает "скрытое" (окно не отображается).
'   - False:  Указывает, что скрипт VBS будет продолжать выполнение, пока не завершится .bat файл.  Если установить в True, скрипт VBS остановится и будет ждать завершения .bat.  В большинстве случаев для скрытного запуска лучше использовать False.
