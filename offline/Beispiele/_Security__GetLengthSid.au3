#include <Security.au3>

Local $tSID = _Security__GetAccountSid(@UserName)
If Not @error Then
	; In der Struct $tSID stehen die SID Daten des gegebenen Accounts.
	; Länge der SID prüfen:
	Local $iLength = _Security__GetLengthSid($tSID)
	ConsoleWrite("Die Länge der SID beträgt: " & $iLength & " bytes" & @CRLF)

	; ... Der Rest des Skripts hier hinein ...
EndIf
