#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $hGUIParent1 = GUICreate("Parent1")
	GUICtrlCreateTab(10, 10)
	Local $iTabItem = GUICtrlCreateTabItem("Tab1")
	GUICtrlCreateTabItem("Tab2")
	GUICtrlCreateTabItem("")

	Local $hGUIParent2 = GUICreate("Parent2", -1, -1, 100, 100)

	GUISwitch($hGUIParent2)
	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd

	GUISwitch($hGUIParent1, $iTabItem)
	GUICtrlCreateButton("OK", 50, 50, 50)
	GUICtrlCreateTabItem("")

	GUISetState(@SW_SHOW, $hGUIParent1)
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	GUIDelete($hGUIParent1)
	GUIDelete($hGUIParent2)
EndFunc   ;==>Example
