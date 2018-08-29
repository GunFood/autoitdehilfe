#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $gui, $CheckboxesStart, $CheckboxesStop, $CheckAll, $UnCheckAll, $msg

	$gui = GUICreate("Dummy-Control", 200, 850)

	$CheckboxesStart = GUICtrlCreateDummy() ; ==> Merkt sich den Start
	For $i = 0 To 49
		GUICtrlCreateCheckbox("Checkbox " & $i + 1, 0, 0 + ($i * 17))
	Next
	$CheckboxesStop = GUICtrlCreateDummy() ; ==> Merkt sich den Stopp

	$CheckAll = GUICtrlCreateButton("alle markieren", 100, 100)
	$UnCheckAll = GUICtrlCreateButton("alle demarkieren", 100, 130)

	GUISetState(@SW_SHOW)

	While 1
		$msg = GUIGetMsg()

		Switch $msg
			Case $CheckAll
				For $i = $CheckboxesStart To $CheckboxesStop
					GUICtrlSetState($i, $GUI_CHECKED)
				Next
			Case $UnCheckAll
				For $i = $CheckboxesStart To $CheckboxesStop
					GUICtrlSetState($i, $GUI_UNCHECKED)
				Next
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
EndFunc   ;==>Example