#include <GUIConstantsEx.au3>
#include <GuiRichEdit.au3>
#include <WindowsStylesConstants.au3>

Global $g_idLbl_Msg, $g_hRichEdit

Example()

Func Example()
	Local $hGui, $iMsg, $idBtn_Next, $iStep = 0
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$g_hRichEdit = _GUICtrlRichEdit_Create($hGui, "", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$g_idLbl_Msg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$idBtn_Next = GUICtrlCreateButton("Weiter", 270, 310, 40, 30)
	GUISetState(@SW_SHOW)

	For $i = 1 To 20
		_GUICtrlRichEdit_AppendText($g_hRichEdit, "Zeile " & $i & @CR)
	Next
	_GUICtrlRichEdit_AppendText($g_hRichEdit, "Zeile 21")

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
						DoIt("lu", "Eine Zeile nach oben gescrollt.")
					Case 2
						DoIt("pu", "Eine Seite nach oben gescrollt.")
					Case 3
						DoIt("pd", "Eine Seite nach unten gescrollt.")
					Case 4
						DoIt("pd", "Versuch, um eine weitere Seite zu scrollen.")
						GUICtrlSetState($idBtn_Next, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Example

Func DoIt($sAction, $sMsg)
	Local $iQlines
	$iQlines = _GUICtrlRichEdit_ScrollLineOrPage($g_hRichEdit, $sAction)
	GUICtrlSetData($g_idLbl_Msg, $sMsg & @CR & @CR & "Gescrollt um " & $iQlines & " Zeilen.")
EndFunc   ;==>DoIt
