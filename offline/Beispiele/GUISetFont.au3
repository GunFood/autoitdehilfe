#include <FontConstants.au3>
#include <GUIConstantsEx.au3>

Example()

Func Example()
	GUICreate("Meine GUI mit der Standard Schriftart") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	Local $sFont = "Comic Sans MS"
	GUISetFont(9, $FW_NORMAL, $GUI_FONTUNDER, $sFont) ; ; Schrift wird unterstrichen
	GUICtrlCreateLabel("Unterschrichenes Label", 10, 20)

	GUISetFont(9, $FW_NORMAL, $GUI_FONTITALIC, $sFont) ; Schrift wird kursiv geschrieben
	GUICtrlCreateLabel("Kursives Label", 10, 40)

	GUISetFont(9, $FW_NORMAL, $GUI_FONTSTRIKE, $sFont) ; Schrift wird durchgestrichen
	GUICtrlCreateLabel("Durchgestrichenes Label", 10, 60)

	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd

	GUIDelete()
EndFunc   ;==>Example
