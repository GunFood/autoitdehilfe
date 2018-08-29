#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Startet Notepad
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Notepad-Fenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Ermittelt die Position und Größe des Notepad-Fensters durch Übergabe des Handles an WinGetPos.
	Local $aPos = WinGetPos($hWnd)

	; Prüft, ob die Variable ein Array ist.
	If IsArray($aPos) Then
		MsgBox($MB_SYSTEMMODAL, "Erfolg", "Fensterhöhe: " & $aPos[3])
	Else
		MsgBox($MB_SYSTEMMODAL, "Fehler", "Es trat ein Fehler auf.")
	EndIf

	; Schließt das Editor-Fenster mit Hilfe eines Handles, zurückgegeben durch WinWait.
	WinClose($hWnd)
EndFunc   ;==>Example
