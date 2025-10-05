#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $iError = 0

	; Weist einer lokalen Variablen eine Struktur mit der Definition eines int zu.
	Local $tSTRUCT1 = DllStructCreate("int")

	; Wenn ein Fehler aufgetreten ist, wird der Fehlercode angezeigt und False zurückgegeben.
	If @error Then
		$iError = @error
		MsgBox(($MB_ICONERROR + $MB_SYSTEMMODAL), Default, "Fehler bei DllStructCreate, Code: " & $iError)
		Return False
	EndIf

	; Weist der Struktur tSTRUCT1 eine lokale Variable zu, unter der Bedingung, dass die Elemente gemäß der neuen Definition abgerufen werden.
	Local $tSTRUCT2 = DllStructCreate("uint", DllStructGetPtr($tSTRUCT1, 1))

	; Wenn ein Fehler aufgetreten ist, wird der Fehlercode angezeigt und False zurückgegeben.
	If @error Then
		$iError = @error
		MsgBox(($MB_ICONERROR + $MB_SYSTEMMODAL), Default, "Fehler bei DllStructCreate, Code: " & $iError)
		Return False
	EndIf

	Local $tSTRUCT3 = DllStructCreate("float", DllStructGetPtr($tSTRUCT1, 1))

	; Wenn ein Fehler aufgetreten ist, wird der Fehlercode angezeigt und False zurückgegeben.
	If @error Then
		$iError = @error
		MsgBox(($MB_ICONERROR + $MB_SYSTEMMODAL), Default, "Fehler bei DllStructCreate, Code: " & $iError)
		Return False
	EndIf

	; Bemerkungen: - Die Strukturen zeigen auf dieselbe Struktur (sie haben denselben Zeiger).
	; Das erste Element kam mit:
	; *tSTRUCT1 Struktur wird ein int sein.
	; *tSTRUCT2 Struktur wird ein unsigned int sein (das Element wurde gecasted von int zu uint).
	; *tSTRUCT3 Struktur wird ein float sein (das Element wurde gecasted von int zu float).
	;
	; -Der Casting-Operator "reinterpret_cast" wird verwendet.

	; Setzt die Daten des ersten Elements (int) in $tSTRUCT1.
	DllStructSetData($tSTRUCT1, 1, -1)

	; Zeigt die verschiedenen Datentypen derselben Daten an.
	MsgBox($MB_SYSTEMMODAL, "", _
			"int: " & DllStructGetData($tSTRUCT1, 1) & @CRLF & _
			"uint: " & DllStructGetData($tSTRUCT2, 1) & @CRLF & _
			"float: " & DllStructGetData($tSTRUCT3, 1))

	; Gibt die von den Strukturen verwendeten Ressourcen frei.
	$tSTRUCT1 = 0
	$tSTRUCT2 = 0
	$tSTRUCT3 = 0
EndFunc   ;==>Example
