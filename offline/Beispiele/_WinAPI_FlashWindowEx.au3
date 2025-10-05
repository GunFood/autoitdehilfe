#include <GUIConstantsEx.au3>
#include <WinAPISysWin.au3>

Example()

Func Example()
	Local $hWnd, $idInp_Flash, $idInp_Timeout, $idBtn_Flash, $iMsg, $iFlashrate, $iTimeoutrate, $bFlashing = False
	$hWnd = GUICreate("_WinAPI_FlashWindowEx", 350, 170, 340, 125)
	$idInp_Flash = GUICtrlCreateInput("20", 130, 68, 161, 21)
	$idInp_Timeout = GUICtrlCreateInput("500", 130, 99, 161, 21)
	GUICtrlCreateLabel("Bitte gib die Blinkrate und die Pause zwischen den Blinkimpulsen ein:", 10, 24, 340, 41)
	GUICtrlCreateLabel("Blinkrate:", 56, 72, 108, 17)
	GUICtrlCreateLabel("Pause (ms)", 56, 104, 114, 17)
	$idBtn_Flash = GUICtrlCreateButton("Blinken!", 113, 136, 125, 25, 0)
	GUISetState(@SW_SHOW)

	While 1
		$iMsg = GUIGetMsg()
		Switch $iMsg
			Case $GUI_EVENT_CLOSE
				Exit
			Case $idBtn_Flash
				If $bFlashing Then
					_WinAPI_FlashWindowEx($hWnd, 0)
					$bFlashing = False
				Else
					$iFlashrate = GUICtrlRead($idInp_Flash)
					$iTimeoutrate = GUICtrlRead($idInp_Timeout)
					_WinAPI_FlashWindowEx($hWnd, 2, $iFlashrate, $iTimeoutrate)
					GUICtrlSetData($idBtn_Flash, "Stoppe das Geblinke!")
					$bFlashing = True
				EndIf
		EndSwitch
	WEnd
EndFunc   ;==>Example
