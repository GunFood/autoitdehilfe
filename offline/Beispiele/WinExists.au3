#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis der Editorfenster erscheint.
	WinWait("[CLASS:Notepad]", "", 10)

	; Prüft, ob das Editorfenster existiert und zeigt das Ergebnis.
	If WinExists("[CLASS:Notepad]") Then
		MsgBox($MB_SYSTEMMODAL, "", "Das Fenster existiert.")
	Else
		MsgBox($MB_SYSTEMMODAL + $MB_ICONERROR, "", "Das Fenster existiert nicht.")
	EndIf

	; Schließt das Editorfenster.
	WinClose("[CLASS:Notepad]", "")
EndFunc   ;==>Example
