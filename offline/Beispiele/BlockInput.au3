#RequireAdmin

#include "Extras\HelpFileInternals.au3"

#include <AutoItConstants.au3>

Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Ruft das Steuerelement ab, das den Tastaturfokus in Notepad hat.
	Local $sEditControl = ControlGetFocus($hWnd)

	; Deaktiviert die Benutzereingaben durch die Maus und Tastatur.
	BlockInput($BI_DISABLE)

	; Tippen hat keine Auswirkung

	; Wartet 2 Sekunden
	Sleep(2000)

	; Sendet die 'F5'-Taste an das Edit-Control des Editors um das Datum und die Uhrzeit anzuzeigen.
	; Das Handle welches durch WinWait zurückgegeben wurde, wird für den "title" Parameter von ControlSend verwendet.
	; Der Befehl „controlSend“ wird auch dann ausgeführt, wenn „BlockInput()“ deaktiviert ist.
	ControlSend($hWnd, "", $sEditControl, "{F5}")

	; Aktiviert die Benutzereingaben durch die Maus und Tastatur.
	BlockInput($BI_ENABLE)

	; Tippen hat keine Auswirkung

	; Wartet 4 Sekunden, um zu prüfen, ob die Eingabe aktiviert ist
	Sleep(4000)

	_NotepadForceClose($hWnd)
EndFunc   ;==>Example
