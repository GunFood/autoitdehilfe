#include <Security.au3>

Local $tSID = _Security__GetAccountSid(@ComputerName)
If Not @error Then
	; In der Struct $tSID stehen die SID Daten des gegebenen Accounts.
	; Überprüfen der SID:
	Local $bValid = _Security__IsValidSid($tSID)
	If $bValid Then
		ConsoleWrite("Die SID ist gültig." & @CRLF)
		; ... Der Rest des Skripts hier hinein ...
	Else
		ConsoleWrite("Die SID ist NICHT gültig!" & @CRLF)
		Exit
	EndIf
EndIf
