#include <MsgBoxConstants.au3>

Local $sString = "Dies ist ein Satz mit Leerrzeichen." ; Prüft, ob der String nur ASCII Zeichen enthält.
If StringIsASCII($sString) Then
	MsgBox($MB_SYSTEMMODAL, "", "Die Variable enthält nur ASCII Zeichen.")
Else
	MsgBox($MB_SYSTEMMODAL, "", "Die Variable enthält nicht nur ASCII Zeichen.")
EndIf
