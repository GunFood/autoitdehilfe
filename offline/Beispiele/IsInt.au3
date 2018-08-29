#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $bIsInt1 = IsInt(-12345) ;gibt 1 zurück
	Local $bIsInt2 = IsInt(3.0000) ;gibt 1 zurück
	Local $bIsInt3 = IsInt(7.5 - 4.5) ;gibt 1 zurück, weil die Berechnung Integer 3 ergibt
	Local $bIsInt4 = IsInt(4.5) ; gibt 0 zurück, weil der Wert eine Zahl ist aber kein Integer.
	Local $bIsInt5 = IsInt("5432") ;gibt 0 zurück, weil es ein String ist

	MsgBox($MB_SYSTEMMODAL, "", "IsInt: " & @CRLF & _
			$bIsInt1 & @CRLF & $bIsInt2 & @CRLF & $bIsInt3 & @CRLF & $bIsInt4 & @CRLF & $bIsInt5)
EndFunc   ;==>Example
