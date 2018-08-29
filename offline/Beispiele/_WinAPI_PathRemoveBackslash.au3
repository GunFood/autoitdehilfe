#include <WinAPIShPath.au3>

Local $sPath = 'C:\Documents\'

ConsoleWrite('Vorher : ' & $sPath & @CRLF)
ConsoleWrite('Nachher: ' & _WinAPI_PathRemoveBackslash($sPath) & @CRLF)
