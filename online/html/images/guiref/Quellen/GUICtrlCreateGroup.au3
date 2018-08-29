#include <GUIConstantsEx.au3>

GUICreate("Meine GUI mit der Gruppierfunktion") ; Erzeugt eine Dialogbox, die zentriert angezeigt wird

GUICtrlCreateGroup("Gruppe 2", 210, 70, 90, 120)
$radio_1 = GUICtrlCreateRadio("Radio 4", 230, 90, 60, 20)
$radio_2 = GUICtrlCreateRadio("Radio 5", 230, 120, 60, 20)
$radio_3 = GUICtrlCreateRadio("Radio 6", 230, 150, 60, 20)
GUICtrlCreateGroup("", -99, -99, 1, 1) ; Gruppe schliessen
GUICtrlCreateGroup("Gruppe 1", 90, 70, 90, 120)
$radio_1 = GUICtrlCreateRadio("Radio 1", 110, 90, 60, 20)
$radio_2 = GUICtrlCreateRadio("Radio 2", 110, 120, 60, 20)
$radio_3 = GUICtrlCreateRadio("Radio 3", 110, 150, 60, 20)
GUICtrlCreateGroup("", -99, -99, 1, 1) ; Gruppe schliessen

GUISetState() ; Zeigt eine leere Dialogbox an

; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
While 1
	$msg = GUIGetMsg()

	If $msg = $GUI_EVENT_CLOSE Then ExitLoop
WEnd
