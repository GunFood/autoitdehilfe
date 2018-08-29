#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Opt('MustDeclareVars', 1)

Example()

Func Example()
	Local $title, $input, $updown, $msg

	$title = "Meine GUI mit UpDown"
	GUICreate($title, -1, -1, -1, -1, $WS_SIZEBOX)

	$input = GUICtrlCreateInput("2", 10, 10, 50, 20)
	$updown = GUICtrlCreateUpdown($input)

	; Versuch das Eingabesteuerelement in der Gr&ouml;&szlig;e zu ver&auml;ndern
	GUICtrlSetPos($input, 10, 10, 50, 20)

	GUISetState()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		$msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd

EndFunc   ;==>Example
