#include <GUIConstantsEx.au3>
#include <WinAPISysWin.au3>

Example()

Func Example()
	Local $hWnd, $iMsg, $idBtnFlash
	$hWnd = GUICreate("_WinAPI_FlashWindow Beispiel", 200, 200)
	$idBtnFlash = GUICtrlCreateButton("Fenster aufblinken lassen", 25, 85, 150, 30)
	GUISetState(@SW_SHOW)
	While 1
		$iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				Exit
			Case $iMsg = $idBtnFlash
				GUISetState(@SW_MINIMIZE)
				Sleep(1000)
				_WinAPI_FlashWindow($hWnd)
				Sleep(6000)
		EndSelect
	WEnd
EndFunc   ;==>Example
