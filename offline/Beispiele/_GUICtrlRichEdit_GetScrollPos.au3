#include <GUIConstantsEx.au3>
#include <GuiRichEdit.au3>
#include <WindowsStylesConstants.au3>

Global $g_idLbl_Msg, $g_hRichEdit

Example()

Func Example()
	Local $hGui = GUICreate("RichEdit: Setzt und ermittelt ide Scrollposition (v" & @AutoItVersion & ")", 460, 350, -1, -1)
	$g_hRichEdit = _GUICtrlRichEdit_Create($hGui, "", 10, 10, 340, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$g_idLbl_Msg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	Local $idBtn_Next = GUICtrlCreateButton("Weiter", 270, 310, 40, 30)
	GUISetState(@SW_SHOW)

	_GUICtrlRichEdit_SetText($g_hRichEdit, "Absatz 1")
	For $i = 2 To 20
		_GUICtrlRichEdit_AppendText($g_hRichEdit, @CRLF & "Absatz " & $i)
	Next
	Report("0. Zuerst ans Ende verschoben, um den Einfügepunkt zu zeigen")

	Local $iMsg, $iStep = 0
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
						_GUICtrlRichEdit_SetScrollPos($g_hRichEdit, 0, 0)
						Report("1. Zum Anfang verschoben")
					Case 2
						_GUICtrlRichEdit_SetScrollPos($g_hRichEdit, 7, 22)
						Report("2. Nach rechts unten verschoben")
						GUICtrlSetState($idBtn_Next, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Example

Func Report($sMsg)
	Local $aPos = _GUICtrlRichEdit_GetScrollPos($g_hRichEdit)
	$sMsg = $sMsg & @CR & @CR & "Die Position ist " & $aPos[0] & ";" & $aPos[1]
	GUICtrlSetData($g_idLbl_Msg, $sMsg)
EndFunc   ;==>Report
