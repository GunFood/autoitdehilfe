#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Erstellt das Anwendungsobjekt und öffnet eine Beispielarbeitsmappe
Local $sWorkbook = @ScriptDir & "\Extras\_Excel1.xls"
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookAttach Beispiel 1", "Fehler beim Erstellen des Excel-Anwendungsobjekts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $oWorkbook = _Excel_BookOpen($oExcel, $sWorkbook)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookAttach Beispiel 1", "Fehler beim Öffnen der Arbeitsmappe '" & $sWorkbook & "'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf

; Verbindet mit der ersten Arbeitsmappe, bei der der Dateipfad übereinstimmt
$oWorkbook = _Excel_BookAttach($sWorkbook)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookAttach Beispiel 1", "Fehler bei Verbindung zu '" & $sWorkbook & "'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookAttach Example 1", "Suche nach 'filepath':" & @CRLF & @CRLF & "Erfolgreich mit Arbeitsmappe '" & $sWorkbook & "' verbunden." & @CRLF & @CRLF & "Wert der Zelle B3: " & $oWorkbook.Activesheet.Range("B3").Value)
