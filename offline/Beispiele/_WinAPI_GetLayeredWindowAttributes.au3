#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <WinAPISysWin.au3>
#include <WindowsStylesConstants.au3>

Local $hGui = GUICreate("Trans", 300, 400, -1, -1, -1, $WS_EX_LAYERED)
GUICtrlCreateLabel("Dies ist ein Text auf einem transparenten mehrlagigen GUI", 10, 10, 200, 40, -1, $Gui_WS_EX_PARENTDRAG)
GUICtrlSetTip(-1, "Klicke Label um mehrlagiges Fenster zu ziehen")
Local $idBtn_LayButt = GUICtrlCreateButton("Button", 10, 40, 40)
GUISetBkColor(0xABCDEF)
_WinAPI_SetLayeredWindowAttributes($hGui, 0x010101)
GUISetState(@SW_SHOW)

Local $hGuicontrol = GUICreate("ControlGUI", 300, 400, 100, 100)
Local $idChk_CheckTrans = GUICtrlCreateCheckbox("Transparente Farbe 0xABCDEF (markiert) oder 0x010101", 10, 10)
Local $idChk_CheckBorder = GUICtrlCreateCheckbox("POPUP-Stil", 10, 30)
GUICtrlCreateLabel("Transparenz für mehrlagiges GUI", 10, 50)
Local $idSB_SlTrans = GUICtrlCreateSlider(10, 70, 200, 30)
GUICtrlSetLimit($idSB_SlTrans, 255, 0)
GUICtrlSetData(-1, 255)
GUISetState(@SW_SHOW)

While 1
	Local $aExtMsg = GUIGetMsg(1)
	Local $iMsg = $aExtMsg[0]
	Switch $aExtMsg[1]
		Case $hGuicontrol
			Select
				Case $iMsg = $Gui_EVENT_CLOSE
					Exit
				Case $iMsg = $idChk_CheckTrans Or $iMsg = $idSB_SlTrans

					; Ändert Attribute der transparenten Farbe und Fenstertransparenz

					If BitAND(GUICtrlRead($idChk_CheckTrans), $Gui_CHECKED) = $Gui_CHECKED Then
						_WinAPI_SetLayeredWindowAttributes($hGui, 0xABCDEF, GUICtrlRead($idSB_SlTrans))
					Else
						_WinAPI_SetLayeredWindowAttributes($hGui, 0x010101, GUICtrlRead($idSB_SlTrans))
					EndIf

				Case $iMsg = $idChk_CheckBorder
					If BitAND(GUICtrlRead($idChk_CheckBorder), $Gui_CHECKED) = $Gui_CHECKED Then
						GUISetStyle($WS_POPUP, -1, $hGui)
					Else
						GUISetStyle($Gui_SS_DEFAULT_GUI, -1, $hGui)
					EndIf
			EndSelect
		Case $hGui
			Select
				Case $iMsg = $idBtn_LayButt
					Local $transcolor, $alpha
					Local $info = _WinAPI_GetLayeredWindowAttributes($hGui, $transcolor, $alpha)
					MsgBox($MB_SYSTEMMODAL, 'Mehrlagiges GUI', "Button auf mehrlagigem Fenster geklickt" & @CRLF & _
							"Informationen über dieses Fenster: " & @CRLF & _
							"Transparente Farbe: " & $transcolor & @CRLF & _
							"Alpha Wert: " & $alpha & @CRLF & _
							"LWA_COLORKEY: " & (BitAND($info, $LWA_COLORKEY) = $LWA_COLORKEY) & @CRLF & _
							"LWA_ALPHA: " & (BitAND($info, $LWA_ALPHA) = $LWA_ALPHA))
				Case $iMsg = $Gui_EVENT_CLOSE
					Exit MsgBox($MB_SYSTEMMODAL, '', "Schließen des mehrlagigen GUI")
			EndSelect
	EndSwitch
WEnd
