#include <AutoItConstants.au3>

Example()

Func Example()
	; Ermittelt das Handle des aktiven Fensters
	Local $hWnd = WinGetHandle("[ACTIVE]")

	; Setzt das aktive Fenster durch die Verwendung des von WinGetHandle zurückgegebenen Handles in den Vordergrund.
	WinSetOnTop($hWnd, "", $WINDOWS_ONTOP)

	; Wartet 2 Sekunden um die Änderung darzustellen
	Sleep(2000)

	; Enfernt den "topmost" Status von dem aktiven Fenster wieder.
	WinSetOnTop($hWnd, "", $WINDOWS_NOONTOP)
EndFunc   ;==>Example
