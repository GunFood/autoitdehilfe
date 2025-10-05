#include <Array.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt ein 1D Array zum anzeigen
	Local $aArray_1D[5] = ["Item 0", "Item 1", "Ein breites Item 2 um die Spaltenanpassung zu zeigen", "Item 3", "Item 4"]

	_ArrayDisplay($aArray_1D, "1D Anzeige")

	; Erstellt ein 2D Array zum anzeigen
	Local $aArray_2D[20][15]
	For $i = 0 To UBound($aArray_2D) - 1
		For $j = 0 To UBound($aArray_2D, 2) - 1
			$aArray_2D[$i][$j] = "Item " & StringFormat("%02i", $i) & StringFormat("%02i", $j)
		Next
	Next

	_ArrayDisplay($aArray_2D, "2D Anzeige")
	_ArrayDisplay($aArray_2D, "2D Anzeige gedreht", Default, 1)

	ReDim $aArray_2D[20][10]
	$aArray_2D[5][5] = "Ein breites Item um die Spaltenanpassung zu zeigen"
	_ArrayDisplay($aArray_2D, "Angepasste Spalte - eigene Spaltennamens - alternative Zeilenfarben - keine 'Zeilen bzw. Spalten", Default, 64, Default, "AA|BB|CC|DD|EE|FF|GG|HH|II|JJ")

	$aArray_2D[5][5] = "rechtsbündige Spaltenausrichtung"
	_ArrayDisplay($aArray_2D, "Bereich gesetzt - rechtsbündig", "3:7|4:9", 2, Default, "AA|BB|CC|DD|EE|FF")

	$aArray_2D[5][5] = "linksbündige Spaltenausrichtung"
	Opt("GUIDataSeparatorChar", "!")
	_ArrayDisplay($aArray_2D, "! Trennzeichen", "3:7|4:9", Default, Default, "AA!BB!CC!DD!EE!FF")

	; Erstellt eine nicht-Array Variable um einen Fehler zu erzwingen - eine MsgBox wird angezeigt, da $iFlags gesetzt ist
	Local $vVar = 0, $iRet, $iError
	$iRet = _ArrayDisplay($vVar, "MsgBox bei einem Fehler")
	$iError = @error
	MsgBox(0, "_ArrayDisplay() Fehler", "Return ohne interne Msgbox $iret =" & $iRet & " @error=" & $iError)

	$iRet = _ArrayDisplay($vVar, "MsgBox bei einem Fehler", Default, 8)
	$iError = @error
	MsgBox(0, "_ArrayDisplay() Fehler", "Return ohne interne Msgbox ohne Erzwingen von Exit $iret =" & $iRet & " @error=" & $iError)

EndFunc   ;==>Example