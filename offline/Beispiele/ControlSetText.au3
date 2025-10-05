#include "Extras\HelpFileInternals.au3"

#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Schreibt in das Edit-Control des Editors Text. Dabei wird für den "title" Parameter von ControlSetText das von WinWait zurückgegebenen Handle verwendet.
	ControlSend($hWnd, "", ControlGetFocus($hWnd), "Dies ist ein Text")

	; Ermittelt den Text im Edit-Control des Editors. Dabei wird für den "title" Parameter von ControlGetText das von WinWait zurückgegebenen Handle verwendet.
	Local $sText = ControlGetText($hWnd, "", ControlGetFocus($hWnd))

	; Zeigt den Text des Edit-Controls.
	MsgBox($MB_SYSTEMMODAL, "", "Der Test in  " & ControlGetFocus($hWnd) & " lautet: " & $sText)

	; Schließt das Editorfenster durch die Verwendung des von WinWait zurückgegebenen Handles.
	WinClose($hWnd)
EndFunc   ;==>Example
