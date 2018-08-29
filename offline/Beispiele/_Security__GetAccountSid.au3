#include <Security.au3>

Local $tSID = _Security__GetAccountSid(@UserName)
If Not @error Then
	; In der Struct $tSID stehen die SID Daten des gegebenen Accounts.
	; ... Der Rest des Skripts hier hinein ...
EndIf
