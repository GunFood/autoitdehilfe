#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Prüfung, ob $hWnd ein gültiger Zeiger ist. Das Ergebnis wird dargestellt.
	If IsPtr($hWnd) Then
		MsgBox($MB_SYSTEMMODAL, "", "Es ist ein gültiger Zeiger")
	Else
		MsgBox($MB_SYSTEMMODAL, "", "Es ist kein gültiger Zeiger")
	EndIf

	; Schließt das Editorfenster durch die Verwendung des von WinWait zurückgegebenen Handles.
	WinClose($hWnd)
EndFunc   ;==>Example
