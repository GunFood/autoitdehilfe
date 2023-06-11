#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Ermittelt den Klassennamen (classlist) des Editorfenster durch die Verwendung des von WinWait zurückgegebenen Handles.
	Local $sClassList = WinGetClassList($hWnd)

	; Zeigt den Klassennamen an.
	MsgBox($MB_SYSTEMMODAL, "", $sClassList)

	; Schließt das Editorfenster durch die Verwendung des von WinWait zurückgegebenen Handles.
	WinClose($hWnd)
EndFunc   ;==>Example
