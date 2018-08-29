#include <WinAPIFiles.au3>
#include <WinAPIHObj.au3>

Local $sFile = @ScriptFullPath
Local $hFile = _WinAPI_CreateFile(@ScriptFullPath, 2, 0, 6)

ConsoleWrite('Datei:   ' & $sFile & @CRLF)
ConsoleWrite('Handle: ' & $hFile & @CRLF)
ConsoleWrite('Typ:   ' & _WinAPI_GetObjectNameByHandle($hFile) & @CRLF)

_WinAPI_CloseHandle($hFile)
