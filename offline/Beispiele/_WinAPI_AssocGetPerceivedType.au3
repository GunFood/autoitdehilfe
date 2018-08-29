#include <WinAPIReg.au3>

Local $sExt = '.wav'
Local $aData = _WinAPI_AssocGetPerceivedType($sExt)

If IsArray($aData) Then
	ConsoleWrite('(' & $sExt & ')' & @CRLF)
	ConsoleWrite('--------------------' & @CRLF)
	ConsoleWrite('Typ:   ' & $aData[0] & @CRLF)
	ConsoleWrite('Quelle: ' & $aData[1] & @CRLF)
	ConsoleWrite('String: ' & $aData[2] & @CRLF)
EndIf
