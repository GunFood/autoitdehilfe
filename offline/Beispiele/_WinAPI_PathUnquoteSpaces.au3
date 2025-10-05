#include <WinAPIReg.au3>
#include <WinAPIShPath.au3>

Local $sPath = _WinAPI_AssocQueryString('.txt', $ASSOCSTR_COMMAND)

ConsoleWrite('Befehl: ' & $sPath & @CRLF)
ConsoleWrite('Pfad: ' & _WinAPI_PathUnquoteSpaces(_WinAPI_PathRemoveArgs($sPath)) & @CRLF)
ConsoleWrite('Argumente: ' & _WinAPI_PathGetArgs($sPath) & @CRLF)
