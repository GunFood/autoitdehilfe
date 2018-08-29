#include <MsgBoxConstants.au3>

Example()

Func Example()
	; E eine Umgebungsvariable namens %PATH%.
	Local $sEnvVar = EnvGet("PATH")

	; Weist der Systemumgebungsvariable namens %PATH% deren eigenen Wert und den Skriptordner zu.
	; Wenn eine Umgebungsvariablen zugewiesen oder angewandt wird, so muss diese ohne das Prozentzeichen angegeben werden.
	EnvSet("PATH", $sEnvVar & ";" & @ScriptDir)

	; Aktualisiert die Betriebssystem-Umgebung.
	EnvUpdate()

	; Ermittelt die Systemumgebungsvariable, welcher soeben ein Wert zugewiesen wurde.
	$sEnvVar = EnvGet("PATH")

	; Zeigt den Wert der Umgebungsvariable $PATH%.
	MsgBox($MB_SYSTEMMODAL, "", "Die Umgebungsvariable %PATH% hat den Wert: " & $sEnvVar)
EndFunc   ;==>Example
