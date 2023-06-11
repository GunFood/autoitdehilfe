#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet 2 Sekunden bis das Editorfenster dargestellt wird.
	Sleep(2000)

	; Schließt das Editorfenster durch die Verwendung des Klassennamens (classname) vom Editor.
	If WinClose("[CLASS:Notepad]", "") Then
		MsgBox($MB_SYSTEMMODAL, "", "Fenster geschlossen")
	Else
		MsgBox($MB_SYSTEMMODAL + $MB_ICONERROR, "Fehler", "Fenster nicht gefunden")
	EndIf
EndFunc   ;==>Example
