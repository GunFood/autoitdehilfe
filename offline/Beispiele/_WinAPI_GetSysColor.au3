#include <GUIConstantsEx.au3>
#include <WinAPISysWin.au3>
#include <WindowsSysColorConstants.au3>

Example()

Func Example()
	Local $aElements[2] = [$COLOR_ACTIVECAPTION, $COLOR_GRADIENTACTIVECAPTION]
	; Rot und Gelb
	Local $aColors[2] = [255, 65535], $aSaveColors[2]

	GUICreate("Meine GUI", 300, 200)

	$aSaveColors[0] = _WinAPI_GetSysColor($COLOR_ACTIVECAPTION)
	$aSaveColors[1] = _WinAPI_GetSysColor($COLOR_GRADIENTACTIVECAPTION)

	_WinAPI_SetSysColors($aElements, $aColors)

	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd

	GUIDelete()

	_WinAPI_SetSysColors($aElements, $aSaveColors)

	Exit
EndFunc   ;==>Example
