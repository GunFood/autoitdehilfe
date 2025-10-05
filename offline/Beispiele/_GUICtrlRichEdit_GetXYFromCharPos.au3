#include <GUIConstantsEx.au3>
#include <GuiRichEdit.au3>
#include <WindowsStylesConstants.au3>

Global $g_idLbl_Msg

Example()

Func Example()
	Local $hGui, $iMsg, $hRichEdit, $aiPos, $idBtn_Next, $iStep = 0
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "Dies ist ein Test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$g_idLbl_Msg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$idBtn_Next = GUICtrlCreateButton("Weiter", 270, 310, 40, 30)
	GUISetState(@SW_SHOW)

	_GUICtrlRichEdit_AppendText($hRichEdit, @CR & "Dies ist ein angehängter Text.")

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
						$aiPos = _GUICtrlRichEdit_GetXYFromCharPos($hRichEdit, 20)
						Report("1. Die Koordinaten der Zeichenposition 20 sind (" & $aiPos[0] & "," & $aiPos[1] & ")")
					Case 2
						Report("2. Die Zeichenposition bei oder nahe den Koordinaten (" & $aiPos[0] & "," & $aiPos[1] & ")" & @CR & _
								"ist " & _GUICtrlRichEdit_GetCharPosFromXY($hRichEdit, $aiPos[0], $aiPos[1]))
						GUICtrlSetState($idBtn_Next, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Example

Func Report($sMsg)
	GUICtrlSetData($g_idLbl_Msg, $sMsg)
EndFunc   ;==>Report
