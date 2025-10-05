#include <GUIConstantsEx.au3>
#include <GuiRichEdit.au3>
#include <WindowsStylesConstants.au3>

Global $g_idLbl_Msg, $g_hRichEdit

Example()

Func Example()
	Local $hGui, $iMsg, $idBtn_Next, $iStep = 0
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$g_hRichEdit = _GUICtrlRichEdit_Create($hGui, "", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$g_idLbl_Msg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$idBtn_Next = GUICtrlCreateButton("Weiter", 270, 310, 40, 30)
	GUISetState(@SW_SHOW)

	_GUICtrlRichEdit_SetText($g_hRichEdit, "Erster Absatz")
	_GUICtrlRichEdit_AppendText($g_hRichEdit, @CR & "Zweiter Absatz")

	While True
		$iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				_GUICtrlRichEdit_Destroy($g_hRichEdit) ; wird benötigt, da sonst das Skript abstürzt
;~ 				GUIDelete() 	; ist auch in Ordnung
				Exit
			Case $iMsg = $idBtn_Next
				$iStep += 1
				Switch $iStep
					Case 1
						Report("1. Standardeinstellungen ")
					Case 2
						_GUICtrlRichEdit_SetRECT($g_hRichEdit, 10, 10, 100, 100)
						Report("2. Einstellungen ")
					Case 3
						_GUICtrlRichEdit_SetRECT($g_hRichEdit)
						Report("3. Einstellungen wieder auf Standard")
						GUICtrlSetState($idBtn_Next, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Example

Func Report($sMsg)
	Local $aRect = _GUICtrlRichEdit_GetRECT($g_hRichEdit)
	$sMsg = $sMsg & @CR & @CR & "Links=" & $aRect[0] & " Oben=" & $aRect[1] & " Rechts=" & $aRect[2] & " Unten=" & $aRect[3]
	GUICtrlSetData($g_idLbl_Msg, $sMsg)
EndFunc   ;==>Report
