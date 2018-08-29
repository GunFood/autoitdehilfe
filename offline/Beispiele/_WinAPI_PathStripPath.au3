#include <WinAPIShPath.au3>

Local $sPath = 'C:\Documents\Test.txt'

ConsoleWrite('Vorher : ' & $sPath & @CRLF)
ConsoleWrite('Nachher: ' & _WinAPI_PathStripPath($sPath) & @CRLF)
