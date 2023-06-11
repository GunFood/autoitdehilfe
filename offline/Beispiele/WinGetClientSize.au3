#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Ermittelt die Größe des Clientbereichs des Editorfensters durch die Verwendung des von WinWait zurückgegebenen Handles.
	Local $aClientSize = WinGetClientSize($hWnd)

	; Zeigt die Höhe und Breite des Clientbereichs an.
	MsgBox($MB_SYSTEMMODAL, "", "Width: " & $aClientSize[0] & @CRLF & "Height: " & $aClientSize[1])

	; Schließt das Editorfenster durch die Verwendung des von WinWait zurückgegebenen Handles.
	WinClose($hWnd)
EndFunc   ;==>Example
