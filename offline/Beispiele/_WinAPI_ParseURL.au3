#include <WinAPIShPath.au3>

Local $aData = _WinAPI_ParseURL('http://www.microsoft.com')

ConsoleWrite('Protokoll: ' & $aData[0] & @CRLF)
ConsoleWrite('Suffix:   ' & $aData[1] & @CRLF)
ConsoleWrite('Schema:   ' & $aData[2] & @CRLF)
