#include <GUIConstantsEx.au3>
#include <GuiRichEdit.au3>
#include <WindowsConstants.au3>

Global $g_idLblMsg

Example()

Func Example()
	Local $hGui = GUICreate("RichEdit: Setzt und ermittelt die Abstände (v" & @AutoItVersion & ")", 460, 350, -1, -1)
	Local $hRichEdit = _GUICtrlRichEdit_Create($hGui, "This is a test.", 10, 10, 340, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$g_idLblMsg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	Local $idBtnNext = GUICtrlCreateButton("Next", 270, 310, 40, 30)
	GUISetState(@SW_SHOW)

	_GUICtrlRichEdit_SetText($hRichEdit, "Absatz 1")
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
						Report("1. Anfängliche Einstellung")
					Case 2
						_GUICtrlRichEdit_SetSpaceUnit("cm")
						Report("2. Neue Einstellung")
						GUICtrlSetState($idBtnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Example

Func Report($sMsg)
	$sMsg = $sMsg & @CR & _GUICtrlRichEdit_GetSpaceUnit()
	GUICtrlSetData($g_idLblMsg, $sMsg)
EndFunc   ;==>Report
