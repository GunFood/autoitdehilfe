#include <Debug.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt ein 1D Array zum anzeigen
	Local $aArray_1D[5] = ["Item 0", "Item 1", "Ein breites Item 2 um die Spaltenanpassung zu zeigen", "Item 3", "Item 4"]

	_DebugArrayDisplay($aArray_1D, "1D Anzeige")

	; Erstellt ein 2D Array zum anzeigen
	Local $aArray_2D[25][15]
	For $i = 0 To UBound($aArray_2D) - 1
		For $j = 0 To UBound($aArray_2D, 2) - 1
			$aArray_2D[$i][$j] = "Item " & StringFormat("%02i", $i) & StringFormat("%02i", $j)
		Next
	Next

	_DebugArrayDisplay($aArray_2D, "2D Anzeige")

	$aArray_2D[5][5] = "Ein breites Item um die Spaltenanpassung zu zeigen"
	_DebugArrayDisplay($aArray_2D, "Angepasste Spalte - eigene Spaltennamens - keine Buttons oder Spalte mit 'Row'", Default, $ARRAYDISPLAY_NOROW, Default, "AA|BB|CC|DD|EE|FF|GG|HH|II|JJ")

	; Verbindet die User-Funktion mit einer Variable um diese als Parameter zu übergeben
	Local $hUserFunction = _UserFunc

	$aArray_2D[5][5] = "rechtsbündige Spaltenausrichtung"
	_DebugArrayDisplay($aArray_2D, "Bereich gesetzt - rechtsbündig - Spaltenbreite kopieren - Benutzerfunktion", "3:7|4:9", $ARRAYDISPLAY_COLALIGNRIGHT, 15, "AA|BB|CC|DD|EE|FF", Default, $hUserFunction)
	_DebugArrayDisplay($aArray_2D, "Bereich gesetzt - vertauscht", "3:7|4:9", $ARRAYDISPLAY_TRANSPOSE, Default, "AA|BB|CC|DD|EE|FF") ; Es ist zu beachten, dass die Spaltennamen nicht getauscht werden

	$aArray_2D[5][5] = "Spaltenausrichtung wird auf linksbündig gesetzt"
	Opt("GUIDataSeparatorChar", "!")
	_DebugArrayDisplay($aArray_2D, "! Trennzeichen der Überschrift", "3:7|4:9", Default, Default, "AA!BB!CC!DD!EE!FF")

	Local $iRet, $iError = 2
	SetError($iError)
	$iRet = _DebugArrayDisplay($aArray_2D, "Fehleranzeige nicht vorhanden", "3:7|4:9", $ARRAYDISPLAY_CHECKERROR)
	MsgBox(0, "_DebugArrayDisplay() Fehler", "Rückgabe ohne interne Msgbox $iret =" & $iRet & " @error=" & $iError)


	; Erstellt eine nicht-Array Variable um einen Fehler zu erzwingen - eine MsgBox wird angezeigt, da $iFlags gesetzt ist
	Local $vVar = 0
	$iRet = _DebugArrayDisplay($vVar, "Keine MsgBox bei einem Fehler")
	$iError = @error
	MsgBox(0, "_DebugArrayDisplay() Fehler", "Rückgabe ohne interne Msgbox $iret =" & $iRet & " @error=" & $iError)

	$iRet = _DebugArrayDisplay($vVar, "MsgBox bei einem Fehler", Default, $ARRAYDISPLAY_VERBOSE)
	$iError = @error
	MsgBox(0, "_DebugArrayDisplay() Fehler", "Rückgabe der internen Msgbox ohne das Beenden zu erzwingen $iret =" & $iRet & " @error=" & $iError)

EndFunc   ;==>Example

; Es ist zu beachten, dass die Benutzerfunktion 2 Parameter haben muss, auch wenn man nicht vorhat beide zu verwenden
Func _UserFunc($aArray_2D, $aSelected)

	; Falls kein Parameter verwendet werden soll, sollte die folgende Zeile eingefügt werden, damit Au3Check keine Warnung ausgibt
	#forceref $aArray_2D

	_DebugArrayDisplay($aSelected, "Ausgewählte Spalten")

EndFunc   ;==>_UserFunc
