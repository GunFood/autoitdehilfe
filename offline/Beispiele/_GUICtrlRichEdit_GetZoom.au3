#include <GUIConstantsEx.au3>
#include <GuiRichEdit.au3>
#include <WindowsStylesConstants.au3>

Global $g_idLbl_Msg

Example()

Func Example()
	Local $hGui = GUICreate("RichEdit: Setzt und ermittelt den Zoom (v" & @AutoItVersion & ")", 460, 350, -1, -1)
	Local $hRichEdit = _GUICtrlRichEdit_Create($hGui, "Dies ist ein Test.", 10, 10, 340, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$g_idLbl_Msg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	Local $idBtn_Next = GUICtrlCreateButton("Weiter", 270, 310, 40, 30)
	GUISetState(@SW_SHOW)

	_GUICtrlRichEdit_AppendText($hRichEdit, @CR & "Dies ist angehängter Text.")

	Local $iMsg, $iStep = 0
	While True
		$iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				_GUICtrlRichEdit_Destroy($hRichEdit) ; wird benötigt, da sonst das Skript abstürzt
;~ 				GUIDelete() 	; ist auch in Ordnung
				Exit
			Case $iMsg = $idBtn_Next
				$iStep += 1
				Switch $iStep
					Case 1
						Report("1. Zoom gesetzt auf " & _GUICtrlRichEdit_GetZoom($hRichEdit) & "%")
					Case 2
						_GUICtrlRichEdit_SetZoom($hRichEdit, 6369) ; Max
						Report("2. Zoom gesetzt auf " & _GUICtrlRichEdit_GetZoom($hRichEdit) & "% Maximum Wert")
					Case 3
						_GUICtrlRichEdit_SetZoom($hRichEdit, 1.57) ; Min
						Report("3. Zoom gesetzt auf " & _GUICtrlRichEdit_GetZoom($hRichEdit) & "% Minimum Wert")
					Case 4
						_GUICtrlRichEdit_SetZoom($hRichEdit, 100)
						Report("4. Zoom wieder zurückgesetzt auf " & _GUICtrlRichEdit_GetZoom($hRichEdit) & "%")
						GUICtrlSetState($idBtn_Next, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Example

Func Report($sMsg)
	GUICtrlSetData($g_idLbl_Msg, $sMsg)
EndFunc   ;==>Report
