#include "Extras\HelpFileInternals.au3"

#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Sendet einen Befehl an das Edit-Control des Editors um die Anzahl der Zeilen zuu ermitteln. Dabei wird für den "title" Parameter von ControlCommand das von WinWait zurückgegebenen Handle verwendet.
	Local $iCount = ControlCommand($hWnd, "", ControlGetFocus($hWnd), "GetLineCount", "")

	; Zeigt die Anzahl von Zeilen
	MsgBox($MB_SYSTEMMODAL, "", "Die Anzahl von Zeilen im Editor sind: " & $iCount)

	; Schließt das Editorfenster durch die Verwendung des von WinWait zurückgegebenen Handles.
	WinClose($hWnd)
EndFunc   ;==>Example
