#include <GUIConstantsEx.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("GUI Stil", 260, 100)
	Local $idBtn_Style = GUICtrlCreateButton("Setzt den Stil", 45, 50, 150, 20)

	Local $aGUIStyle = GUIGetStyle($hGUI) ; Vorsicht: Der Status ändert sich nach dem Öffnen

	GUISetState(@SW_SHOW)

	Local $bNewStyle = False, $idMsg
	While 1
		$idMsg = GUIGetMsg()
		Switch $idMsg
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $idBtn_Style
				If Not $bNewStyle Then
					GUISetStyle(BitOR($WS_POPUPWINDOW, $WS_THICKFRAME), BitOR($WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))
					GUICtrlSetData($idBtn_Style, 'Stil zurücksetzen')
					$bNewStyle = True
				Else
					GUISetStyle($aGUIStyle[0], $aGUIStyle[1])
					GUICtrlSetData($idBtn_Style, 'Setzt den Stil')
					$bNewStyle = False
				EndIf
			Case Else
		EndSwitch
	WEnd

	GUIDelete($hGUI)
EndFunc   ;==>Example
