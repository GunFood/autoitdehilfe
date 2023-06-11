#include <Security.au3>
#include <SecurityConstants.au3>

Local $tSID = _Security__StringSidToSid($SID_ADMINISTRATORS)
If Not @error Then
	; $tSID enthält die SID Daten für den angegebenen String.
	; ... Restskript hier ...
EndIf
