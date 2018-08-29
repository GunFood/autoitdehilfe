#include <GUIConstantsEx.au3>

GUICreate("Mein GUI Button") ; Erstellt eine Dialogbox die zentriert dargestellt wird

Opt("GUICoordMode", 2)
$Button_2 = GUICtrlCreateButton("Button Test", 100, 100, 100)
$Button_3 = GUICtrlCreateButton("Button Test", 1000, 100, 100)

GUISetState() ; Zeigt eine Dialogbox mit 2 Buttons an

; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion ausl&ouml;st
While 1
	$msg = GUIGetMsg()
	Select
		Case $msg = $GUI_EVENT_CLOSE
			ExitLoop
		Case $msg = $Button_2
			MsgBox(0, 'Test', 'Button 2 wurde gedr&uuml;ckt') ; Zeigt, dass Button2 gedr&uuml;ckt wurdet
	EndSelect
WEnd
