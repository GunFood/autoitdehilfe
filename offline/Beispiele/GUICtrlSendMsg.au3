#include <GUIConstantsEx.au3>
#include <ProgressConstants.au3>

Example()

Func Example()
	GUICreate("Marquee Forschrittsfenster", 290, 90, -1, -1) ; Ein Beispiel zum starten und stoppen eines "Marquee"-Fortschrittsfensters.
	Local $idProgress = GUICtrlCreateProgress(10, 10, 270, 20, $PBS_MARQUEE)
	Local $idBtn_Start = GUICtrlCreateButton("&Start", 10, 60, 70, 25)
	Local $idBtn_Start2 = GUICtrlCreateButton("&Start 2", 85, 60, 70, 25)
	Local $idBtn_Stop = GUICtrlCreateButton("S&topp", 160, 60, 70, 25)

	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

			Case $idBtn_Start
				GUICtrlSendMsg($idProgress, $PBM_SETMARQUEE, 1, 200) ; Sendet die Nachricht $PBM_SETMARQUEE, wParam mit 1 um das Forschrittsfenster zu starten und lParam mit dem Wert für die Fortschritts-Verzögerung.

			Case $idBtn_Start2
				GUICtrlSendMsg($idProgress, $PBM_SETMARQUEE, 1, 50) ; Sendet die Nachricht $PBM_SETMARQUEE, wParam mit 1 um das Forschrittsfenster zu starten und lParam mit dem Wert für die Fortschritts-Verzögerung.

			Case $idBtn_Stop
				GUICtrlSendMsg($idProgress, $PBM_SETMARQUEE, 0, 0) ; Sendet die Nachricht $PBM_SETMARQUEE und wParam mit 0 um das Forschrittsfenster zu stoppen.

		EndSwitch
	WEnd
EndFunc   ;==>Example
