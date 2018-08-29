#include <WinAPIFiles.au3>

Local Const $sFile = @ScriptFullPath

ConsoleWrite('Ort:    ' & $sFile & @CRLF)
ConsoleWrite('Größe:         ' & FileGetSize($sFile) & @CRLF)
ConsoleWrite('Größe auf dem Datenträger: ' & _WinAPI_GetFileSizeOnDisk($sFile) & @CRLF)
