#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Konvertiert -1 in einen Zeigerausdruck.
	Local $pPtr = Ptr(-1)

	; Prüft, ob $pPtr ein gültiger Pointer ist und zeigt das Ergebnis.
	If IsPtr($pPtr) Then
		MsgBox($MB_SYSTEMMODAL, "", "Es ist ein gültiger Pointer")
	Else
		MsgBox($MB_SYSTEMMODAL, "", "Es ist kein gültiger Pointer")
	EndIf
EndFunc   ;==>Example
