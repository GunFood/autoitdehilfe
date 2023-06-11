#include <MsgBoxConstants.au3>

; Zählen der offenen Explorerfenster

Local $oShell = ObjCreate("shell.application") ; Anlegen des Windows Shell Objekts
Local $oShellWindows = $oShell.windows() ; Auslesen der Collection offener Explorerfenster

If IsObj($oShellWindows) Then
	Local $sString = "" ; String für die Anzeige

	For $oWnd In $oShellWindows ; Zählen aller existierenden Explorerfenster
		$sString &= $oWnd.LocationName & @CRLF
	Next

	MsgBox($MB_SYSTEMMODAL, "", "Explorerfenster" & @CRLF & "Es existieren folgende Explorerfenster:" & @CRLF & @CRLF & $sString)
EndIf
