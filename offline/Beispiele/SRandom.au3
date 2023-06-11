#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Setzt den Startwert auf 12.
	SRandom(12)

	; Weist einer lokalen Variablen den Zufallswert basierend auf dem obigen Startwert zu.
	Local $idRandom1 = Random()

	; Es ist zu beachten: Es ergibt sich immer das gleiche Ergebnis wenn der Startwert konstant ist.

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $idRandom1)
EndFunc   ;==>Example
