#include <GUIConstantsEx.au3>

GUICreate("Meine GUI Icons", 250, 250)

$icon = GUICtrlCreateIcon("shell32.dll", 10, 20, 20)
$n2 = GUICtrlCreateIcon("shell32.dll", 7, 80, 20, 32, 32)
GUISetState()

; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
While 1
	$msg = GUIGetMsg()

	If $msg = $GUI_EVENT_CLOSE Then ExitLoop
WEnd
GUIDelete()
