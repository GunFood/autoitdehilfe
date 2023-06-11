#include <AutoItConstants.au3>

; Doppelklick auf der aktuellen Mausposition
MouseClick($MOUSE_CLICK_LEFT)
MouseClick($MOUSE_CLICK_LEFT)

; Doppelklick auf der Position x=0 y=500
MouseClick($MOUSE_CLICK_LEFT), 0, 500, 2)

; SICHERERE VERSION eines Doppelklicks auf der Position x=0 y=500. Benutzt die Maustasten-Einstellungen aus der Systemsteuerung
MouseClick($MOUSE_CLICK_PRIMARY, 0, 500, 2)
