#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Erstellt ein Anwendungs-Objekt oder verbindet zu einer bereits laufenden Excel-Instanz
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_Open Beispiel 1", "Fehler beim erstellen des Excel Anwendungs-Objekt." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_Open Beispiel 1", "Excel Anwnedung wurde erfolgreich geöffnet." & @CRLF & @CRLF & "Schließt _Excel_Close die Anwendung?: " & @extended)
