#include <Security.au3>
#include <SecurityConstants.au3>

Local $aArrayOfData = _Security__LookupAccountSid($SID_ALL_SERVICES)

; SID Daten ausgeben, sollte es keinen Error geben:
If IsArray($aArrayOfData) Then
	ConsoleWrite("Account Name = " & $aArrayOfData[0] & @CRLF)
	ConsoleWrite("Domain Name = " & $aArrayOfData[1] & @CRLF)
	ConsoleWrite("SID Typ = " & _Security__SidTypeStr($aArrayOfData[2]) & @CRLF)
EndIf
