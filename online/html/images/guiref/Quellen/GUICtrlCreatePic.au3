#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

GUICreate("Meine GUI mit Bild", 350, 300, -1, -1, $WS_SIZEBOX + $WS_SYSMENU) ; Erstellt eine Dialogbox die beim anzeigen zentriert angezeigt wird.

$n = GUICtrlCreatePic("C:\Program Files (x86)\AutoIt3\Examples\GUI\mslogo.jpg", 50, 50, 255, 40)

GUISetState()

; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
While 1
	$msg = GUIGetMsg()

	If $msg = $GUI_EVENT_CLOSE Then ExitLoop
WEnd
