#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Ermittelt den Status des Editorfensters durch die Verwendung des von WinWait zurückgegebenen Handles.
	Local $iState = WinGetState($hWnd)

	; Prüft, ob das Editorfenster minimert und zeigt das Ergebnis in einem Nachrichtenfenster an.
	If BitAND($iState, $WIN_STATE_MINIMIZED) Then
		MsgBox($MB_SYSTEMMODAL, "", "Der Editor ist minimiert und der von WinGetState zurückgegebene Status lautet - " & $iState)
	Else
		MsgBox($MB_SYSTEMMODAL, "", "Der Editor ist nicht minimiert und der von WinGetState zurückgegebene Status lautet - " & $iState)
	EndIf

	; Schließt das Editorfenster durch die Verwendung des von WinWait zurückgegebenen Handles.
	WinClose($hWnd)
EndFunc   ;==>Example
