#include <GUIConstantsEx.au3>
#include <GuiRichEdit.au3>
#include <WindowsStylesConstants.au3>

Global $g_idLbl_Msg, $g_hRichEdit

Example()

Func Example()
	Local $hGui, $iMsg, $idBtn_Next, $iStep = 0
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$g_hRichEdit = _GUICtrlRichEdit_Create($hGui, "Dies ist ein Test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$g_idLbl_Msg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$idBtn_Next = GUICtrlCreateButton("Weiter", 270, 310, 40, 30)
	GUISetState(@SW_SHOW)

	Report("Status nach Erstellung:")

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
						_GUICtrlRichEdit_SetPasswordChar($g_hRichEdit, "*")
						Report("Passwortzeichen geändert. Gib etwas ein.")
					Case 2
						_GUICtrlRichEdit_SetPasswordChar($g_hRichEdit, "")
						Report("Zurück geändert.")
						GUICtrlSetState($idBtn_Next, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Example

Func Report($sMsg)
	Local $ch
	$ch = _GUICtrlRichEdit_GetPasswordChar($g_hRichEdit)
	If $ch = "" Then
		$sMsg &= @CR & "Zeichen werden angezeigt, wie sie getippt wurden."
	Else
		$sMsg = $sMsg & @CR & 'Zeichen werden als " ' & $ch & ' " angezeigt'
	EndIf
	GUICtrlSetData($g_idLbl_Msg, $sMsg)
EndFunc   ;==>Report
