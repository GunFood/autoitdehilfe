#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Example()

Func Example()

	GUICreate("Gui Stil", 260, 100)
	Local $idButton = GUICtrlCreateButton("Setzt den Stil", 45, 50, 150, 20)
	GUISetState(@SW_SHOW)

	Local $bNewStyle = False, $idMsg
	While 1
		$idMsg = GUIGetMsg()
		Switch $idMsg
			Case $GUI_EVENT_CLOSE
				Exit
			Case $idButton
				If Not $bNewStyle Then
					GUISetStyle(BitOR($WS_CAPTION, $WS_POPUPWINDOW, $WS_THICKFRAME), BitOR($WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))
					GUICtrlSetData($idButton, 'Stil zurücksetzen')
					$bNewStyle = True
				Else
					GUISetStyle(BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU), 0)
					GUICtrlSetData($idButton, 'Setzt den Stil')
					$bNewStyle = False
				EndIf
			Case Else
		EndSwitch
	WEnd

	GUIDelete()
EndFunc   ;==>Example
