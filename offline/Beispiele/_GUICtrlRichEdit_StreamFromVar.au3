#include <GUIConstantsEx.au3>
#include <GuiRichEdit.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $hGui, $iMsg, $idBtn_Next, $iStep = 0, $idLbl_Msg, $hRichEdit, $s
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "Das ist ein Test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$idLbl_Msg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$idBtn_Next = GUICtrlCreateButton("Weiter", 270, 310, 40, 30)
	GUISetState(@SW_SHOW)

	_GUICtrlRichEdit_SetText($hRichEdit, "Erster Abschnitt")
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
						$s = _GUICtrlRichEdit_StreamToVar($hRichEdit)
						GUICtrlSetData($idLbl_Msg, "Gestreamt in Variable")
					Case 2
						_GUICtrlRichEdit_SetText($hRichEdit, "")
						_GUICtrlRichEdit_StreamFromVar($hRichEdit, $s)
						GUICtrlSetData($idLbl_Msg, "Gestreamt aus Variable")
					Case 3
						_GUICtrlRichEdit_SetSel($hRichEdit, 2, 6)
						_GUICtrlRichEdit_StreamFromVar($hRichEdit, $s)
						GUICtrlSetData($idLbl_Msg, "Einfügen an gewählter Position: Ein absichtliches Durcheinander!")
						GUICtrlSetState($idBtn_Next, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Example

