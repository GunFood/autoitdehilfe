#include <AutoItConstants.au3>

Example()

Func Example()
	; Zeigt ein Fortschrittsfenster.
	ProgressOn("Fortschritt", "Erhöhung in jeder Sekunde", "0%", -1, -1, BitOR($DLG_NOTONTOP, $DLG_MOVEABLE))

	; Veränderte den Fortschrittswert der Progressbar jede Sekunde.
	For $i = 10 To 100 Step 10
		Sleep(1000)
		ProgressSet($i, $i & "%")
	Next

	; Setzt den "subtext" und "maintext" des Fortschrittsfenster..
	ProgressSet(100, "Erledigt", "Komplett")
	Sleep(5000)

	; Schließt das Fortschrittsfenster.
	ProgressOff()
EndFunc   ;==>Example
