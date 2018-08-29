#include <WinAPIShPath.au3>

Local $sPath = @SystemDir

ConsoleWrite('Vorher : ' & $sPath & @CRLF)
ConsoleWrite('Nachher: ' & _WinAPI_PathUnExpandEnvStrings($sPath) & @CRLF)
