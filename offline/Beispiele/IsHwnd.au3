#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Startet Notepad
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Notepad-Fenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Testet, ob das Fenster gefunden wurde und zeigt die Ergebnisse.
	If IsHWnd($hWnd) Then
		MsgBox($MB_SYSTEMMODAL, "", "Ist ein gültiger HWND")
	Else
		MsgBox($MB_SYSTEMMODAL, "", "Ist kein gültiger HWND")
	EndIf
EndFunc   ;==>Example
