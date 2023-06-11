#include <MsgBoxConstants.au3>

; Beispiel wie man eine Objektreferenz über den Klassennamen erhält
; Excel muss gestartet sein, damit das Beispiel funktioniert

Example()

Func Example()
	Local $oExcel = ObjGet("", "Excel.Application") ; Existierendes Excelobjekt referenzieren

	If @error Then
		MsgBox($MB_SYSTEMMODAL, "", "ExcelTest" & @CRLF & "Fehler beim Referenzieren eines bestehenden Excelobjekts. Fehlernummer: " & Hex(@error, 8))
		Return False
	EndIf

	$oExcel.Visible = 1 ; Das Objekt anzeigen
	$oExcel.workbooks.add ; Eine neue Arbeitsmappe hinzufügen
EndFunc   ;==>Example
