#include <GUIConstantsEx.au3>
#include <GuiRichEdit.au3>
#include <WindowsConstants.au3>

Global $g_idLblMsg, $g_hRichEdit

Example()

Func Example()
	Local $hGui, $iMsg, $iCp, $idBtnNext, $iStep = 0
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$g_hRichEdit = _GUICtrlRichEdit_Create($hGui, "Dies ist ein Test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$g_idLblMsg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$idBtnNext = GUICtrlCreateButton("Weiter", 270, 310, 40, 30)
	GUISetState(@SW_SHOW)

	_GUICtrlRichEdit_SetText($g_hRichEdit, "Erster Absatz")
	Report("Erster Absatz")
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
						_GUICtrlRichEdit_SetParaAlignment($g_hRichEdit, "r")
						Report("Erster Absatz")
					Case 2
						_GUICtrlRichEdit_AppendText($g_hRichEdit, @CR & "Zweiter Absatz")
						_GUICtrlRichEdit_SetParaAlignment($g_hRichEdit, "c")
						Report("Zweiter Absatz")
					Case 3
						_GUICtrlRichEdit_AppendText($g_hRichEdit, @CR & "Dritter Absatz")
						_GUICtrlRichEdit_SetParaAlignment($g_hRichEdit, "l")
						Report("Dritter Absatz")
					Case 4
						$iCp = _GUICtrlRichEdit_GetFirstCharPosOnLine($g_hRichEdit, 2)
						_GUICtrlRichEdit_SetSel($g_hRichEdit, $iCp, -1)
						Report("Ausrichtung der Absätze in der Auswahl")
						GUICtrlSetState($idBtnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Example

Func Report($sMsg)
	$sMsg = $sMsg & @CR & @CR & " Die Rückgaben der Funktion " & @CR & _GUICtrlRichEdit_GetParaAlignment($g_hRichEdit)
	GUICtrlSetData($g_idLblMsg, $sMsg)
EndFunc   ;==>Report
