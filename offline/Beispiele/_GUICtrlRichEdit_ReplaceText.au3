#include <GUIConstantsEx.au3>
#include <GuiRichEdit.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $hGui = GUICreate("RichEdit: Ersetzt Text (v" & @AutoItVersion & ")", 340, 350, -1, -1)
	Local $hRichEdit = _GUICtrlRichEdit_Create($hGui, "This is a test.", 10, 10, 320, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	Local $idLblMsg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	Local $idBtnNext = GUICtrlCreateButton("Weiter", 270, 310, 40, 30)
	GUISetState(@SW_SHOW)

	_GUICtrlRichEdit_SetText($hRichEdit, "Erster Absatz")
	Local $iMsg, $iStep = 0
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
						_GUICtrlRichEdit_SetSel($hRichEdit, 0, 6)
					Case 2
						_GUICtrlRichEdit_ReplaceText($hRichEdit, "1.")
						GUICtrlSetData($idLblMsg, "Der Text wurde ersetzt")
					Case 3
						_GUICtrlRichEdit_SetSel($hRichEdit, 0, 3)
						_GUICtrlRichEdit_ReplaceText($hRichEdit, "")
						GUICtrlSetData($idLblMsg, '"1." wurde gelöscht')
						GUICtrlSetState($idBtnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Example
