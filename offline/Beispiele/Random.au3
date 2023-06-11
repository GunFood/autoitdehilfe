#include <MsgBoxConstants.au3>

; Münze werfen
Example()

Func Example()
	If Random(0, 1, 1) Then ; Liefert einen Wert zwischen 0 und 1
		MsgBox($MB_SYSTEMMODAL, "", "Die Seite der Münze lautet: Kopf") ; Wenn der Randominteger 1 ist, wurde Kopf geworfen
	Else
		MsgBox($MB_SYSTEMMODAL, "", "Die Seite der Münze lautet: Zahl") ; Wenn der Randominteger 0 ist, wurde Zahl geworfen
	EndIf
EndFunc   ;==>Example
