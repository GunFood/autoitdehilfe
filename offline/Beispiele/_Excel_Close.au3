#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Erstellen des Anwendungsobjektes
Local $oExcel1 = ObjCreate("Excel.Application")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_Close Beispiel", "Fehler beim Erstellen des ersten Excel-Anwendungsobjekts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Excel-Anwendung öffnen (neue Instanz erzwingen)
Local $oExcel2 = _Excel_Open(Default, Default, Default, Default, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_Close Beispiel", "Fehler beim Anlegen des zweiten Excel-Anwendungsobjekts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Schließen Sie die Excel-Instanz, die nicht mit _Excel_Open geöffnet wurde
; (wird immer noch laufen, weil es nicht von _Excel_Open geöffnet wurde)
_Excel_Close($oExcel1)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_Close Beispiel 1", "Fehler beim Schließen der Excel-Anwendung." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Sleep(2000)
Local $aProcesses = ProcessList("Excel.exe")
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_Close Beispiel 1", "Funktion erfolgreich beendet." & @CRLF & @CRLF & $aProcesses[0][0] & " Excel-Instanz(en) laufen noch.")

; Schließen der mit _Excel_Open geöffneten Excel-Instanz
_Excel_Close($oExcel2)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_Close Beispiel 2", "Fehler beim Schließen der Excel-Anwendung." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Sleep(2000)
$aProcesses = ProcessList("Excel.exe")
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_Close Beispiel 2", "Funktion erfolgreich beendet." & @CRLF & @CRLF & $aProcesses[0][0] & " Excel-Instanz(en) laufen noch.")

; Erzwingen, dass die Excel-Instanz nicht durch _Excel_Open geöffnet wird,
; ohne geöffnete Workbooks zu speichern
_Excel_Close($oExcel1, Default, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_Close Beispiel 3", "Fehler beim Schließen der Excel-Anwendung." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Sleep(2000)
$aProcesses = ProcessList("Excel.exe")
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_Close Beispiel 3", "Funktion erfolgreich beendet." & @CRLF & @CRLF & $aProcesses[0][0] & " Excel-Instanz(en) laufen noch.")
