#include <WinAPIShPath.au3>

Local $aPath = @ScriptFullPath

ConsoleWrite('Vorher : ' & $aPath & @CRLF)
ConsoleWrite('Nachher: ' & _WinAPI_PathCompactPathEx($aPath, 40) & @CRLF)
