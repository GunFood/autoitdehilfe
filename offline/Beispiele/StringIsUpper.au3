#include <MsgBoxConstants.au3>

Local $sString = "GROSSBUCHSTABEN" ; Prüft, ob der String nur Großbuchstaben enthält.
If StringIsUpper($sString) Then
	MsgBox($MB_SYSTEMMODAL, "", "Die Variable enthält nur Großbuchstaben")
Else
	MsgBox($MB_SYSTEMMODAL, "", "Die Variable enthält nicht nur Großbuchstaben")
EndIf
