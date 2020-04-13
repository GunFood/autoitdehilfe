#include <GuiConstantsEx.au3>
#include <Misc.au3>

Example()

Func Example()
	; Erstellt eine GUI mit verschiedenen Controls
	Local $hGUI = GUICreate("Beispiel Mouse Trap")

	; Zeigt die GUI
	GUISetState(@SW_SHOW, $hGUI)

	; Setzt die Position des Fensters zurück.
	Local $aCoords = 0

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		$aCoords = WinGetPos($hGUI)
		If Not @error Then
			; Falls kein Fehler auftritt, dann kann der Mauszeiger innerhalb des Fensters bewegt werden.
			_MouseTrap($aCoords[0], $aCoords[1], $aCoords[0] + $aCoords[2], $aCoords[1] + $aCoords[3])
		EndIf
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd

	; Gibt den Mauszeiger wieder frei
	_MouseTrap()
EndFunc   ;==>Example
