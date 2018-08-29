#include <GUIConstantsEx.au3>

Opt('MustDeclareVars', 1)

Example()

Func Example()
	Local $checkCN, $msg
	GUICreate("My GUI Checkbox") ; Erstellt eine Dialogbox die zentriert dargestellt wird

	$checkCN = GUICtrlCreateCheckbox("Checkbox 1", 10, 10, 120, 20)
	$checkCN = GUICtrlCreateCheckbox("Checkbox 2", 10, 30, 120, 20)
	$checkCN = GUICtrlCreateCheckbox("Checkbox 3", 10, 50, 120, 20)

	GUISetState() ; Zeigt eine Dialogbox mit 1 Checkbox an

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion ausl&ouml;st
	While 1
		$msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd
EndFunc   ;==>Example
