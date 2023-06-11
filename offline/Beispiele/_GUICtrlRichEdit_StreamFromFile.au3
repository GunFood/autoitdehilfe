#include <GUIConstantsEx.au3>
#include <GuiRichEdit.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $hGui, $iMsg, $idBtnNext, $iStep = 0, $idLblMsg, $hRichEdit
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "Das ist ein Test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$idLblMsg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$idBtnNext = GUICtrlCreateButton("Weiter", 270, 310, 40, 30)
	GUISetState(@SW_SHOW)

	_GUICtrlRichEdit_SetText($hRichEdit, "Erster Abschnitt")
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
						_GUICtrlRichEdit_StreamToFile($hRichEdit, @DesktopDir & "\gcre.rtf")
						GUICtrlSetData($idLblMsg, "Gestreamt in Variable")
					Case 2
						_GUICtrlRichEdit_SetText($hRichEdit, "")
						_GUICtrlRichEdit_StreamFromFile($hRichEdit, @DesktopDir & "\gcre.rtf")
						GUICtrlSetData($idLblMsg, "Gestreamt aus Variable")
					Case 3
						_GUICtrlRichEdit_SetSel($hRichEdit, 2, 6)
						_GUICtrlRichEdit_StreamFromFile($hRichEdit, @DesktopDir & "\gcre.rtf")
						GUICtrlSetData($idLblMsg, "Einfügen an gewählter Position: Ein absichtliches Durcheinander!")
						GUICtrlSetState($idBtnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Example
