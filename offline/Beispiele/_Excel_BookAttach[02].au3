#include "Extras\HelpFileInternals.au3"

#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Erstellt das Anwendungsobjekt und öffnet eine Beispielarbeitsmappe
Local $oExcel = _Excel_Open()
If @error <> 0 Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookAttach Beispiel 2", "Fehler beim Erstellen des Excel-Anwendungsobjekts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $oWorkbook = _Excel_BookOpen($oExcel, _Extras_PathFull("_Excel1.xls"))
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookAttach Beispiel 2", "Fehler beim Öffnen der Arbeitsmappe '" & _Extras_PathFull("_Excel1.xls") & "'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf

; Verbindet mit der ersten Arbeitsmappe, bei der der Dateiname übereinstimmt
Local $sWorkbook = "_Excel1.xls"
$oWorkbook = _Excel_BookAttach($sWorkbook, "filename")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookAttach Beispiel 2", "Fehler bei Verbindung zu '" & $sWorkbook & "'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookAttach Beispiel 2", "Suche nach 'filename':" & @CRLF & @CRLF & "Erfolgreich mit Arbeitsmappe '" & $sWorkbook & "' verbunden." & @CRLF & @CRLF & "Wert der Zelle A2: " & $oWorkbook.Activesheet.Range("A2").Value)
