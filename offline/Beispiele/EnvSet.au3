#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine Umgebungsvariable namens %MYVAR% und weist dieser einen Wert zu. Wenn eine Umgebungsvariablen zugewiesen oder angewandt wird, so muss diese ohne das Prozentzeichen angegeben werden.
	EnvSet("MYVAR", "Dies ist etwas Text!")

	; Ermittelt die Umgebungsvariable, welcher soeben ein Wert zugewiesen wurde.
	Local $sEnvVar = EnvGet("MYVAR")

	; Zeigt den Wert der Umgebungsvariable $MYVAR%.
	MsgBox($MB_SYSTEMMODAL, "", "Die Umgebungsvariable %MYVAR% hat den Wert: " & @CRLF & @CRLF & $sEnvVar)
EndFunc   ;==>Example