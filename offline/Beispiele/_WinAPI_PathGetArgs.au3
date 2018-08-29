#include <APIRegConstants.au3>
#include <WinAPIReg.au3>
#include <WinAPIShPath.au3>

Local $sPath = _WinAPI_AssocQueryString('.txt', $ASSOCSTR_COMMAND)
ConsoleWrite('Befehl: ' & $sPath & @CRLF)
ConsoleWrite('Pfad: ' & _WinAPI_PathRemoveArgs($sPath) & @CRLF)
ConsoleWrite('Argumente: ' & _WinAPI_PathGetArgs($sPath) & @CRLF & @CRLF)

$sPath = '1 2 3'
ConsoleWrite('Befehl: ' & $sPath & @CRLF)
ConsoleWrite('Pfad: ' & _WinAPI_PathRemoveArgs($sPath) & @CRLF)
ConsoleWrite('Argumente: ' & _WinAPI_PathGetArgs($sPath) & @CRLF & @CRLF)

$sPath = StringFormat('sehr langer String %260s', "1")
ConsoleWrite('Befehl: ' & $sPath & @CRLF)
ConsoleWrite('Pfad: ' & _WinAPI_PathRemoveArgs($sPath) & @CRLF)
ConsoleWrite('Argumente: "' & _WinAPI_PathGetArgs($sPath) & '"' & @CRLF & @CRLF)
