; == Beispiel 2 Skript unter Verwendung des Report Notepad-Fensters (5)

; ermöglicht die Ausführung mit dem alten Notepad-Verhalten in Windows 11
#RequireAdmin

#include <Debug.au3>

_DebugSetup("Check Excel", True, 5) ; Bericht Notepad-Fenster
For $i = 1 To 4
	WinActivate("Microsoft Excel")
	; ; mit Excel interagieren
	Send("{Down}")
	_DebugOut("Moved Mouse Down") ; zwingt das Debug-Notepadfenster, die Kontrolle zu übernehmen
Next
