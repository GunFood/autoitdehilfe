#include <GuiButton.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

; Es ist zu beachten, dass die Control-ID dieses Buttons NICHT mit GuiCtrlRead gelesen werden kann!

Example()

Func Example()
	Local $hGui, $hBtn, $hBtn2

	$hGui = GUICreate("Buttons", 400, 400)

	$hBtn = _GUICtrlButton_Create($hGui, "Button1", 10, 10, 90, 30)
	_GUICtrlButton_SetShield($hBtn)

	$hBtn2 = _GUICtrlButton_Create($hGui, "Button2", 10, 60, 90, 30, $BS_SPLITBUTTON)
	_GUICtrlButton_SetShield($hBtn2)

	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example
