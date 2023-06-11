#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Ermittelt Speicher-Infos des aktuellen laufenden Prozesses
	Local $aMemory = ProcessGetStats()

	; Falls $aMemory ein Array ist, so werden die folgenden Details über den Prozess angezeigt.
	If IsArray($aMemory) Then
		MsgBox($MB_SYSTEMMODAL, "", "WorkingSetSize: " & $aMemory[0] & @CRLF & _
				"PeakWorkingSetSize: " & $aMemory[1])
	Else
		MsgBox($MB_SYSTEMMODAL, "", "Es trat ein Fehler auf.")
	EndIf
EndFunc   ;==>Example
