#include <MsgBoxConstants.au3>

Local $sReturn = Example()

; Zeigt den Rückgabewert, @error und @extended Wert.
MsgBox($MB_SYSTEMMODAL, "", "Rückgabewert = " & $sReturn & @CRLF & _
		"Der Wert von @error lautet: " & @error & @CRLF & _
		"Der Wert von @extended lautet: " & @extended)

Func Example()
	Return SetError(3, 10, "Irgendein Rückgabewert") ; Setzt @error auf 3, @extended auf 10 und gibt die Zeichenfolge "Irgendein Rückgabewert" zurück.
EndFunc   ;==>Example
