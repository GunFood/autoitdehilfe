#include <MsgBoxConstants.au3>

Local $sString = "Dies ist ein Satz mit Leerrzeichen." ; Prüft, ob der String nur alphanumerische Zeichen enthält.
If StringIsAlNum($sString) Then
	MsgBox($MB_SYSTEMMODAL, "", "Die Variable enthält nur alphanumerische Zeichen.")
Else
	MsgBox($MB_SYSTEMMODAL, "", "Die Variable enthält nicht nur alphanumerische Zeichen.")
EndIf
