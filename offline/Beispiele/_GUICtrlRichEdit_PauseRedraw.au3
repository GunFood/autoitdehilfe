#include <GUIConstantsEx.au3>
#include <GuiRichEdit.au3>
#include <WindowsStylesConstants.au3>

Global $g_idLbl_Msg

Example()

Func Example()
	Local $hGui, $iMsg, $idBtn_Next, $hRichEdit, $iStep = 0
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "Dies ist ein Test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$g_idLbl_Msg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$idBtn_Next = GUICtrlCreateButton("Weiter", 270, 310, 40, 30)
	GUISetState(@SW_SHOW)

	_GUICtrlRichEdit_SetText($hRichEdit, "Erster Absatz")
	_GUICtrlRichEdit_PauseRedraw($hRichEdit)
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
						_GUICtrlRichEdit_SetSel($hRichEdit, 5, 2)
						Report("1.Aktualisierung ist pausiert")
					Case 2
						_GUICtrlRichEdit_InsertText($hRichEdit, "EINGEFÜGT_2")
						Report("2.Text wurde am aktiven Punkt der Auswahl eingefügt")
					Case 3
						_GUICtrlRichEdit_GotoCharPos($hRichEdit, 20)
						_GUICtrlRichEdit_InsertText($hRichEdit, "EINGEFÜGT_3")
						Report("3.Text wurde am Einfügungspunkt eingefügt und die Aktualisierung ist wieder aktiviert")
						_GUICtrlRichEdit_ResumeRedraw($hRichEdit)
						GUICtrlSetState($idBtn_Next, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Example

Func Report($sMsg)
	GUICtrlSetData($g_idLbl_Msg, $sMsg)
EndFunc   ;==>Report
