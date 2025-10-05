#include <GUIConstantsEx.au3>

Example()

Func Example()
	; Erstellt eine GUI mit verschiedenen Controls.
	Local $hGui = GUICreate("Beispiel", 300, 200)

	; Erstellt ein Animationscontrol.
	Local $idAvi_Animation = GUICtrlCreateAvi(@SystemDir & "\shell32.dll", 165, 15, 0, 300)
	Local $idBtn_Start = GUICtrlCreateButton("Start", 60, 150, 85, 25)
	Local $idBtn_Stop = GUICtrlCreateButton("Stop", 160, 150, 85, 25)

	; Zeigt die GUI
	GUISetState(@SW_SHOW, $hGui)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

			Case $idBtn_Start ; Startet die Animation.
				GUICtrlSetState($idAvi_Animation, $GUI_AVISTART)

			Case $idBtn_Stop ; Beendet die Animation.
				GUICtrlSetState($idAvi_Animation, $GUI_AVISTOP)

		EndSwitch
	WEnd

	; Löscht die vorherige GUI und alle Controls.
	GUIDelete($hGui)
EndFunc   ;==>Example
