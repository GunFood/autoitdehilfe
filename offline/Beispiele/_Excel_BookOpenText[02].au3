#include "Extras\HelpFileInternals.au3"

#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Erstellen des Anwendungsobjektes
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox(16, "Excel UDF: _Excel_BookOpenText Beispiel", "Fehler beim Erstellen des Excel Objektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Öffnet eine Textdatei, alle anderen Parameter werden von Excel bestimmt
Local $sTextFile = _Extras_PathFull("_Excel2.txt")
_Excel_BookOpenText($oExcel, $sTextFile, Default, $xlFixedWidth)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookOpenText Beispiel 2", "Fehler beim Öffnen der Datei '" & $sTextFile & "'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookOpenText Beispiel 2", "Workbook '" & $sTextFile & "' wurde erfolgreich geöffnet.")
