#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Ermittelt den Wert der Umgebungsvariable %APPDATA%.
	; Wenn eine Umgebungsvariablen zugewiesen oder angewandt wird, so muss diese ohne das Prozentzeichen angegeben werden.
	Local $sEnvVar = EnvGet("APPDATA")

	; Zeigt den Wert der Umgebungsvariable %APPDATA%.
	MsgBox($MB_SYSTEMMODAL, "", "Die Umgebungsvariable %APPDATA% hat den Wert: " & @CRLF & @CRLF & $sEnvVar) ; Dies gibt den gleichen Wert wie das Makro @AppDataDir zurück.
EndFunc   ;==>Example
