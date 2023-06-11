#include <MsgBoxConstants.au3>

Local $sString = "Dies ist ein Satz mit Leerrzeichen." ; Prüft, ob der String nur alphabetische Zeichen enthält.
If StringIsAlpha($sString) Then
	MsgBox($MB_SYSTEMMODAL, "", "Die Variable enthält nur alphabetische Zeichen.")
Else
	MsgBox($MB_SYSTEMMODAL, "", "Die Variable enthält nicht nur alphabetische Zeichen.")
EndIf
