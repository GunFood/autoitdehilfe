#include <GUIConstantsEx.au3>
#include <GuiRichEdit.au3>
#include <WindowsConstants.au3>

Global $g_idLblMsg

Example()

Func Example()
	Local $hGui, $iMsg, $aiSel, $idBtnNext, $hRichEdit, $iStep = 0
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "Das ist ein Test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$g_idLblMsg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$idBtnNext = GUICtrlCreateButton("Weiter", 270, 310, 40, 30)
	GUISetState(@SW_SHOW)

	While True
		$iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				_GUICtrlRichEdit_Destroy($hRichEdit) ; wird benötigt, da sonst das Skript abstürzt
;~ 				GUIDelete() 	; ist auch in Ordnung
				Exit
			Case $iMsg = $idBtnNext
				$iStep += 1
				Switch $iStep
					Case 1
						_GUICtrlRichEdit_SetSel($hRichEdit, 5, 12)
						$aiSel = _GUICtrlRichEdit_GetSel($hRichEdit)
						Report("1.Selektierter Text von Position  " & $aiSel[0] & " bis " & $aiSel[1])
					Case 2
						_GUICtrlRichEdit_Deselect($hRichEdit)
						$aiSel = _GUICtrlRichEdit_GetSel($hRichEdit)
						If $aiSel[0] = $aiSel[1] Then Report("2.Jetzt ist kein Text mehr selektiert")
						GUICtrlSetState($idBtnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Example

Func Report($sMsg)
	GUICtrlSetData($g_idLblMsg, $sMsg)
EndFunc   ;==>Report
