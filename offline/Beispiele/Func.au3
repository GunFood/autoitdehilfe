#include <Date.au3>
#include <Math.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Beispielskript mit drei benutzerdefinierten Funktionen
	; Beachten sie die Nutzung von Variablen, ByRef und Return

	Local $iFoo = 2
	Local $iBar = 5
	MsgBox($MB_SYSTEMMODAL, "", "Heute ist der " & Today() & @CRLF & "$iFoo hat den Wert " & $iFoo)
	Swap($iFoo, $iBar)
	MsgBox($MB_SYSTEMMODAL, "", "Nach dem Tausch von $iFoo und $iBar" & @CRLF & "enthält $iFoo jetzt " & $iFoo)
	MsgBox($MB_SYSTEMMODAL, "", "Zum Schluss" & @CRLF & "Der größere Wert von 3 und 4 ist " & _Max(3, 4))
EndFunc   ;==>Example

Func Swap(ByRef $vVar1, ByRef $vVar2) ; Vertauscht den Inhalt zweier Variablen
	Local $vTemp = $vVar1
	$vVar1 = $vVar2
	$vVar2 = $vTemp
EndFunc   ;==>Swap

Func Today() ; Gibt das aktuelle Datum in der Form Tag.Monat.Jahr zurück.
	Return (@MDAY & "." & @MON & "." & @YEAR)
EndFunc   ;==>Today
