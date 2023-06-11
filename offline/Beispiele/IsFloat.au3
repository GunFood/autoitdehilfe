#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $bIsFloat1 = IsFloat(3.14159) ; Gibt 1 zurück
	Local $bIsFloat2 = IsFloat(3.000) ; gibt 0 zurück, weil der Wert Integer 3 ist
	Local $bIsFloat3 = IsFloat(1 / 2 - 5) ; Gibt 1 zurück
	Local $bIsFloat4 = IsFloat(1.5e3) ; Gibt 0 zurück, weil 1.5e3 = 1500
	Local $bIsFloat5 = IsFloat("12.345") ; Gibt 0 zurück, weil es ein String ist

	MsgBox($MB_SYSTEMMODAL, "", "IsFloat: " & @CRLF & _
			$bIsFloat1 & @CRLF & $bIsFloat2 & @CRLF & $bIsFloat3 & @CRLF & $bIsFloat4 & @CRLF & $bIsFloat5)
EndFunc   ;==>Example
