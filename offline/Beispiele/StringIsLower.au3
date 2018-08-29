#include <MsgBoxConstants.au3>

Local $sString = "kleinbuchstaben" ; Prüft, ob der String nur Kleinbuchstaben enthält.
If StringIsLower($sString) Then
	MsgBox($MB_SYSTEMMODAL, "", "Die Variable enthält nur Kleinbuchstaben")
Else
	MsgBox($MB_SYSTEMMODAL, "", "Die Variable enthält nicht nur Kleinbuchstaben")
EndIf
