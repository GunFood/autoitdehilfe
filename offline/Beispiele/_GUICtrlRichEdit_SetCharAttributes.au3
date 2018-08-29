#include <GUIConstantsEx.au3>
#include <GuiRichEdit.au3>
#include <WindowsConstants.au3>

Global $g_idLblMsg, $g_hRichEdit

Example()

Func Example()
	Local $hGui, $iMsg, $idBtnNext, $iStep = 0
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 380, 350, -1, -1)
	$g_hRichEdit = _GUICtrlRichEdit_Create($hGui, "", 10, 10, 360, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$g_idLblMsg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$idBtnNext = GUICtrlCreateButton("Weiter", 330, 310, 40, 30)
	GUISetState(@SW_SHOW)

	_GUICtrlRichEdit_SetText($g_hRichEdit, "Absatz 1 ")
	While True
		$iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				_GUICtrlRichEdit_Destroy($g_hRichEdit) ; wird benötigt, da sonst das Skript abstürzt
;~ 				GUIDelete() 	; ist auch in Ordnung
				Exit
			Case $iMsg = $idBtnNext
				$iStep += 1
				Switch $iStep
					Case 1
						_GUICtrlRichEdit_SetSel($g_hRichEdit, 0, 2)
						_GUICtrlRichEdit_SetCharAttributes($g_hRichEdit, "+un")
						Report("1. Zwei Zeichen unterstrichen")
					Case 2
						_GUICtrlRichEdit_SetSel($g_hRichEdit, 1, 5)
						_GUICtrlRichEdit_SetCharAttributes($g_hRichEdit, "+bo")
						Report("2. Einige Zeichen fett dargestellt")
					Case 3
						; Schreibt den Text in eine Datei auf dem Desktop, um die Einstellungen in Word zu betrachten
						_GUICtrlRichEdit_Deselect($g_hRichEdit)
						_GUICtrlRichEdit_StreamToFile($g_hRichEdit, @DesktopDir & "\gcre.rtf")
						GUICtrlSetState($idBtnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Example

Func Report($sMsg)
	$sMsg = $sMsg & @CR & @CR & _GUICtrlRichEdit_GetCharAttributes($g_hRichEdit)
	GUICtrlSetData($g_idLblMsg, $sMsg)
EndFunc   ;==>Report
