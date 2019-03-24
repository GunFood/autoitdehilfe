#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Erzwingt das erstellen einer neuen Excel Anwendung und zeigt Warnmeldungen an
_Excel_Open(Default, Default, Default, Default, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_Open Beispiel 2", "Fehler beim erstellen des Excel Anwendungs-Objekt." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $aProcesses = ProcessList("Excel.exe")
If $aProcesses[0][0] = 1 Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_Open Beispiel 2", "Excel Anwnedung wurde erfolgreich geöffnet." & @CRLF & @CRLF & $aProcesses[0][0] & " Excel-Instanz läuft bereits.")
Else
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_Open Beispiel 2", "Excel Anwnedung wurde erfolgreich geöffnet." & @CRLF & @CRLF & $aProcesses[0][0] & " Excel-Instanz läuft bereits.")
EndIf
