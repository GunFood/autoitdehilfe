#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Erstellt das Anwendungsobjekt
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookNew 	Beispiel 1", "Fehler beim Erstellen des Excel-Anwendungsobjekts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Erstellt eine neue Arbeitsmappe mit 2 Arbeitsblättern
_Excel_BookNew($oExcel, 2)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookNew Beispiel 1", "Fehler beim Erstellen der Arbeitsmappe." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookNew Beispiel 1", "Arbeitsmappe wurde erfolgreich mit 2 Arbeitsblättern erstellt.")
